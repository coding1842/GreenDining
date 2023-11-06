package com.ecom4.green.merchant.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecom4.green.merchant.controller.ProductController;
import com.ecom4.green.merchant.dto.ProductDTO;
import com.ecom4.green.merchant.service.ProductService;

@RequestMapping("/item")
@Controller
public class ProductController {

	private static final Logger logger 
	  = LoggerFactory.getLogger(ProductController.class) ;
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("/write")
	public String write(HttpServletRequest req,
						              HttpServletResponse resp,
						              Model model,
						              @ModelAttribute("product") ProductDTO pdto) {
//		String main = "ProductRegistraion";
//		model.addAttribute("main", main);
		return "merchant/ProductRegistraion";
	}
	
	@RequestMapping("/edit")
	public String edit(HttpServletRequest req,
			HttpServletResponse resp,
			Model model,
			@ModelAttribute("product") ProductDTO pdto) {
//		String main = "ProductRegistraion";
//		model.addAttribute("main", main);
		return "merchant/ProductEdit";
	}
	
	@RequestMapping("/main")
	public String main(HttpServletRequest req,
			HttpServletResponse resp,
			Model model,
			@ModelAttribute("product") ProductDTO pdto) {
		String main = "Main";
		model.addAttribute("main", main);
		return "merchant/Index";
	}
	
	@RequestMapping("/request")
	public String request(HttpServletRequest req,
							HttpServletResponse res) {
		
		return "merchant/ProductReturn";
	}
	
}













