

package com.ecom4.green.merchant.controller; 
 
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.merchant.dto.ProductDTO;
import com.ecom4.green.merchant.dto.SaleDTO;
import com.ecom4.green.merchant.service.ProductService;
import com.ecom4.green.merchant.service.SaleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam; 
 
@Controller 
@RequestMapping("/merchant")
public class MerchantController { 

        @Autowired
        AuthService authService;
	
        @Autowired
        ProductService productService;
        
        @Autowired
        SaleService saleService;
        
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
	
	@RequestMapping("/my-page/product/list")
	public String getProductList(HttpSession session ,
								HttpServletRequest req,
								HttpServletResponse resp, 
								Model model ,
								@RequestParam(value = "size", required = false, defaultValue = "5") int size,
								@RequestParam(value = "category",defaultValue = "0", required = false) int category, 
								@RequestParam(value = "keyword",defaultValue = "", required = false)  String keyword , 
								@PageableDefault(size = 5,page = 0) Pageable pageable)
	{
		 String main = null;
	      String url = null;
	      Page<ProductDTO> productPage = null;
	      

	      if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
	      {
		    Map<String, Object> dataMap = new HashMap<>();
		    dataMap.put("category", category);
		    dataMap.put("keyword", keyword);
		    dataMap.put("pageable", pageable);
		    dataMap.put("merchant_id", authService.getCurrentUser(session).getId());

		    
		    productPage = productService.getProductPage(dataMap);
	      }
	      else
	      {
		    url = "redirect:/";
		    return url;
	      }


	      main = "merchant/view/ProductList";
	      model.addAttribute("size",size);
	      model.addAttribute("productPage",productPage);
	      model.addAttribute("main", main);
	      return "Index";
	}
	
	@RequestMapping("/my-page/delivery/list")
	public String getDeliveryList(HttpSession session ,
									HttpServletRequest req,
									HttpServletResponse resp, 
									Model model ,
									@RequestParam(value = "size", required = false, defaultValue = "5") int size,
									@RequestParam(value = "category",defaultValue = "0", required = false) int category, 
									@RequestParam(value = "keyword",defaultValue = "", required = false)  String keyword , 
									@PageableDefault(size = 5,page = 0) Pageable pageable)
	{
		String main = null;
		String url = null;
		Page<ProductDTO> productPage = null;
		
		
		if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
		{
			Map<String, Object> dataMap = new HashMap<>();
			dataMap.put("category", category);
			dataMap.put("keyword", keyword);
			dataMap.put("pageable", pageable);
			dataMap.put("merchant_id", authService.getCurrentUser(session).getId());
			
			
			productPage = productService.getProductPage(dataMap);
		}
		else
		{
			url = "redirect:/";
			return url;
		}
		
		
		main = "merchant/view/DeliveryList";
		model.addAttribute("size",size);
		model.addAttribute("productPage",productPage);
		model.addAttribute("main", main);
		return "Index";
	}
	
	@RequestMapping("/my-page/item/list")
	public String getitemList(HttpSession session ,
								HttpServletRequest req,
								HttpServletResponse resp, 
								Model model ,
								@RequestParam(value = "size", required = false, defaultValue = "5") int size,
								@RequestParam(value = "category",defaultValue = "0", required = false) int category, 
								@RequestParam(value = "keyword",defaultValue = "", required = false)  String keyword , 
								@PageableDefault(size = 5,page = 0) Pageable pageable)
	{
		String main = null;
		String url = null;
		Page<SaleDTO> salePage = null;
		
		
		if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
		{
			Map<String, Object> dataMap = new HashMap<>();
			dataMap.put("category", category);
			dataMap.put("keyword", keyword);
			dataMap.put("pageable", pageable);
			dataMap.put("merchant_id", authService.getCurrentUser(session).getId());
			
			
			salePage = saleService.getSalePage(dataMap);
		}
		else
		{
			url = "redirect:/";
			return url;
		}
		
		
		main = "merchant/view/ItemList";
		model.addAttribute("size",size);
		model.addAttribute("salePage",salePage);
		model.addAttribute("main", main);
		return "Index";
	}
	
	
	
}
