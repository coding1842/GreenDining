package com.ecom4.green.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.user.dto.AddressDTO;
import com.ecom4.green.user.service.UserService;

@RequestMapping("/user")
@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	UserService userService;
	
	@Autowired
	AuthService authService;
	
	@RequestMapping("/my-page")
	public String mypage(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "user/view/MyPage";
		model.addAttribute("main" , main);
		return "Index";
	}
	
	@RequestMapping("/cart")
	public String cart(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "user/Cart";
		model.addAttribute("main" , main);
		return "Index";
	}
	//여기는 테스트폼 ---------------
	@RequestMapping("/request")
	public String request(HttpServletRequest req, HttpServletResponse resp , Model model)
	{
		String main = "user/form/ReturnProductForm";
		model.addAttribute("main", main);
		
		return "Index";
	}
	
	//여기는 배송관련 테스트 폼-------------------------------------
	@RequestMapping("/address")
	public String addressForm(HttpServletRequest request,
							HttpServletResponse response,
							Model model)
	{

		String main = "user/form/AddressForm";
		
		model.addAttribute("main", main);
		
		return "Index";
	}
	
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
		String main = "user/form/AdressList";
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
	
}


