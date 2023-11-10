

package com.ecom4.green.merchant.controller; 
 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 
 
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestMapping; 
 
@Controller 
@RequestMapping("/merchant")
public class MerchantController { 

	
	@RequestMapping("/my-page")
	public String merchantMyPage(HttpServletRequest req,
			HttpServletResponse resp , Model model) {
		
		String main = "merchant/view/MyPage";
		model.addAttribute("main", main);
		
		return "Index";
	}

}
