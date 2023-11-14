package com.ecom4.green.merchant.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.user.dto.UserDTO;
import com.ecom4.green.user.service.UserService;

import lombok.Builder.Default;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
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
        	AuthService authService;
	@Autowired
        	UserService userService;

//	상품관리 리스트 확인
        @GetMapping("/list")
        public String getProductList(HttpSession session ,HttpServletRequest req,HttpServletResponse resp, Model model ,@RequestParam("category") int category, @RequestParam("keyword")  String keyword , @PageableDefault(size = 10,page = 0) Pageable pageable) {


	      String main = null;
	      String url = null;
	      Page<ProductDTO> productList = null;

	      if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
	      {
		    Map<String, Object> dataMap = null;
		    dataMap.put("category", category);
		    dataMap.put("keyword", keyword);
		    dataMap.put("pageable", pageable);
		    dataMap.put("merchant_id", authService.getCurrentUser(session).getRole());

		    productList = productService.getProductPage(dataMap);
	      }
	      else
	      {
		    url = "redirect:/";
		    return url;
	      }


	      main = "smartstore/view/ProductList";
	      model.addAttribute("productList",productList);
	      model.addAttribute("main", main);
	      return "Index";
        }
//	상품 등록폼
	@GetMapping("/write")
	public String insertProductForm(HttpServletRequest req,
						              HttpServletResponse resp,
						              Model model, HttpSession session) {
	        String main = null;
	        String url = null;

	      if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
	      {
		    main = "smartstore/form/InsertProduct";
	      }
	      else
	      {
		    url = "redirect:/";
		    return url;
	      }

//	        model.addAttribute("merchant_id", authService.getCurrentUser(session).getId());
	        model.addAttribute("main", main);
	        model.addAttribute("merchant_id",authService.getCurrentUser(session).getId());
	        return "Index";
	}
        //	상품 등록
        @PostMapping("/write")
        public String insertProduct(HttpServletRequest req,
			      HttpServletResponse resp,
			      Model model , ProductDTO productDTO,HttpSession session) {

	      String url = null;
	      int r = 0;

	      if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
	      {
		   try
		   {
			 r = productService.insertProduct(productDTO);
		   }
		   catch(Exception e)
		    {
			e.printStackTrace();
		    }
		    url = "redirect:/product/list";
	      }
	      else
	      {
		    url = "redirect:/";
	      }

	      return url;
        }

//	상품 수정 폼으로 이동
	@GetMapping("/write/{product-id}")
	public String updateProductForm(HttpSession session,HttpServletRequest req, HttpServletResponse resp, Model model,@PathVariable("product-id") int productID ) {



	        String main = null;
	        String url = null;
	        ProductDTO productDTO = new ProductDTO();

	        if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
	        {
		      productDTO = productService.getProduct(productID);
		      main = "smartstore/form/UpdateProduct";
	        }
	        else
	        {
		      url = "redirect:/";
		      return url;
	        }


	        model.addAttribute("product" , productDTO );
//	        테스트에서는 비활성화
//	        model.addAttribute("merchant_id",authService.getCurrentUser(session).getId());
	        model.addAttribute("main", main);
	        return "Index";
	}
//	상품 수정 요청
	@PatchMapping("/write/{product-id}")
	public String updateProduct(HttpSession session,HttpServletRequest req, HttpServletResponse resp, Model model, ProductDTO productDTO ) {
	        String main = null;
	        String url = null;
	        int r = 0;

	        if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
	        {
		      r = productService.updateProduct(productDTO);
		      url = "redirect:/product/list";
	        }
	        else
	        {
		      url = "redirect:/";
		      return url;
	        }

	        return url;
	}

//	상품 삭제
	@GetMapping("/delete/{product-id}")
	public String deleteProduct(HttpSession session,HttpServletRequest req, HttpServletResponse resp, Model model,@PathVariable("product-id") int productID ) {
	        String url = null;
	        int r = 0;

	        if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
	        {
		      r = productService.deleteProduct(productID);
		      url = "redirect:/product/list";
	        }
	        else
	        {
		      url = "redirect:/";
	        }

	        return url;
	}
	
	
}













