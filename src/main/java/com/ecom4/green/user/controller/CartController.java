package com.ecom4.green.user.controller;

import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.user.dto.CartDTO;
import com.ecom4.green.user.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController
{
        @Autowired
        AuthService authService;
        @Autowired
        CartService cartService;
//        장바구니에 상품 추가
        @PostMapping("/add")
        public ResponseEntity<String> cartAdd(@RequestBody List<CartDTO> cartDTOList, HttpSession session)
        {
	      String url = "";

	      if(authService.checkRoleStatus(session) == RoleStatus.USER)
	      {
		    cartService.insertCart(cartDTOList,authService.getCurrentUser(session).getId());
		    url = "/cart/list";
	      }
	      else if(authService.checkRoleStatus(session) == RoleStatus.NOT_LOGGED_IN)
	      {
		    url = "redirect:/auth/login";
		    return new ResponseEntity<>(url, HttpStatus.BAD_REQUEST);
	      }

	      return new ResponseEntity<>(url, HttpStatus.OK);
        }
}
