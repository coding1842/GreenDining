

package com.ecom4.green.merchant.controller; 
 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestMapping; 
 
@Controller 
@RequestMapping("/merchant")
public class MerchantController { 
 
	@RequestMapping("/store") 
	public String store(HttpServletRequest req, 
						HttpServletResponse resp , Model model) { 
		String main = "StoreMain";
		model.addAttribute("main", main);
		
		return "Index"; 	 
	}
	
	@RequestMapping("/product-detail")
	public String detail(HttpServletRequest req, 
						HttpServletResponse resp , Model model) {
		String main = "ProductDetail";
		model.addAttribute("main", main);
		
		return "Index";
	}

	@RequestMapping("/list")
	public String list(HttpServletRequest req, 
			HttpServletResponse resp , Model model) {
		String main = "ProductList";
		model.addAttribute("main", main);
		return "Index";
	}
	
	@RequestMapping("/my-page")
	public String merchantMyPage(HttpServletRequest req, 
			HttpServletResponse resp , Model model) {
		String main = "merchant/MyPage";
		model.addAttribute("main", main);
		
		return "Index";
	}
	
	@RequestMapping("/qnaWriteForm")
	public String qnaWriteForm(HttpServletRequest req, 
			HttpServletResponse resp , Model model) {
		String main = "merchant/QnaWriteForm";
		model.addAttribute("main", main);
		
		return "Index";
	}
	
	@RequestMapping("/reviewWriteForm")
	public String reviewWriteForm(HttpServletRequest req, 
			HttpServletResponse resp , Model model) {
		String main = "merchant/ReviewWriteForm";
		model.addAttribute("main", main);
		
	
		
		return "Index";
	}
		



	@RequestMapping("/find-id/business-number")
	public String businessNumberID(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "merchant/BusinessNumID";
		model.addAttribute("main" , main);
		return "Index";
	}
	
	@RequestMapping("/find-password/business-number")
	public String businessNumberPW(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "merchant/BusinessNumPW";
		model.addAttribute("main" , main);
		return "Index";
	}
}
