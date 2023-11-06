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

	@RequestMapping("/login/fing-id")
	public String fingid(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "user/FingID";
		model.addAttribute("main" , main);
		return "Index";
	}
	
	@RequestMapping("/login/fing-password")
	public String fingpassword(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "user/FingPassword";
		model.addAttribute("main" , main);
		return "Index";
	}
	
	@RequestMapping("/login/fing-id/by-phone-number")
	public String phonenumberid(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "user/PhoneNumID";
		model.addAttribute("main" , main);
		return "Index";
	}
	
	@RequestMapping("/login/fing-id/by-email-address")
	public String emailaddressid(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "user/EmailID";
		model.addAttribute("main" , main);
		return "Index";
	}
	
	@RequestMapping("/login/fing-password/by-phone-number")
	public String phonenumberpwd(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "user/PhoneNumPwd";
		model.addAttribute("main" , main);
		return "Index";
	}
	
	@RequestMapping("/login/fing-password/by-email-address")
	public String emailaddresspwd(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "user/EmailPwd";
		model.addAttribute("main" , main);
		return "Index";
	}
	
	@RequestMapping("/my-page")
	public String mypage(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "user/MyPage";
		model.addAttribute("main" , main);
		return "Index";
	}
	
	@RequestMapping("/cart")
	public String cart(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "user/Cart";
		model.addAttribute("main" , main);
		return "Index";
	}
}


