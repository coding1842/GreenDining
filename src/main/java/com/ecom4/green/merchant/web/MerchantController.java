package com.ecom4.green.merchant.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MerchantController {

	@RequestMapping("/sMain")
	public String sMain(HttpServletRequest req,
						HttpServletResponse resp , Model model) {
		String main = "sMain";
		model.addAttribute("main", main);
		
		return "sMain";
		
	}
}
