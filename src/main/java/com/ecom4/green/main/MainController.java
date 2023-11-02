package com.ecom4.green.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/index")
	public String index(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "Main";
		model.addAttribute("main", main);
		return "Index";
	}

	@RequestMapping("/np/best")
	public String Best(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
	        String main = "view/Best";
	        model.addAttribute("main", main);
	        return "Index";
	}
	
}
