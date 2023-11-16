package com.ecom4.green.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController {

	@RequestMapping("/my-page")
	public String mypage(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "user/view/MyPage";
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
	
	@RequestMapping("/request")
	public String request(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "user/form/ReturnProductForm";
		model.addAttribute("main", main);
		return "Index";
	}

	@RequestMapping("/OrderPaymentForm")
	public String OrderPaymentForm(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "user/form/OrderPaymentForm";
		model.addAttribute("main", main);
		return "Index";
	}
	
	
}


