package com.ecom4.green.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String index(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
	        String main = null;
		main = "Main";
		model.addAttribute("main", main);
		return "Index";
	}

	@RequestMapping("/np/best-item")
	public String bestProductList(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
	        String main = null;
	        main = "public/view/BestItemList";
	        model.addAttribute("main", main);
	        return "Index";
	}

        @RequestMapping("/np/best-region")
        public String bestRegionList(HttpServletRequest req, HttpServletResponse resp , Model model)
        {
	      String main = null;
	      main = "public/view/BestRegionList";
	      model.addAttribute("main", main);
	      return "Index";
        }


        @RequestMapping("/np/search")
        public String search(HttpServletRequest req, HttpServletResponse resp , Model model)
        {
	      String main = null;
	      main = "public/view/Search";
	      model.addAttribute("main", main);
	      return "Index";
        }
}
