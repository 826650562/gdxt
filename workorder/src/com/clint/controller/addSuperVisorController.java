package com.clint.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.clint.service.HomeService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/addSuperVisor")
public class addSuperVisorController {

	@Resource
	private HomeService homeService;

	// private JdbcTemplate jdbcTemplate;
	// 添加维修主管页面
	@RequestMapping(value = "/index")
	public String page(Model model,HttpServletRequest req,HttpServletResponse response) {
		
		String id = req.getParameter("id");
		
		if(StringUtils.hasText(id)){
			List<?> manageList = this.homeService.getManageById(id);
			JSONArray manageArr = JSONArray.fromObject(manageList);
			model.addAttribute("manageArr",manageArr);
		}
				
		List<?> list = this.homeService.getManageArea();
		JSONArray areaArr = JSONArray.fromObject(list);
		
		model.addAttribute("areaArr",areaArr);
		return "pages/addSuperVisor";
	}
	
	// 添加维修主管页面
	@RequestMapping(value = "/setVisor")
	public void setVisor(HttpServletRequest req,HttpServletResponse response) {
		
		String name = req.getParameter("name");
		String sex = req.getParameter("sex");
		String phone = req.getParameter("phone");
		String area = req.getParameter("area");
		
		JSONObject obj = new JSONObject();
		List<?> list = this.homeService.getVisor(name,area);
		
		
		if(list.size()>0){
			obj.put("error", "主管信息已存在！");
		}else{
			boolean bol = this.homeService.setVisor(name,sex,phone,area);						
			obj.put("success", "主管信息插入成功！");
		}		
		
		try {
			response.getWriter().write(String.valueOf(obj));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	//修改主管信息
	@RequestMapping(value = "/updateVisor")
	public void updateVisor(HttpServletRequest req,HttpServletResponse response) {
		
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String sex = req.getParameter("sex");
		String phone = req.getParameter("phone");
		String area = req.getParameter("area");
		
		JSONObject obj = new JSONObject();
		
		
		boolean bol = this.homeService.updateVisor(id,name,sex,phone,area);						
		obj.put("success", "主管信息更新成功！");		
		
		try {
			response.getWriter().write(String.valueOf(obj));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	
	
}
