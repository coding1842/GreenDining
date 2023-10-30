package com.ecom4.green.merchant.controller; 
 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestMapping; 
 
@Controller 
public class MerchantController { 
 
	@RequestMapping("/main") 
	public String main(HttpServletRequest req, 
						HttpServletResponse resp , Model model) { 
		String main = "StoreMain";
		model.addAttribute("main", main);
		
		return "merchant/Index"; 	 
	}
	
	@RequestMapping("/detail")
	public String detail(HttpServletRequest req, 
						HttpServletResponse resp , Model model) {
		String main = "ProductDetail";
		model.addAttribute("main", main);
		
		return "merchant/Index";
	}
		
} 
