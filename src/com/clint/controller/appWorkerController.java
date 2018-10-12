package com.clint.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clint.service.AppService;

import antlr.StringUtils;
import jdk.nashorn.internal.runtime.Context.ThrowErrorManager;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

 

@Controller
@RequestMapping(value = "/appWorker")
public class appWorkerController {

	@Resource
	private AppService appService;
  		
	// 首页
	@RequestMapping(value = "/index")
	public String page(HttpServletRequest req) {
		req.getSession().setAttribute("id", "670d5db5-b481-44ad-90a2-6e33d49667f6");
		return "app-worker/login"; 
	}
	
	
	// 维修工人工单列表未处理状态工单
	@RequestMapping(value = "/orderList")
	public String orderList(Model model,HttpServletRequest req,HttpServletResponse response) {
		String id = (String) req.getSession().getAttribute("id");
		List orderList = this.appService.getWOrkerOrderList(id,"0");
		JSONArray orderArr = JSONArray.fromObject(orderList);
		
		List statusList = this.appService.getStatusTwoList();
		JSONArray statusArr = JSONArray.fromObject(statusList);
		
		
		model.addAttribute("orderArr",orderArr);
		model.addAttribute("statusArr",statusArr);
		return "app-worker/orderList";
	}
	
	// 维修工人工单列表状态工单列表
	@RequestMapping(value = "/orderListOther")
	public void orderListOther(Model model,HttpServletRequest req,HttpServletResponse response) {
		String id = (String) req.getSession().getAttribute("id");
		String status = req.getParameter("status");
		List orderList = this.appService.getWOrkerOrderList(id,status);
		JSONArray orderArr = JSONArray.fromObject(orderList);
		
		JSONObject obj = new JSONObject();
		obj.put("orderArr",orderArr);
				
		try {
		  response.getWriter().write(String.valueOf(obj));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	// 工单详情
	@RequestMapping(value = "/orderDetail")
	public String orderDetail(Model model,HttpServletRequest req,HttpServletResponse response) {
		String id = req.getParameter("id");
		//String status = req.getParameter("status");
		String manageId = req.getParameter("manageId");
		String workerId = (String) req.getSession().getAttribute("id");
		
		List orderDetailList = this.appService.getOrderDetailById(id);
		JSONArray orderDetailArr = JSONArray.fromObject(orderDetailList);
		

		String statusOne = (String) orderDetailArr.getJSONObject(0).get("ORDERSTATUS_ONE");
		String statusTwo = (String) orderDetailArr.getJSONObject(0).get("ORDERSTATUS_TWO");
		
		model.addAttribute("orderDetailArr",orderDetailArr);
		model.addAttribute("orderId",id);
		model.addAttribute("manageId",manageId);
		model.addAttribute("statusOne",statusOne);
		model.addAttribute("statusTwo",statusTwo);
			
		return "app-worker/orderDetail";
	}
	
	//维修工人接单	
	@RequestMapping(value = "/workerAccept")
	public void workerAccept(Model model,HttpServletRequest req,HttpServletResponse response) {
		String orderId = req.getParameter("orderId");
		String manageId = req.getParameter("manageId");
		String workerId = (String) req.getSession().getAttribute("id");
		String date = req.getParameter("date");
		
		List ordeStatusList = this.appService.getOrderStatusById(orderId);
		
		JSONObject obj = new JSONObject();
		
		if(ordeStatusList.size()>0){
			obj.put("error", "当前工单已接单！");
		}else{
			this.appService.setOrderWorkerStatus(orderId,manageId,workerId,date);
			obj.put("success", "接单成功！");
		}
		
		try {
			response.getWriter().write(String.valueOf(obj));
		}  catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	// 维修进度
	@RequestMapping(value = "/repairProgress")
	public String repairProgress() {
		return "app-worker/repairProgress";
	}
	
	// 打开申请结单 申请退单页面
	@RequestMapping(value = "/backOrComplete")
	public String completion(Model model,HttpServletRequest req,HttpServletResponse response) {
		String status = req.getParameter("statusId");
		String orderId = req.getParameter("orderId");
		String manageId = req.getParameter("manageId");
		
		
		model.addAttribute("status",status);
		model.addAttribute("orderId",orderId);
		model.addAttribute("manageId",manageId);		
		
		return "app-worker/backOrComplete";
	}
	
	
	//维修工人退单 结单
	
	@RequestMapping(value = "/setOrderWorkerStatus")
	public void setOrderWorkerStatus(Model model,HttpServletRequest req,HttpServletResponse response) throws IOException {
		String status = req.getParameter("status");
		String orderId = req.getParameter("orderId");
		String manageId = req.getParameter("manageId");
		String date = req.getParameter("date");
		String detail = req.getParameter("detail");
		String workerId = (String) req.getSession().getAttribute("id");
	
		JSONObject obj = new JSONObject();
		
		List<?> newStatusList = this.appService.getOrderSatusDetailById(orderId,workerId);
		JSONArray newStatusArr = JSONArray.fromObject(newStatusList);
		String statusString = (String) newStatusArr.getJSONObject(0).get("ORDERSTATUS_TWO");
		
		if(statusString.indexOf("2")>=0||statusString.indexOf("3")>=0){
			obj.put("error", "该工单已处理!");
		}else{
			this.appService.setOrderWorkerDetail(orderId, manageId, workerId, date,status,detail);
			obj.put("success", "提交成功！");
		}		
		
		try {			
			response.getWriter().write(String.valueOf(obj));
		}  catch (IOException e1) {
			obj.put("error", "提交失败！");
			response.getWriter().write(String.valueOf(obj));
		}
	}

}
 