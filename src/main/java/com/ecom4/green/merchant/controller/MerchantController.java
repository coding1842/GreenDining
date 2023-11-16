

package com.ecom4.green.merchant.controller; 
 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.constant.RoleStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestMapping; 
 
@Controller 
@RequestMapping("/merchant")
public class MerchantController { 

        @Autowired
        AuthService authService;
	
	@RequestMapping("/my-page")
	public String merchantMyPage(HttpServletRequest req,
			         HttpServletResponse resp , Model model, HttpSession session) {

	        String main = "";
	        
	        RoleStatus currentStatus = authService.checkRoleStatus(session);

	        if(currentStatus == RoleStatus.MERCHANT)
	        {
		      main = "merchant/view/MyPage";
	        }
	        else if(currentStatus == RoleStatus.USER)
	        {
		      main = "user/view/MyPage";
	        }
	        else
	        {
		      main = "Main";
	        }
	        model.addAttribute("main", main);
		return "Index";
	}
	
	@RequestMapping("/my-page/delivery/list")
	public String getdeliverylist(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "merchant/view/DeliveryList";
		model.addAttribute("main" , main);
		return "Index";
	}
	
	@RequestMapping("/my-page/product/list")
	public String getProductList(HttpServletRequest req, HttpServletResponse resp , Model model, HttpSession session)
	{
		
		String main = "merchant/view/ProductList";
		model.addAttribute("main" , main);
		return "Index";
	}
	@RequestMapping("/my-page/item/list")
	public String getitemList(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "merchant/view/Item";
		model.addAttribute("main" , main);
		return "Index";
	}
	
	
}
