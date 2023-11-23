package com.ecom4.green.order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.order.service.OrderService;
import com.ecom4.green.user.dto.CartDTO;
import com.ecom4.green.user.service.CartService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	AuthService authService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	CartService cartService;
	
	@GetMapping("/orderForm")
	public String orderForm(HttpServletRequest req,
								HttpServletResponse res,
								Model model)
	{
		String main = "user/form/OrderPaymentForm";
		
		model.addAttribute("main", main);
		
		return "Index";
	}
	
	@PostMapping("/add")
	public ResponseEntity<String> orderAdd(HttpServletRequest req,
							HttpServletResponse res,
							Model model, @RequestBody List<CartDTO> cartDTOList,
							HttpSession session)
	{
		String url = "";
		
		if(authService.checkRoleStatus(session) == RoleStatus.USER)
		{
			orderService.insertOrder(cartDTOList, authService.getCurrentUser(session).getId());
			url = "/order/list";
		}
		else if(authService.checkRoleStatus(session) == RoleStatus.NOT_LOGGED_IN)
		{
			url = "redirect:/auth/login";
			return new ResponseEntity<>(url, HttpStatus.UNAUTHORIZED);
		}
		
		return new ResponseEntity<>(url, HttpStatus.OK);
	}
	
	@GetMapping("/list")
	public String orderList(HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session, CartDTO cartDTO)
	{
		String main = "user/view/OrderList";
		String url = "";
		List<CartDTO> cartDTOList = null;
		if(authService.checkRoleStatus(session) == RoleStatus.USER)
		{
			cartDTOList = orderService.selectOrderList(authService.getCurrentUser(session).getId());
		}
		else
		{
			url = "redirect:/auth/login";
			return url;
		}
		
		model.addAttribute("cartDTOList", cartDTOList);
		model.addAttribute("main", main);
		return "Index";
	}
}












