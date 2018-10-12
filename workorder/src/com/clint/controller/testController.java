package com.clint.controller;
 
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
 
@Controller
@RequestMapping(value = "/test")
public class testController {
 
	@RequestMapping(value = "/login")
	public String login(HttpSession session, String username, String password) throws Exception {
		System.out.println("-----login------");
		// 在Session里保存信息
		session.setAttribute("username", username);
		// 重定向
		return "hello";
	}
 
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) throws Exception {
		// 清除Session
		session.invalidate();
 
		return "hello";
	}
	@RequestMapping(value = "/index")
	public String index(HttpSession session) throws Exception {
		// 重定向
		System.out.println(111);
		return "index";
	}
 
}
