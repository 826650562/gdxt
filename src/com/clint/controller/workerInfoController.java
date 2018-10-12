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

import com.clint.service.HomeService;

import antlr.StringUtils;
import net.sf.json.JSONObject;

 

@Controller
@RequestMapping(value = "/workerInfomation")
public class workerInfoController {

	@Resource
	private HomeService homeService;
  
	
	
	
	//维修工人填写表单
	@RequestMapping(value = "/workerInfo")
	public void workerInfo(HttpServletRequest req,HttpServletResponse reponse,Model model) throws IOException {
		 String name=req.getParameter("_name");
		 String sex=req.getParameter("_sex");
		 String yearsOfWork=req.getParameter("_yearsOfWork");
		 String majorIn=req.getParameter("_majorIn");
		 String phoneNum=req.getParameter("_phoneNum");
		 String uuid = UUID.randomUUID().toString();
			 try {
				 	homeService.workerInfo(uuid,name,sex,yearsOfWork,phoneNum,majorIn);
				  	PrintWriter  pw =	reponse.getWriter();
					  pw.write("填表成功");

				} catch (IOException e1) {
					  PrintWriter  pw =	reponse.getWriter();
					  pw.write("填表失败"); 
				}
	}
		

 
}
 