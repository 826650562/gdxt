package com.clint.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.lang.jstl.Literal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clint.service.AppService;

import antlr.StringUtils;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/appManage")
public class appManageController {

	@Resource
	private AppService appService;

	// 首页
	@RequestMapping(value = "/index")
	public String page(HttpServletRequest req) {
		req.getSession().setAttribute("manageId", "87c37971294a4e04a66bfd23f0a8f377");
		return "app-manage/login";
	}

	// 工单列表
	@RequestMapping(value = "/orderList")
	public String orderList(Model model, HttpServletRequest req, HttpServletResponse response) {
		String id = (String) req.getSession().getAttribute("manageId");
		List orderList = this.appService.getOrderList(id);
		JSONArray orderArr = JSONArray.fromObject(orderList);

		for (int i = 0; i < orderArr.size(); i++) {
			String _id = String.valueOf(orderArr.getJSONObject(i).get("NUM"));
			List statusList = getStatusOfAll(_id);

			Object statusOne = statusList.get(0);
			Object statusTwo = statusList.get(1);

			orderArr.getJSONObject(i).put("statusOne", statusOne);
			orderArr.getJSONObject(i).put("statusTwo", statusTwo);
		}

		model.addAttribute("orderArr", orderArr);

		return "app-manage/orderList";
	}

	private List getStatusOfAll(String id) {
		List<?> statusList = this.appService.getOrderSatusDetailById2(id);
		JSONArray statusArray = JSONArray.fromObject(statusList);
		List<Object> resList = new ArrayList<Object>();
		resList.add(statusArray.getJSONObject(0).get("STATUSONE"));
		resList.add(statusArray.getJSONObject(0).get("STATUSTWO"));
		resList.add(statusArray.getJSONObject(0).get("DETAIL"));
		return resList;
	}

	// 工单详情
	@RequestMapping(value = "/orderDetail")
	public String orderDetail(Model model, HttpServletRequest req, HttpServletResponse response) {
		String id = req.getParameter("id");
		List<?> orderDetailList = this.appService.getOrderDetailById(id);
		JSONArray orderDetailArr = JSONArray.fromObject(orderDetailList);
		/*
		 * List statusList= getStatusOfAll(id);
		 * 
		 * Object statusOne = statusList.get(0); Object statusTwo =
		 * statusList.get(1); Object detail = statusList.get(2);
		 * 
		 * System.out.println(String.valueOf(statusTwo));
		 * if(!String.valueOf(statusTwo).endsWith("无状态")){
		 * orderDetailArr.getJSONObject(0).put("statusName", statusTwo);
		 * orderDetailArr.getJSONObject(0).put("detail", detail); }else{
		 * orderDetailArr.getJSONObject(0).put("statusName", "无");
		 * orderDetailArr.getJSONObject(0).put("detail", "无"); }
		 */

		model.addAttribute("statusOne", orderDetailArr.getJSONObject(0).get("ORDERSTATUS_ONE"));
		model.addAttribute("statusTwo", orderDetailArr.getJSONObject(0).get("ORDERSTATUS_TWO"));
		model.addAttribute("orderDetailArr", orderDetailArr);
		return "app-manage/orderDetail";
	}

	// 工单派发
	@RequestMapping(value = "/orderPayout")
	public String orderPayout(Model model, HttpServletRequest req, HttpServletResponse response) {
		String orderId = req.getParameter("id");
		List list = this.appService.getWorkerList();
		JSONArray workerArray = JSONArray.fromObject(list);

		model.addAttribute("orderId", orderId);
		model.addAttribute("workerArray", workerArray);
		return "app-manage/orderPayout";
	}

	// 维修进度
	@RequestMapping(value = "/repairProgress")
	public String repairProgress() {
		return "app-manage/repairProgress";
	}

	// 维修主管工单派发按钮
	@RequestMapping(value = "/setWorker")
	public void setWorker(Model model, HttpServletRequest req, HttpServletResponse response) {
		String manageId = (String) req.getSession().getAttribute("manageId");
		String orderId = req.getParameter("orderId");
		String worker = req.getParameter("worker");
		String time = req.getParameter("date");

		JSONObject obj = new JSONObject();
		/*
		 * List workerList = this.appService.getOrderWorker(orderId,"2");
		 * 
		 * if(workerList.size()>0){ obj.put("error","当前工单已派发！"); }else{
		 * this.appService.setOrderWorker(manageId,orderId,time,worker,"2");
		 * obj.put("success","工单派发成功!"); }
		 */

		// List workerList =
		// this.appService.getOrderSatusDetailById(orderId,"");
		List workerList = this.appService.getOrderDetailById(orderId);
		JSONArray workerArray = JSONArray.fromObject(workerList);
		String statusOne = (String) workerArray.getJSONObject(0).get("ORDERSTATUS_ONE");
		if (statusOne.indexOf("1") >= 0) {
			this.appService.setOrderWorker(manageId, orderId, time, worker, "2");
			obj.put("success", "工单派发成功!");
		} else if (statusOne.indexOf("3") >= 0) {
			String statusTwo = (String) workerArray.getJSONObject(0).get("ORDERSTATUS_TWO");
			if (statusTwo.indexOf("3") >= 0) {
				this.appService.setOrderWorker(manageId, orderId, time, worker, "3");
				obj.put("success", "工单派发成功!");
			} else {
				obj.put("error", "当前工单已派发！");
			}
		} else {
			obj.put("error", "当前工单已派发！");
		}

		try {
			PrintWriter pw = response.getWriter();
			pw.write(String.valueOf(obj));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	// 结单
	@RequestMapping(value = "/orderComplete")
	public void orderComplete(Model model, HttpServletRequest req, HttpServletResponse response) {
		String manageId = (String) req.getSession().getAttribute("manageId");
		String orderId = req.getParameter("id");
		String workerId = req.getParameter("workerId");

		JSONObject obj = new JSONObject();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String now= df.format(new Date());
		System.out.println( now);// new Date()为获取当前系统时间
		
		List workerList = this.appService.getOrderDetailById(orderId);
		JSONArray workerArray = JSONArray.fromObject(workerList);
		String statusOne = (String) workerArray.getJSONObject(0).get("ORDERSTATUS_ONE");
		String statusTwo = (String) workerArray.getJSONObject(0).get("ORDERSTATUS_TWO");
		
		if (statusOne.indexOf("4") >= 0 ||statusTwo.indexOf("4") >= 0 ) {
			obj.put("error", "当前工单已结单！");
		}else {
			this.appService.setOrderComplete(manageId, orderId, now, workerId);
			obj.put("success", "结单成功!");
			
		}

		try {
			PrintWriter pw = response.getWriter();
			pw.write(String.valueOf(obj));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

}
