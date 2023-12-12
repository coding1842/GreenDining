package com.ecom4.green.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.merchant.dto.SaleDTO;

import com.ecom4.green.merchant.service.SaleService;
import com.ecom4.green.order.dto.OrderItemDTO;
import com.ecom4.green.order.dto.OrdersDTO;
import com.ecom4.green.order.service.OrdersService;
import com.ecom4.green.user.dto.AddressDTO;
import com.ecom4.green.user.dto.QnaDTO;
import com.ecom4.green.user.dto.ReviewDTO;
import com.ecom4.green.user.dto.UserDTO;
import com.ecom4.green.user.service.UserService;


@RequestMapping("/user")
@Controller
public class UserController
{
        private static final Logger logger = LoggerFactory.getLogger(UserController.class);
        @Autowired
        UserService userService;

        @Autowired
        AuthService authService;

        @Autowired
        SaleService saleService;

        @Autowired
        OrdersService ordersService;

        @RequestMapping("/my-page")
        public String mypage(HttpServletRequest req,
		         HttpServletResponse resp,
		         Model model,
		         HttpSession session,
		         OrdersDTO ordersDTO,
		         @PageableDefault(page = 0, size = 5) Pageable pageable)
        {
	      String main = "user/view/MyPage";
	      String url = "";
	      Page<OrdersDTO> ordersPage = null;
	      List<OrderItemDTO> orderItemList = new ArrayList<>();


	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {
		    Map<String, Object> dataMap = new HashMap<>();
		    dataMap.put("user_id", authService.getCurrentUser(session).getId());
		    dataMap.put("pageable", pageable);
		    ordersPage = ordersService.getOrdersPage(dataMap);
		    UserDTO ssKey = (UserDTO) session.getAttribute("ssKey");

		    int inDeliveryCount = ordersService.countInDelivery(ssKey.getId());
		    model.addAttribute("inDeliveryCount", inDeliveryCount);
		    for (OrdersDTO ele : ordersPage)
		    {
			  List<OrderItemDTO> tempOrderItemList = ordersService.getOrderItemList(ele.getId());
			  orderItemList.addAll(tempOrderItemList);
		    }
	      }
	      else
	      {
		    url = "redirect:/auth/login";
		    return url;
	      }
	      model.addAttribute("ordersPage", ordersPage);
	      model.addAttribute("orderItemList", orderItemList);
	      model.addAttribute("main", main);
	      return "Index";
        }

        @RequestMapping("/my-page/order/{order_id}")
        public String orderDetail(HttpSession session,
			    @PathVariable("order_id") int order_id,
			    HttpServletRequest req,
			    HttpServletResponse resp,
			    Model model)
        {
	      String main = "user/view/OrderDetail";
	      String url = "";
	      OrdersDTO ordersDTO = new OrdersDTO();
	      List<OrderItemDTO> orderItemList = new ArrayList<>();
	      AddressDTO addressDTO = new AddressDTO();
	      UserDTO userDTO = new UserDTO();

	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {
		    ordersDTO = ordersService.getOrderDetail(order_id);
		    orderItemList = ordersService.getOrderItemList(order_id);
		    UserDTO ssKey = (UserDTO) session.getAttribute("ssKey");


		    userDTO = userService.getOrderUser(ssKey.getId());
		    addressDTO = userService.getOrderAddress(order_id);
		    main = "user/view/OrderDetail";

		    int inDeliveryCount = ordersService.countInDelivery(ssKey.getId());
		    model.addAttribute("inDeliveryCount", inDeliveryCount);
	      }
	      else
	      {
		    url = "redirect:/";
		    return url;
	      }
	      int total_price = 0;
	      int discount_price = 0;
	      int payment_price = 0;
	      for (OrderItemDTO ele : orderItemList)
	      {
		    total_price += ele.getBefore_price() * ele.getQuantity();
		    discount_price += (ele.getBefore_price() - ele.getAfter_price()) * ele.getQuantity();
	      }
	      payment_price += total_price - discount_price;
	      ordersDTO.setTotal_price(total_price);
	      ordersDTO.setDiscount_price(discount_price);
	      ordersDTO.setPayment_price(payment_price);

	      model.addAttribute("order", ordersDTO);
	      model.addAttribute("orderItemList", orderItemList);
	      model.addAttribute("addressDTO", addressDTO);
	      model.addAttribute("userDTO", userDTO);
	      model.addAttribute("main", main);
	      return "Index";
        }

        @GetMapping("/cart")
        public String cart(HttpServletRequest req, HttpServletResponse resp, Model model)
        {
	      String main = "user/view/Cart";
	      model.addAttribute("main", main);
	      return "Index";
        }

        //여기는 테스트폼 ---------------
        @RequestMapping("/request")
        public String request(HttpServletRequest req, HttpServletResponse resp, Model model)
        {
	      String main = "user/form/ReturnProductForm";
	      model.addAttribute("main", main);

	      return "Index";
        }


        //리뷰는 마이페이지로 가서 리뷰, Q&A 작성할거니까 user에 작성
        //REVIEW 컨트롤러

//	 @GetMapping("/review/write")
//     public String reviewForm(@RequestParam int sale_id, HttpServletRequest req, HttpServletResponse res, Model model)
//     {
//     	String main = "user/form/ReviewWriteForm";
//     	
//     	model.addAttribute("main",main);
//     	model.addAttribute("sale_id",sale_id);
//     	return "Index";
//     }	 

//		String main = "user/form/AddressForm";
//		
//		model.addAttribute("main", main);
//		
//		return "Index";
//	}
	
	@PostMapping("/insertAddress")
	public String insertAddress(HttpServletRequest request,
							HttpServletResponse response,
							Model model,
							AddressDTO addressDTO) 
	{
		String url = "redirect:/user/address/list";
		
		try {
			userService.insertAddress(addressDTO);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return url;
	}
	
	@GetMapping("/address/list")
	public String AddressList(HttpServletRequest req, HttpServletResponse resp,Model model,HttpSession session)
	{
		String main = "user/view/AddressList";
		String url = "";
		List<AddressDTO> addressDTOList = null;
		
		if(authService.checkRoleStatus(session) == RoleStatus.USER)
		{
		  addressDTOList = userService.selectAddressList(authService.getCurrentUser(session).getId());
		}
		else
		{
			url = "redirect:/auth/login";
			return url;
		}
		
		model.addAttribute("addressDTOList",addressDTOList);
		model.addAttribute("main",main);
		return "Index";
	}
	
//	@PostMapping("/updateAddress")
//	public String updateAddress( AddressDTO addressDTO){
//		
//		AddressDTO updateAddress = userService.updateAddress(addressDTO);
//		
//		return "success";
//	}
	
	 @PostMapping("/update/address")
	 public ResponseEntity<String> updateAddress(AddressDTO addressDTO)
	 {
		 	int r = userService.updateAddress(addressDTO);
	        
	        if(r < 1)
	        {
	        	return new ResponseEntity<>("배송 정보 수정 실패. 다시 수정 해주십시오",HttpStatus.BAD_REQUEST);
	        }
	        return new ResponseEntity<>("정상적으로 배송 정보 수정 되었습니다.", HttpStatus.OK);
	    }
	 
	 @PostMapping("/delete/address")
	 public ResponseEntity<String> deleteAddress( HttpServletRequest req, HttpServletResponse res, AddressDTO addressDTO)
	 {
		 	int r = userService.deleteAddress(addressDTO);
	        
	        if(r < 1)
	        {
	        	return new ResponseEntity<>("배송 정보 삭제 실패. 다시 수정 해주십시오",HttpStatus.BAD_REQUEST);
	        }
	        return new ResponseEntity<>("정상적으로 배송 정보 삭제 되었습니다.", HttpStatus.OK);
	 }
	 
	 
	 @GetMapping("/review/write")
     public String reviewForm(@RequestParam int sale_id, HttpServletRequest req, HttpServletResponse res, Model model)
     {
     	String main = "user/form/ReviewWriteForm";
     	
     	model.addAttribute("main",main);
     	model.addAttribute("sale_id",sale_id);
     	return "Index";
     }	 
	 
//	 @RequestMapping("/review")
//	 public String review(HttpServletRequest req,
//							HttpServletResponse res,
//							Model model)
//	 {
//		 
//		 return null;
//	 }

        @PostMapping("/review/insert")
        public String insertReview(@RequestParam(required = false, defaultValue = "0") int image_group_id,
			     HttpServletRequest req,
			     HttpServletResponse res,
			     Model model,
			     ReviewDTO reviewDTO)
        {
	      String url = "redirect:/item/" + req.getParameter("sale_id");
//		 int id = reviewDTO.getSale_id();
	      try
	      {
		    int id = Integer.valueOf(reviewDTO.getSale_id());
		    if (image_group_id != 0)
		    {
			  reviewDTO.setImage_group_id(image_group_id);
		    }
		    int r = userService.insertReview(reviewDTO);
	      }
	      catch (Exception e)
	      {
		    e.printStackTrace();
	      }

	      return url;
        }

        @GetMapping("/review/list")
        public String reviewList(@PathVariable("sale_id") int sale_id, HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session, ReviewDTO reviewDTO)
        {
//			String main = "smartstore/view/SaleDetail";
	      String url = "";
	      List<ReviewDTO> reviewDTOList = new ArrayList<>();

	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {
		    ReviewDTO review = new ReviewDTO();
		    review.setSale_id(sale_id);
//				review.setId(Integer.parseInt(authService.getCurrentUser(session).getId()));
		    review.setUser_id(authService.getCurrentUser(session).getId());
		    reviewDTOList = userService.selectReviewList(review);
		    url = "forward:/item/" + sale_id;
	      }
	      else
	      {
		    url = "redirect:/auth/login";
		    return url;
	      }

	      model.addAttribute("reviewDTOList", reviewDTOList);
	      model.addAttribute("sale_id", sale_id);
//			model.addAttribute("main",main);
	      return url;
        }

        @RequestMapping("/update/review/{sale_id}")
        public String updateReviewForm(@PathVariable("sale_id") int sale_id, HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session, ReviewDTO reviewDTO)
        {
	      String main = "user/form/ReviewUpdateForm";
	      String url = "";
	      List<ReviewDTO> reviewDTOList = new ArrayList<>();

	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {
//				reviewDTOList = userService.selectReviewList(sale_id);
		    ReviewDTO review = new ReviewDTO();
		    review.setSale_id(sale_id);
		    review.setUser_id(authService.getCurrentUser(session).getId());
		    reviewDTOList = userService.selectReviewList(review);
	      }
	      else
	      {
		    url = "redirect:/auth/login";
		    return url;
	      }

	      model.addAttribute("reviewDTOList", reviewDTOList);
	      model.addAttribute("sale_id", sale_id);
	      model.addAttribute("main", main);
	      return "Index";
        }

//	 @GetMapping("/update/review/{sale_id}")
//	 public String updateReviewForm(@PathVariable("sale_id") int sale_id, HttpServletRequest req, HttpServletResponse res, Model model)
//	 {
//		 String main = "user/form/ReviewUpdateForm";
//		 SaleDTO sale = new SaleDTO();
//		 List<ReviewDTO> reviewDTOList = new ArrayList<>();
//		 
////		 List<ReviewDTO> reviewDTOList = new ArrayList<>();
//		 sale = saleService.getSale(sale_id);
//		 reviewDTOList = userService.selectReviewList(sale_id);
//		 model.addAttribute("sale",sale);
//		 model.addAttribute("main",main);
//         model.addAttribute("sale_id", sale_id);
//         model.addAttribute("reviewDTOList", reviewDTOList);
//         System.out.println("====>" +sale_id);
//		 return "Index";
//	 }

        @PostMapping("/update/review")
        public ResponseEntity<String> updateReview(ReviewDTO reviewDTO)
        {
	      int r = userService.updateReview(reviewDTO);

	      if (r < 1)
	      {
		    return new ResponseEntity<>("리뷰 정보 수정 실패. 다시 수정 해주십시오", HttpStatus.BAD_REQUEST);
	      }
	      return new ResponseEntity<>("정상적으로 리뷰 정보가 수정 되었습니다.", HttpStatus.OK);
        }

        @PostMapping("/delete/review")
        public ResponseEntity<String> deleteReiew(HttpServletRequest req, HttpServletResponse res, ReviewDTO reviewDTO)
        {
	      int r = userService.deleteReview(reviewDTO);

	      if (r < 1)
	      {
		    return new ResponseEntity<>("리뷰 정보 삭제 실패. 다시 삭제 해주십시오", HttpStatus.BAD_REQUEST);
	      }
	      return new ResponseEntity<>("정상적으로 리뷰 정보가 삭제 되었습니다.", HttpStatus.OK);
        }

	 
	 @PostMapping("/my-page/order/{order_id}/retuen")
	 public String returnProductFrom(HttpServletRequest req, HttpServletResponse res, Model model)
	 {
		 String main = "/user/form/ReturnProductForm";
		 model.addAttribute("main",main);
		 return "index";
	 }
	 
	 //QnA-------------------------------------------------------------------------------------------
	 
	 @PostMapping("/qna/insert")
	 public ResponseEntity<?> insertQna(@RequestParam(required=false, defaultValue = "0") int image_group_id,
			 					HttpServletRequest req,
			 					HttpServletResponse res,
			 					Model model,
			 					QnaDTO qnaDTO)
	 {
		 String url = "/item/" + req.getParameter("sale_id");
		 try {
			 int id = Integer.valueOf(qnaDTO.getSale_id());
			 if(image_group_id != 0)
			 {
			  qnaDTO.setImage_group_id(image_group_id);
			 }
			 int r = userService.insertQna(qnaDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		 return new ResponseEntity<>(url,HttpStatus.OK);
	 }
	 
	 @GetMapping("/qna/list")
		public String qnaList(@PathVariable("sale_id") int sale_id, HttpServletRequest req, HttpServletResponse resp,Model model,HttpSession session, QnaDTO qnaDTO)
		{
			String url = "";
			List<QnaDTO> qnaDTOList = new ArrayList<>();
			
			if(authService.checkRoleStatus(session) == RoleStatus.USER)
			{
				QnaDTO qna = new QnaDTO();
				qna.setSale_id(sale_id);
				qna.setUser_id(authService.getCurrentUser(session).getId());
				qnaDTOList = userService.selectQnaList(qna);
				url = "forward:/item/" + sale_id;
			}
			else
			{
				url = "redirect:/auth/login";
				return url;
			}
			
			model.addAttribute("qnaDTOList", qnaDTOList);
			model.addAttribute("sale_id", sale_id);
			return url;
		}
	 
	 @GetMapping("/qna/write")
     public String qnaForm(@RequestParam int sale_id, HttpServletRequest req, HttpServletResponse res, Model model)
     {
		 HttpSession session = req.getSession();
			UserDTO custom = (UserDTO) session.getAttribute("ssKey"); 
     	String main = "user/form/QnaWriteForm";
     	
     	model.addAttribute("sskey", custom);
     	model.addAttribute("main",main);
     	model.addAttribute("sale_id",sale_id);
     	return "Index";
     }
	 
		
	  @GetMapping("/qna/detail") public String qnaDetailForm(@RequestParam int qna_id, HttpServletRequest req, HttpServletResponse res, Model model) { 
		  
		HttpSession session = req.getSession(); 
		UserDTO custom = (UserDTO) session.getAttribute("ssKey");
		String main = "user/form/QnaDetailForm";
		
		QnaDTO qnaDTO = userService.selectQnaDetail(qna_id);
	  
	
	  model.addAttribute("sskey", custom); 
	  model.addAttribute("main",main);
	  model.addAttribute("qna",qnaDTO); 
	  
	  
	  return "Index"; 
	  }
		 
	 @RequestMapping("/qnaProc")
	 public String qnaProc(@PathVariable("sale_id") int sale_id, HttpServletRequest req, HttpServletResponse res, QnaDTO qnaDTO, Model model) {
		 String flag = req.getParameter("flag");
		 HttpSession session = req.getSession();
		 String contentsJsp = null;
		 String page = null;
		 
		 QnaDTO qnaDto = (QnaDTO) session.getAttribute("ssKey");
		 if(qnaDto != null && qnaDto.getUser_id() == authService.getCurrentUser(session).getId()) {
			 String msg = null;
			 String url = null;
			 
			 switch (flag) {
			 case "update": {
				 page = "MsgPage";
				 int r = userService.updateQna(qnaDTO);
				 if(r>0) msg = "수정이 완료되었습니다.";
				 else msg = "수정을 실패했습니다.";
				 url = "item/" + sale_id;
				 break;
			 }
			 case "delete": {
				 page = "MsgPage";
                 int r = userService.deleteQna(qnaDTO);
                 if(r>0) msg = "삭제가 완료되었습니다.";
                 else msg = "삭제를 실패했습니다.";
                 url = "item/" + sale_id;
                 break;
			 }
			 }
			 url = "redirect:/item/" + sale_id;
			 if(url != null) model.addAttribute("url", url);
			 if(msg != null) model.addAttribute("msg", msg);
		 }
		 else {
			 page = "redirect:/auth/login";
			 contentsJsp = "";
		 }
		 session.setAttribute("ssKey", qnaDto);
		 model.addAttribute("contentsJsp", contentsJsp);
		 
		 
		 return page;
	 }
	 
	 @RequestMapping("/qna/qnaUpForm")
		public String noticeUpForm(HttpServletRequest request, HttpServletResponse response, QnaDTO qnaDto, Model model) {
			HttpSession session = request.getSession();
			String main = "user/form/QnaUpForm";
//			String page = null;
			UserDTO userDto = (UserDTO) session.getAttribute("ssKey");
//			main = "user/form/QnaUpForm";
			
//			if(userDto!=null && userDto.getRole().equals("USER")) {
//				page = "Index";
//				main = "user/form/QnaUpForm";
//			}else {
//				page = "Index";
//				main = "redirect:/auth/login";
//			}
			QnaDTO qnaDTO = userService.qnaUp(qnaDto);
			System.out.println("====="+qnaDto);
			System.out.println("+++++"+qnaDTO);
			session.setAttribute("ssKey", userDto);
			session.setAttribute("qna", qnaDTO);
			model.addAttribute("main", main);
			return "Index";
		}
	
}











