package com.ecom4.green.merchant.controller;

import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.merchant.dto.ProductDTO;
import com.ecom4.green.merchant.dto.SaleDTO;
import com.ecom4.green.merchant.dto.SaleProductDTO;
import com.ecom4.green.merchant.service.ProductService;
import com.ecom4.green.merchant.service.SaleService;
import com.ecom4.green.merchant.wrapper.SaleForm;
import com.ecom4.green.user.dto.QnaDTO;
import com.ecom4.green.user.dto.ReviewDTO;
import com.ecom4.green.user.dto.UserDTO;
import com.ecom4.green.user.service.UserService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.merchant.dto.ProductDTO;
import com.ecom4.green.merchant.dto.SaleDTO;
import com.ecom4.green.merchant.dto.SaleProductDTO;
import com.ecom4.green.merchant.service.ProductService;
import com.ecom4.green.merchant.service.SaleService;
import com.ecom4.green.merchant.wrapper.SaleForm;
import com.ecom4.green.user.dto.ReviewDTO;
import com.ecom4.green.user.service.ReviewService;
import com.ecom4.green.user.service.UserService;

@Controller
@RequestMapping("/item")
public class SaleController
{
        private static final Logger logger = LoggerFactory.getLogger(SaleController.class);
        @Autowired
        AuthService authService;

        @Autowired
        SaleService saleService;

        @Autowired
        UserService userService;

        @Autowired
        ProductService productService;


        @Autowired
        ReviewService reviewService;

        //        public 권한
        @GetMapping("/{sale_id}")
        public String getSaleDetail(@PathVariable("sale_id") int sale_id,
			      HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model)
        {
	      String main = "smartstore/view/SaleDetail";
	      SaleDTO sale = new SaleDTO();

	      List<SaleProductDTO> saleProductList_MAIN = new ArrayList<>();
	      List<SaleProductDTO> saleProductList_SUB = new ArrayList<>();

	      sale = saleService.getSale(sale_id);
	      saleProductList_MAIN = saleService.selectSaleProductListMain(sale_id);
	      saleProductList_SUB = saleService.selectSaleProductListSub(sale_id);

	      ReviewDTO review = new ReviewDTO();


	      review.setSale_id(sale_id);


	      Map<String, Object> map = new HashMap<>();
	      map.put("sale_id", sale_id);

	      int review_total = reviewService.selectReviewTotalCountByMap(map);
	      List<ReviewDTO> reviewDTOList = reviewService.selectReviewList(review);
	      QnaDTO qna = new QnaDTO();
	      qna.setSale_id(sale_id);
	      List<QnaDTO> qnaDTOList = userService.selectQnaList(qna);


	      model.addAttribute("sale", sale);
	      model.addAttribute("saleProductList_MAIN", saleProductList_MAIN);
	      model.addAttribute("saleProductList_SUB", saleProductList_SUB);
	      model.addAttribute("main", main);
	      model.addAttribute("sale_id", sale_id);
	      model.addAttribute("qnaDTOList", qnaDTOList);
	      model.addAttribute("reviewDTOList", reviewDTOList);
	      return "Index";
        }

        //        권한 - 사업자로 제한
        @GetMapping("/list")
        public String getSaleList(@RequestParam(required = false, defaultValue = "0") int category,
			    @RequestParam(required = false, defaultValue = "0") int region,
			    @RequestParam(required = false, defaultValue = "") String keyword,
			    @PageableDefault(size = 10, page = 0) Pageable pageable,
			    HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model)
        {

	      String main = null;
	      String url = null;
	      Page<SaleDTO> salePage = null;

	      if (authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
	      {
		    Map<String, Object> dataMap = new HashMap<>();
		    dataMap.put("category", category);
		    dataMap.put("region", region);
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


	      main = "smartstore/view/SaleList";
	      model.addAttribute("salePage", salePage);
	      model.addAttribute("main", main);
	      return "Index";
        }

        @GetMapping("/write")
        public String insertSaleForm(HttpServletRequest req,
			       HttpServletResponse resp,
			       Model model, HttpSession session)
        {
	      String main = null;
	      String url = null;
	      List<ProductDTO> productDTOList = new ArrayList<>();
	      if (authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
	      {
		    main = "smartstore/form/InsertSale";
		    productDTOList = productService.getProductList(authService.getCurrentUser(session).getId());
	      }
	      else
	      {
		    url = "redirect:/auth/login";
		    return url;
	      }

	      model.addAttribute("main", main);
	      model.addAttribute("productList", productDTOList);
	      model.addAttribute("merchant_id", authService.getCurrentUser(session).getId());
	      return "Index";
        }

        //	상품 등록
        @ResponseBody
        @PostMapping("/write")
        public Map<String, Object> insertSale(HttpServletRequest req,
				      HttpServletResponse resp,
				      Model model, @ModelAttribute SaleForm saleForm, HttpSession session, @RequestParam(defaultValue = "0", required = false, value = "image_group_id") int image_group_id)
        {
	      Map<String, Object> respMap = new HashMap<>();
	      String url = null;
	      String msg = null;
	      SaleDTO saleDTO = saleForm.getSaleDTO();

	      saleDTO.setImage_group_id(image_group_id);


	      List<SaleProductDTO> saleProductDTOList = saleForm.getSaleProductDTOList();

	      if (authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
	      {
		    try
		    {
			  saleService.insertSale(saleDTO);
			  saleService.insertSaleProductList(saleProductDTOList, saleService.selectMaxSaleId());
		    }
		    catch (Exception e)
		    {
			  e.printStackTrace();
		    }
		    msg = "판매글 등록 완료";
		    url = "/merchant/my-page/item/list";
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

        //	상품 수정 폼으로 이동
        @GetMapping("/write/{sale-id}")
        public String updateSaleForm(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model, @PathVariable("sale-id") int saleID)
        {

	      String main = null;
	      String url = null;
	      SaleDTO saleDTO = new SaleDTO();
	      List<ProductDTO> productDTOList = new ArrayList<>();
	      List<SaleProductDTO> saleProductDTOList = new ArrayList<>();

	      if (authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
	      {
		    saleDTO = saleService.getSale(saleID);
		    main = "smartstore/form/UpdateSale";
		    productDTOList = productService.getProductList(authService.getCurrentUser(session).getId());
		    saleProductDTOList.addAll(saleService.selectSaleProductListMain(saleID));
		    saleProductDTOList.addAll(saleService.selectSaleProductListSub(saleID));

	      }
	      else
	      {
		    url = "redirect:/";
		    return url;
	      }


	      model.addAttribute("sale", saleDTO);
	      model.addAttribute("productList", productDTOList);
	      model.addAttribute("saleProductList", saleProductDTOList);
	      model.addAttribute("merchant_id", authService.getCurrentUser(session).getId());
	      model.addAttribute("main", main);
	      return "Index";
        }

        //	상품 수정 요청
//        @PostMapping("/write/{sale-id}")
//        public String updateSale(HttpSession session,HttpServletRequest req, HttpServletResponse resp, Model model,@ModelAttribute SaleForm saleForm, @PathVariable("sale-id") int sale_id ) 
//        {
//
//        	String url = null;
//
//            SaleDTO saleDTO = saleForm.getSaleDTO();
//            saleDTO.setImage_group_id(image_group_id);
//            List<SaleProductDTO> saleProductDTOList = saleForm.getSaleProductDTOList();
//
//            if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
//            {
//                    try
//                    {
//                            saleService.updateSale(saleDTO);
//                            saleService.insertSaleProductList(saleProductDTOList,saleService.selectMaxSaleId());
//                    }
//                    catch(Exception e)
//                    {
//                            e.printStackTrace();
//                    }
//                    url = "redirect:/merchant/my-page/item/list";
//            }
//            else
//            {
//                    url = "redirect:/";
//            }
//
//            return url;
//        }
        @ResponseBody
        @PostMapping("/write/{sale-id}")
        public ResponseEntity<?> updateSale(HttpSession session,
				    HttpServletRequest req, HttpServletResponse resp,
				    Model model, @ModelAttribute SaleForm saleForm,
				    @PathVariable("sale-id") int sale_id,
				    @RequestParam(defaultValue = "0", required = false, value = "image_group_id") int image_group_id)
        {
	      Map<String, Object> respMap = new HashMap<>();
	      String msg = null;
	      String url = null;
	      int r = 0;

	      SaleDTO saleDTO = saleForm.getSaleDTO();
	      saleDTO.setImage_group_id(image_group_id);
	      List<SaleProductDTO> saleProductDTOList = saleForm.getSaleProductDTOList();

	      RoleStatus status = authService.checkRoleStatus(session);
	      if (status == RoleStatus.MERCHANT)
	      {

		    saleService.updateSale(saleDTO);
		    saleService.updateSaleProduct(saleProductDTOList, saleDTO.getId());
		    msg = "판매글 수정 완료";
		    url = "/merchant/my-page/item/list";
		    respMap.put("url", url);
		    respMap.put("msg", msg);
	      }
	      else
	      {
		    msg = "사업자 로그인 이후 이용 바랍니다.";
		    url = "/auth/login";
		    respMap.put("url", url);
		    respMap.put("msg", msg);
		    return new ResponseEntity<>(respMap, HttpStatus.UNAUTHORIZED);
	      }


	      return new ResponseEntity<>(respMap, HttpStatus.OK);
        }

        //	상품 삭제
        @PostMapping("/delete/{sale-id}")
        public String deleteSale(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model, @PathVariable("sale-id") int saleID)
        {
	      String url = null;
	      int r = 0;

	      RoleStatus status = authService.checkRoleStatus(session); // status 변수 추가
	      System.out.println("Role Status: " + status); // 이 라인을 추가하여 현재 RoleStatus 값 출력

	      if (status == RoleStatus.MERCHANT)
	      {
		    SaleDTO sdto = new SaleDTO();
		    sdto.setId(saleID);
		    r = saleService.deleteSale(sdto);
		    url = "redirect:/merchant/my-page/item/list";
	      }
	      else
	      {
		    url = "redirect:/";
	      }

	      return url;
        }
//        @PostMapping("/delete/{sale-id}")
//        public String deleteProduct(HttpSession session,HttpServletRequest req, HttpServletResponse resp, Model model,@PathVariable("sale-id") int saleID ) throws Exception
//        {
//        	
//        	
//        	String url = null;
//        	
//        	
//        	
//        	if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
//        	{
//        		saleService.deleteSale(saleID);
//        		url = "redirect:/sale/list";
//        	}
//        	else
//        	{
//        		url = "redirect:/";
//        	}
//        	
//        	return url;
//        }


}
