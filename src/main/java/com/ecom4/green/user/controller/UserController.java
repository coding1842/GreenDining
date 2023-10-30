package com.ecom4.green.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController {
	
	@RequestMapping("/login")
	public String login(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "user/Login";
		model.addAttribute("main" , main);
		return "Index";
	}
	
	@RequestMapping("/sign-up")
	public String sign_up(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "user/SignUp";
		model.addAttribute("main" , main);
		return "Index";
	}
	
	@RequestMapping("/sign-up/customer")
	public String User(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "user/CustomerSignUp";
		model.addAttribute("main" , main);
		return "Index";
	}
	
	@RequestMapping("/sign-up/business")
	public String business(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "merchant/BusinessSignUp";
		model.addAttribute("main" , main);
		return "Index";
	}

}


