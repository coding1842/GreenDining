package com.ecom4.green.merchant.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.user.dto.UserDTO;
import com.ecom4.green.user.service.UserService;

import lombok.Builder.Default;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ecom4.green.merchant.controller.ProductController;
import com.ecom4.green.merchant.dto.ProductDTO;
import com.ecom4.green.merchant.service.ProductService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RequestMapping("/product")
@Controller
public class ProductController {

	private static final Logger logger 
	  = LoggerFactory.getLogger(ProductController.class) ;
	
	@Autowired
	ProductService productService;

	@Autowired
        	UserService userService;

//	상품관리 리스트 확인
        @GetMapping("/list")
        public String getProductList(HttpServletRequest req,HttpServletResponse resp, Model model ,@RequestParam("category") int category, @RequestParam("keyword")  String keyword , @PageableDefault(size = 10,page = 0) Pageable pageable) {

	      UserDTO ssKey = null;
	      String main = null;
	      String url = null;
	      Page<ProductDTO> productList = null;
	      HttpSession session = req.getSession();
	      
	      if(session.getAttribute("ssKey") != null)
	      {
		    ssKey = (UserDTO) session.getAttribute("ssKey");

		    if(ssKey.getRole().equals(RoleStatus.MERCHANT))
		    {
		    	  Map<String, Object> dataMap = null;
			      dataMap.put("category", category);
			      dataMap.put("keyword", keyword);
			      dataMap.put("pageable", pageable);
			      dataMap.put("merchant_id", ssKey.getId());
			      
	    		productList = productService.getProductList(dataMap);
           
	    		main = "smartstore/view/ProductList";
		    }
		    else
		    {
				url = "redirect:/";
				return url;
		    }
	      }
	      else
	      {
		    url = "redirect:/";
		    return url;
	      }
	      model.addAttribute("productList",productList);
	      model.addAttribute("main", main);
	      return "Index";
        }
//	상품 등록폼
	@GetMapping("/write")
	public String insertProductForm(HttpServletRequest req,
						              HttpServletResponse resp,
						              Model model) {

//	        UserDTO ssKey = null;
//	        String main = null;
//	        String url = null;
//
//	        HttpSession session = req.getSession();
//	        if(session.getAttribute("ssKey") != null)
//	        {
//		      ssKey = (UserDTO) session.getAttribute("ssKey");
//
//		      if(ssKey.getRole().equals(RoleStatus.MERCHANT))
//		      {
//			    main = "smartstore/form/InsertProduct";
//		      }
//		      else
//		      {
//			    url = "redirect:/";
//			    return url;
//		      }
//	        }
//	        else
//	        {
//		      url = "redirect:/";
//		      return url;
//	        }
//
//	        model.addAttribute("ssKey",ssKey);
//	        model.addAttribute("main", main);
//	        return "Index";
		String main = "smartstore/form/InsertProduct";
		model.addAttribute("main", main);
		
		return "Index";
	}
        //	상품 등록
        @PostMapping("/write")
        public String insertProduct(HttpServletRequest req,
			      HttpServletResponse resp,
			      Model model , @ModelAttribute("product") ProductDTO productDTO) {

	      UserDTO ssKey = null;
	      String url = null;
	      int r = 0;

	      HttpSession session = req.getSession();
	      if(session.getAttribute("ssKey") != null)
	      {
		    ssKey = (UserDTO) session.getAttribute("ssKey");

		    if(ssKey.getRole().equals(RoleStatus.MERCHANT))
		    {
			  r = productService.insertProduct(productDTO);
			  url = "redirect:/product/list";
		    }
		    else
		    {
			  url = "redirect:/";
			  return url;
		    }
	      }


	      return url;
        }

//	상품 수정 폼으로 이동
	@GetMapping("/write/{product-id}")
	public String updateProductForm(HttpServletRequest req, HttpServletResponse resp, Model model,@PathVariable("product-id") int productID ) {


	        UserDTO ssKey = null;
	        String main = null;
	        String url = null;
	        ProductDTO productDTO = null;
	        HttpSession session = req.getSession();


	        if(session.getAttribute("ssKey") != null)
	        {
		      ssKey = (UserDTO) session.getAttribute("ssKey");

		      if(ssKey.getRole().equals(RoleStatus.MERCHANT))
		      {
			    productDTO = productService.getProduct(productID);
			    main = "smartstore/form/UpdateProduct";
		      }
		      else
		      {
			    url = "redirect:/";
			    return url;
		      }
	        }
	        else
	        {
		      url = "redirect:/";
		      return url;
	        }

	        model.addAttribute("product" , productDTO );
	        model.addAttribute("ssKey",ssKey);
	        model.addAttribute("main", main);
	        return "Index";
	}
//	상품 수정 요청
	@PatchMapping("/write/{product-id}")
	public String updateProduct(HttpServletRequest req, HttpServletResponse resp, Model model,@ModelAttribute("product") ProductDTO productDTO ) {


	        UserDTO ssKey = null;
	        String main = null;
	        String url = null;
	        int r = 0;
	        HttpSession session = req.getSession();
	        if(session.getAttribute("ssKey") != null)
	        {
		      ssKey = (UserDTO) session.getAttribute("ssKey");

		      if(ssKey.getRole().equals(RoleStatus.MERCHANT))
		      {
			    r = productService.updateProduct(productDTO);
			    url = "redirect:/product/list";
		      }
		      else
		      {
			    url = "redirect:/";
		      }
	        }

	        return url;
	}

//	상품 삭제
	@GetMapping("/delete/{product-id}")
	public String deleteProduct(HttpServletRequest req, HttpServletResponse resp, Model model,@PathVariable("product-id") int productID ) {

	        UserDTO ssKey = null;
	        String url = null;
	        int r = 0;
	        HttpSession session = req.getSession();
	        if(session.getAttribute("ssKey") != null)
	        {
		      ssKey = (UserDTO) session.getAttribute("ssKey");

		      if(ssKey.getRole().equals(RoleStatus.MERCHANT))
		      {
			    r = productService.deleteProduct(productID);
			    url = "redirect:/product/list";
		      }
		      else
		      {
			    url = "redirect:/";
		      }
	        }
	        return url;
	}
	
}













