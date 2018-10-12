package com.clint.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clint.service.HomeService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/home")
public class homeController {

	@Resource
	private HomeService homeService;

	// private JdbcTemplate jdbcTemplate;
	// 首页
	@RequestMapping(value = "/index")
	public String page() {
		return "pages/index";
	}

	// console页面
	@RequestMapping(value = "/console")
	public String console() {
		return "pages/console";
	}

	// 工单登陆页面
	@RequestMapping(value = "/orderLogin")
	public String orderLogin() {
		return "pages/orderLogin";
	}
	
	// 提交维修人员信息页面
	@RequestMapping(value = "/orderWorker")
	public String orderWorker() {
		return "pages/orderWorker";
	}
	
	// 显示维修人员列表
	@RequestMapping(value = "/showorderWorkerList")
	public void showorderWorkerList(HttpServletRequest req,HttpServletResponse reponse) {
		List managerBack =  this.homeService.showorderWorkerList();
	
		    JSONArray json = JSONArray.fromObject(managerBack);
		     try {
			  PrintWriter  pw =	reponse.getWriter();
			  pw.write(String.valueOf(json));
			} catch (IOException e1) {
				e1.printStackTrace();
			}
	}
	
	//显示维修工人工作类型
	@RequestMapping(value = "/showWorkerType")
	public void showWorkerType(HttpServletRequest req,HttpServletResponse reponse) {
		List typeBack =  this.homeService.showWorkerType();
	
		    JSONArray json = JSONArray.fromObject(typeBack);
		     try {
			  PrintWriter  pw =	reponse.getWriter();
			  pw.write(String.valueOf(json));
			} catch (IOException e1) {
				e1.printStackTrace();
			}
	}
		
	// 提交维修主管列表
	@RequestMapping(value = "/orderManageList")
	public String orderManageList(HttpServletResponse reponse) {
		return "pages/orderManageList";
	}
	
	@RequestMapping(value = "/showorderManageList")
	public void showorderManageList(HttpServletRequest req,HttpServletResponse reponse) {
		List managerBack =  this.homeService.showorderManageList();
	
		    JSONArray json = JSONArray.fromObject(managerBack);
		     try {
			  PrintWriter  pw =	reponse.getWriter();
			  pw.write(String.valueOf(json));
			} catch (IOException e1) {
				e1.printStackTrace();
			}
	}
	
	@RequestMapping(value = "/showmanagerEdit")
	public void showmanagerEdit(HttpServletRequest req,HttpServletResponse reponse) {
		String id = req.getParameter("_id");
		List managerBack =  this.homeService.showManagerEdit(id);
	
		    JSONArray json = JSONArray.fromObject(managerBack);
		     try {
			  PrintWriter  pw =	reponse.getWriter();
			  pw.write(String.valueOf(json));
			} catch (IOException e1) {
				e1.printStackTrace();
			}
	}
	
	// 删除维修主管单条数据
	@RequestMapping(value = "/managerDel")
	public void managerDel(HttpServletRequest req,HttpServletResponse reponse) {
		String id = req.getParameter("_id");
		boolean managerBack =  this.homeService.managerDel(id);
		    JSONArray json = JSONArray.fromObject(managerBack);
		     try {
		      if(managerBack==true){
		    	  PrintWriter  pw =	reponse.getWriter();
				  pw.write("成功删除此条目");
		      }
		      else{
		    	  PrintWriter  pw =	reponse.getWriter();
				  pw.write("删除失败");
		      }
			} catch (IOException e1) {
				e1.printStackTrace();
			}
	}
	
	// 提交维修人员列表
	@RequestMapping(value = "/orderworkerList")
	public String orderworkerList() {
		return "pages/orderworkerList";
	}

	// 工单登记页面
	@RequestMapping(value = "/orderReg")
	public String orderReg(Model model) {
		// 工单类别
		List<?> typeList = this.homeService.getTypeList();
		JSONArray typeArray = JSONArray.fromObject(typeList);

		// 报修渠道
		List<?> wayList = this.homeService.getWayList();
		JSONArray wayArray = JSONArray.fromObject(wayList);

		model.addAttribute("typeArr", typeArray);
		model.addAttribute("wayArray", wayArray);

		return "pages/orderReg";
	}

	// 工单列表页面
	@RequestMapping(value = "/orderList")
	public String orderList(Model  model) {
	     //获取所有的 保修列表
		List  bxList=homeService.queryBxList("null");
		List  GDStatusList = homeService.queryAllGDStatus();
		JSONArray bxListJson = JSONArray.fromObject(bxList);
		JSONArray GDStatusListJson = JSONArray.fromObject(GDStatusList);
		model.addAttribute("listOfBx", bxListJson);
		model.addAttribute("listOfStatus", GDStatusListJson);
		return "pages/orderList";
	}

	// 工单详情页面
	@RequestMapping(value = "/orderDetail")
	public String orderDetail(HttpServletRequest req, HttpServletResponse reponse,Model  model) {
		String id = req.getParameter("id");
		JSONArray ListJson = JSONArray.fromObject( this.homeService.queryBxList(id));
		List<?> wayList = this.homeService.getWayList();
		JSONArray wayArray = JSONArray.fromObject(wayList);
		
		model.addAttribute("bxListJson", ListJson);
		
		model.addAttribute("wayArrayJson", wayArray);
		return "pages/orderDetail";
	}

	// 工单派发页面
	@RequestMapping(value = "/orderDistribute")
	public String orderDistribute(HttpServletRequest req, HttpServletResponse reponse,Model model) {
	    String work_id=String.valueOf(req.getParameter("work_id"));
	    
		List<?> list = this.homeService.getManageArea();
		JSONArray areaArr = JSONArray.fromObject(list);
		
		model.addAttribute("areaArr",areaArr);
		model.addAttribute("work_id",work_id);
		return "pages/orderDistribute";
	}

	//生成工单编号
	@RequestMapping(value = "/getOrderNumber")
	public void getOrderNumber(HttpServletRequest req, HttpServletResponse reponse) {

		String uuid = homeService.getUUID();
		String numString = "GD" + StringUtils.substring(uuid, 0, 10);
		
		JSONObject obj = new JSONObject();
		obj.put("orderNum", numString);
		
		try {
			reponse.getWriter().write(String.valueOf(obj));
		} catch (IOException e1) {
			e1.printStackTrace();
		}

	}
	
	

	//搜索使用 按关键词搜索
	@RequestMapping(value = "/searchOfContent")
	public void searchOfContent(HttpServletRequest req,HttpServletResponse reponse) {
	   String minxa=String.valueOf(req.getParameter("minxAttribute"));
	   JSONArray ListJson = JSONArray.fromObject(homeService.queryBxListBySearch(minxa));
			try {
				reponse.getWriter().write(String.valueOf(ListJson));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	//根据工单状态进行搜索
	@RequestMapping(value = "/searchOfContentByStatus")
	public void searchOfContentByStatus(HttpServletRequest req,HttpServletResponse reponse) {
	   String _id=String.valueOf(req.getParameter("_id"));
	   JSONArray ListJson = JSONArray.fromObject(homeService.queryBxListByStatus(_id));
			try {
				reponse.getWriter().write(String.valueOf(ListJson));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	//根据工单的所有的状态
	@RequestMapping(value = "/queryStatusByOrderId")
	public void queryStatusByOrderId(HttpServletRequest req,HttpServletResponse reponse) {
	   String _id=String.valueOf(req.getParameter("_id"));
	   JSONArray ListJson = JSONArray.fromObject(homeService.queryStatusByOrderId(_id));
			try {
				reponse.getWriter().write(String.valueOf(ListJson));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	
	
	
			
	//存储工单	
	@RequestMapping(value = "/sendOrder")
	public void sendOrder(HttpServletRequest req, HttpServletResponse reponse) {

		String ordertype = req.getParameter("ordertype");
		String dateTime = req.getParameter("dateTime");
		String orderAddress = req.getParameter("orderAddress");
		String orderPhone = req.getParameter("orderPhone");
		String wayType = req.getParameter("wayType");
		String orderNum = req.getParameter("orderNum");
		String troubleDes = req.getParameter("troubleDes");
		
		int num = this.homeService.getOrderByOrderNum(orderNum,dateTime,orderPhone);
		JSONObject obj = new JSONObject();
		
		boolean bol ;
		if(num>0){
			obj.put("has", "工单已存在！");
		}else {
			bol = this.homeService.setOrder(ordertype,dateTime,orderAddress,orderPhone,wayType,orderNum,troubleDes);
			num = this.homeService.getOrderByOrderNum(orderNum,dateTime,orderPhone);
			if(bol && num>0){
				obj.put("success", "工单生成成功！");
			}
		}		
		
		try {
			reponse.getWriter().write(String.valueOf(obj));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	//获取主管人员列表
	@RequestMapping(value = "/getVisorList")
	public void getVisorList(HttpServletRequest req,HttpServletResponse reponse) {
	   String area=String.valueOf(req.getParameter("area"));
	   JSONArray list = JSONArray.fromObject(homeService.getVisorList(area));
			try {
				reponse.getWriter().write(String.valueOf(list));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	//派发订单给维修主管
	@RequestMapping(value = "/sendWorkOrderTomanager")
	public void sendWorkOrderTomanager(HttpServletRequest req,HttpServletResponse reponse) throws IOException   {
	   String workOrderId=String.valueOf(req.getParameter("workOrderId"));
	   String managerId=String.valueOf(req.getParameter("managerId"));
	    try {
			  homeService.insertWorkOrderToStatus(workOrderId,managerId);
			  reponse.getWriter().write("100010");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				  reponse.getWriter().write("100011");
				e.printStackTrace();
			}
	}

}
