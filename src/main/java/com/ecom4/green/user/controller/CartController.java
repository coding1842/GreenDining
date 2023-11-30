
package com.ecom4.green.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.ecom4.green.user.dto.CartDTO;
import com.ecom4.green.user.service.CartService;
import com.ecom4.green.user.service.UserService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	private static final Logger logger 
	  = LoggerFactory.getLogger(CartController.class) ;
	
	@Autowired
	UserService userService;
	
	@Autowired
	AuthService authService;
	
	@Autowired
	CartService cartService;


//    장바구니에 상품 추가
    @PostMapping("/add")
    public ResponseEntity<String> cartAdd(@RequestBody List<CartDTO> cartDTOList, HttpSession session)
    {
      String url = "";

      if(authService.checkRoleStatus(session) == RoleStatus.USER)
      {
	    if(cartService.checkDuplication(cartDTOList.get(0).getSale_id()) > 0)
	    {
		  return new ResponseEntity<>("",HttpStatus.BAD_REQUEST);
	    }
	    cartService.insertCart(cartDTOList,authService.getCurrentUser(session).getId());
	    url = "/cart/list";
      }
      else if(authService.checkRoleStatus(session) == RoleStatus.NOT_LOGGED_IN)
      {
	    url = "/auth/login";
	    return new ResponseEntity<>(url, HttpStatus.UNAUTHORIZED);
      }

      return new ResponseEntity<>(url, HttpStatus.OK);
    }

	@GetMapping("/list")
	public String CartList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session, CartDTO cartDTO)
	{
		String main = "user/view/Cart";
		String url = "";
		List<CartDTO> cartDTOList = null;
		if(authService.checkRoleStatus(session) == RoleStatus.USER)
		{
			cartDTOList = cartService.selectCartList(authService.getCurrentUser(session).getId());
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
	
	//  상품 수정 요청
	  @PostMapping("/list/update")
	  public String updateCart(HttpSession session,HttpServletRequest req, HttpServletResponse resp, Model model, CartDTO cartDTO ) {
	          String url = null;
	          int r = 0;
	          
	          RoleStatus status = authService.checkRoleStatus(session);
	//          productDTO.setId(product_id);
	          if(status == RoleStatus.USER) {
	             
	             r = cartService.updateCart(cartDTO);
	             url = "redirect:/cart/list";
	         } 
	          else {
	             url = "redirect:/";
	         }
	
	         return url;
	  }
	  
	//    상품삭제   
	   @PostMapping("/list/delete")
	   public String deleteProduct(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model, CartDTO cartDTO) {
	       String url = null;
	       int r = 0;
	
	       RoleStatus status = authService.checkRoleStatus(session); // status 변수 추가
	       System.out.println("Role Status: " + status); // 이 라인을 추가하여 현재 RoleStatus 값 출력
	       logger.warn(cartDTO.toString());
	       if(status == RoleStatus.USER) {
	           
	           r = cartService.deleteCart(cartDTO);
	           url = "redirect:/cart/list";
	       } else {
	           url = "redirect:/";
	       }
	
	       return url;
	   }


}
