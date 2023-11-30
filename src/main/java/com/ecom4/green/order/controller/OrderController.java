package com.ecom4.green.order.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom4.green.order.data.OrderItemList;
import com.ecom4.green.order.dto.OrderItemDTO;
import com.ecom4.green.order.dto.OrdersDTO;
import com.ecom4.green.order.service.OrdersService;
import com.ecom4.green.user.dto.AddressDTO;
import com.ecom4.green.user.dto.UserDTO;
import com.ecom4.green.user.service.UserService;
import com.ecom4.green.user.service.UserServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.user.dto.CartDTO;
import com.ecom4.green.user.service.CartService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/order")
public class OrderController {

	Logger logger = LoggerFactory.getLogger(OrderController.class);
	@Autowired
	AuthService authService;
	
	@Autowired
	OrdersService orderService;
	
	@Autowired
	CartService cartService;

	@Autowired
       	UserService userService;

	@GetMapping("/checkout-form")
	public String orderForm(
							HttpServletRequest req,HttpServletResponse resp,Model model,HttpSession session)
	{
		return "Index";
	}
	@GetMapping("/checkout")
	public String orderCheckout(
								HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session,
								RedirectAttributes redirectAttributes)
	{
		String main = "user/form/OrderPaymentForm";

		List<CartDTO> cartDTOList = (List<CartDTO>) session.getAttribute("cartDTOList");



		model.addAttribute("cartDTOList", cartDTOList);
		model.addAttribute("user", authService.getCurrentUser(session));
		model.addAttribute("addressList", userService.selectAddressList(authService.getCurrentUser(session).getId()));
		model.addAttribute("main", main);

		return "Index";
	}
	
	@PostMapping("/process")
	public ResponseEntity<String> orderProcess(@RequestBody List<CartDTO> cartDTOList,
			HttpServletRequest req,
							HttpServletResponse res,
							Model model,
							HttpSession session)
	{
		String url = "";
		
		if(authService.checkRoleStatus(session) == RoleStatus.USER)
		{
			url = "/order/checkout";

		}
		else if(authService.checkRoleStatus(session) == RoleStatus.NOT_LOGGED_IN)
		{
			url = "/auth/login";
			return new ResponseEntity<>(url, HttpStatus.UNAUTHORIZED);
		}


		session.setAttribute("cartDTOList", cartDTOList);
		return new ResponseEntity<>(url, HttpStatus.OK);
	}

//	주문 요청
	@PostMapping("/request")
	public ResponseEntity<String> orderRequest(@ModelAttribute OrderItemList orderItemList,
											   @RequestParam(defaultValue = "0") int address_id,
											   HttpServletRequest req,
											   HttpServletResponse res,
											   Model model,
											   HttpSession session) {
		String url = "";

		if (authService.checkRoleStatus(session) == RoleStatus.USER) {
			String user_id = authService.getCurrentUser(session).getId();
			int order_id = orderService.insertOrder(user_id,address_id);
			int r = orderService.insertOrderItemList(orderItemList.getOrderItemDTOList(),order_id);
			url = "/user/my-page";
		} else if (authService.checkRoleStatus(session) == RoleStatus.NOT_LOGGED_IN) {
			url = "/auth/login";
			return new ResponseEntity<>(url, HttpStatus.UNAUTHORIZED);
		}

		return new ResponseEntity<>(url,HttpStatus.OK);
	}
	


}












