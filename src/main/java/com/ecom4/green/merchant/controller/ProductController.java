package com.ecom4.green.merchant.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.imgur.dto.ImgurDTO;
import com.ecom4.green.imgur.service.ImgurService;
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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ecom4.green.merchant.controller.ProductController;
import com.ecom4.green.merchant.dto.ProductDTO;
import com.ecom4.green.merchant.service.ProductService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/product")
@Controller
public class ProductController
{

        private static final Logger logger
		= LoggerFactory.getLogger(ProductController.class);

        @Autowired
        ProductService productService;

        @Autowired
        AuthService authService;
        @Autowired
        UserService userService;

        @Autowired
        ImgurService imgurService;


        //	상품 등록폼
        @GetMapping("/write")
        public String insertProductForm(HttpServletRequest req,
				HttpServletResponse resp,
				Model model, HttpSession session)
        {
	      String main = null;
	      String url = null;

	      if (authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
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
	      model.addAttribute("merchant_id", authService.getCurrentUser(session).getId());
	      return "Index";
        }

        //	상품 등록
        @ResponseBody
        @PostMapping("/write")
        public Map<String, Object> insertProduct(HttpServletRequest req,
				         HttpServletResponse resp,
				         Model model, ProductDTO productDTO, HttpSession session, @RequestParam(required = false, defaultValue = "0") int image_group_id)
        {

	      String url = null;
	      String msg = null;
	      Map<String, Object> respMap = new HashMap<>();
	      int r = 0;

	      if (authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
	      {
		    try
		    {
			  productDTO.setImage_group_id(image_group_id);
			  r = productService.insertProduct(productDTO);
		    }
		    catch (Exception e)
		    {
			  e.printStackTrace();
		    }
		    msg = "상품 등록 완료";
		    url = "/merchant/my-page/product/list";
	      }
	      else
	      {
		    msg = "사업자 로그인 이후 등록 바랍니다.";
		    url = "/auth/login";
	      }

	      respMap.put("url", url);
	      respMap.put("msg", msg);
	      return respMap;
        }

        //	상품 수정 폼으로 이동
        @GetMapping("/write/{product-id}")
        public String updateProductForm(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model, @PathVariable("product-id") int productID)
        {


	      String main = null;
	      String url = null;
	      ProductDTO productDTO = new ProductDTO();
	      List<ImgurDTO> imgurDTOList = new ArrayList<>();

	      if (authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
	      {
		    productDTO = productService.getProduct(productID);
		    imgurDTOList = imgurService.selectImageList(productDTO.getImage_group_id());
		    main = "smartstore/form/UpdateProduct";
	      }
	      else
	      {
		    url = "redirect:/";
		    return url;
	      }


	      model.addAttribute("product", productDTO);
	      model.addAttribute("imgurList", imgurDTOList);
	      model.addAttribute("main", main);
	      return "Index";
        }

        //	상품 수정 요청
        @ResponseBody
        @PostMapping("/write/{product-id}")
        public Map<String, Object> updateProduct(HttpSession session,
				         HttpServletRequest req, HttpServletResponse resp,
				         Model model, ProductDTO productDTO,
				         @PathVariable("product-id") int product_id,
				         @RequestParam(defaultValue = "0", required = false, value = "image_group_id") int image_group_id)
        {
	      Map<String, Object> respMap = new HashMap<>();
	      String msg = null;
	      String url = null;
	      int r = 0;

	      RoleStatus status = authService.checkRoleStatus(session);
//	        productDTO.setId(product_id);
	      if (status == RoleStatus.MERCHANT)
	      {
		    ProductDTO pdto = productDTO;
		    pdto.setId(product_id);
		    pdto.setImage_group_id(image_group_id);
		    r = productService.updateProduct(pdto);
		    url = "/merchant/my-page/product/list";
		    msg = "상품 수정 완료";
	      }
	      else
	      {
		    msg = "사업자 로그인 이후에 이용 바랍니다.";
		    url = "/auth/login";
	      }

	      respMap.put("url", url);
	      respMap.put("msg", msg);
	      return respMap;
        }

//	상품 삭제
//	@PostMapping("/delete/{product-id}")
//	public String deleteProduct(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model, @PathVariable("productId") int productID) {
//	        String url = null;
//	        int r = 0;
//
//	        if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
//	        {
//		      r = productService.deleteProduct(productID);
//		      url = "redirect:/merchant/my-page/product/list";
//	        }
//	        else
//	        {
//		      url = "redirect:/";
//	        }
//	        
//	        return url;
//	}	

//	@PostMapping("/delete/{product-id}")
//	public ResponseEntity<String> deleteProduct(HttpServletRequest req, HttpServletResponse res, ProductDTO productDTO)
//	{
//		int r = productService.deleteProduct(productDTO);
//		
//		if (r < 1) {
//			return new ResponseEntity<>("상품 삭제 실패. 다시 삭제해 주세요.", HttpStatus.BAD_REQUEST);
//		}
//		return new ResponseEntity<>("상품 삭제 성공. 상품이 삭제되었습니다.", HttpStatus.OK);
//	}

        // 	상품삭제
        @PostMapping("/delete/{productId}")
        public String deleteProduct(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model, @PathVariable("productId") int productID)
        {
	      String url = null;
	      int r = 0;

	      RoleStatus status = authService.checkRoleStatus(session); // status 변수 추가
	      System.out.println("Role Status: " + status); // 이 라인을 추가하여 현재 RoleStatus 값 출력

	      if (status == RoleStatus.MERCHANT)
	      {
		    ProductDTO pdto = new ProductDTO();
		    pdto.setId(productID);
		    r = productService.deleteProduct(pdto);
		    url = "redirect:/merchant/my-page/product/list";
	      }
	      else
	      {
		    url = "redirect:/";
	      }

	      return url;
        }


}













