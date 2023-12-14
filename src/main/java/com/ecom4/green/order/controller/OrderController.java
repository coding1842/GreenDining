package com.ecom4.green.order.controller;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom4.green.merchant.service.ProductService;
import com.ecom4.green.merchant.service.SaleService;
import com.ecom4.green.order.data.OrderItemList;
import com.ecom4.green.order.dto.OrderItemDTO;
import com.ecom4.green.order.dto.OrdersDTO;
import com.ecom4.green.order.service.OrdersService;
import com.ecom4.green.payment.service.ApiService;
import com.ecom4.green.user.dto.AddressDTO;
import com.ecom4.green.user.dto.UserDTO;
import com.ecom4.green.user.service.UserService;
import com.ecom4.green.user.service.UserServiceImpl;
import org.apache.commons.lang3.RandomStringUtils;
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
public class OrderController
{

        private static final String authenticationKey = "ac805b30517f4fd08e3e80490e559f8e";
        private static final String merchantId = "himedia";

        Logger logger = LoggerFactory.getLogger(OrderController.class);
        @Autowired
        AuthService authService;

        @Autowired
        OrdersService orderService;

        @Autowired
        SaleService saleService;

        @Autowired
        ProductService productService;

        @Autowired
        CartService cartService;

        @Autowired
        UserService userService;

        @Autowired
        ApiService apiService;

        @GetMapping("/checkout-form")
        public String orderForm(
		HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session)
        {
	      return "Index";
        }

        @GetMapping("/checkout")
        public String orderCheckout(
		HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session,
		RedirectAttributes redirectAttributes)
        {
	      String main = "user/form/OrderPaymentForm";
	      UserDTO userDTO = authService.getCurrentUser(session);
	      List<CartDTO> cartDTOList = (List<CartDTO>) session.getAttribute("cartDTOList");


	      int totalPrice = 0;
	      for (CartDTO ele : cartDTOList)
	      {
		    totalPrice += ele.getAfter_price() * ele.getQuantity();
	      }
	      String random = RandomStringUtils.randomAlphabetic(6);


	      String amount = String.valueOf(totalPrice + 3000);
	      String itemName = cartDTOList.size() > 1 ?
		        cartDTOList.get(0).getName() + " 외 " + String.valueOf(cartDTOList.size() - 1) + "건"
		        : cartDTOList.get(0).getName();
	      String userName = userDTO.getName();
	      String userAgent = "WP"; //무조건 WP로 써야함
	      String returnUrl = "returnUrl";
	      String signature = "";
	      LocalDateTime now = LocalDateTime.now();
	      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
	      String timestamp = now.format(formatter);
	      String orderNumber = timestamp + random;
	      String g = "|";
	      try
	      {
		    signature = apiService.getSHA256Hash(merchantId + g + orderNumber + g + amount + g + authenticationKey + g + timestamp);
	      }
	      catch (NoSuchAlgorithmException e)
	      {
		    e.printStackTrace();
	      }

	      String auth_url = "https://api.testpayup.co.kr/ap/api/payment/" + merchantId + "/order";
	      String kakao_url = "https://api.testpayup.co.kr/ep/api/kakao/" + merchantId + "/order";
	      String naver_url = "https://api.testpayup.co.kr/ep/api/naver/" + merchantId + "/order";
	      Map<String, String> authMap = new HashMap<>();
	      Map<String, String> kakaoMap = new HashMap<>();
	      Map<String, String> naverMap = new HashMap<>();
	      Map<String, Object> authResultMap = new HashMap<>();
	      Map<String, Object> kakaoResultMap = new HashMap<>();
	      Map<String, Object> naverResultMap = new HashMap<>();
	      List<String> urlList = new ArrayList<>(List.of(auth_url, kakao_url, naver_url));
	      List<Map<String, Object>> resultList = new ArrayList<>(List.of(authResultMap, kakaoResultMap, naverResultMap));
	      List<Map<String, String>> mapList = new ArrayList<>(List.of(authMap, kakaoMap, naverMap));


	      for (Map<String, String> map : mapList)
	      {
		    map.put("orderNumber", orderNumber);
		    map.put("amount", amount);
		    map.put("itemName", itemName);
		    map.put("userName", userName);
		    map.put("userAgent", userAgent);
		    map.put("returnUrl", returnUrl);
		    map.put("signature", signature);
		    map.put("timestamp", timestamp);
		    map.put("cashbillYn", "N");
	      }
	      for (int x = 0; x < mapList.size(); x++)
	      {
		    resultList.set(x, apiService.JsonApi(urlList.get(x), mapList.get(x)));
	      }


	      model.addAttribute("cartDTOList", cartDTOList);
	      model.addAttribute("user", userDTO);
	      model.addAttribute("addressList", userService.selectAddressList(authService.getCurrentUser(session).getId()));
	      model.addAttribute("main", main);

	      model.addAttribute("authOrderResult", resultList.get(0));
	      model.addAttribute("kakaoOrderResult", resultList.get(1));
	      model.addAttribute("naverOrderResult", resultList.get(2));


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

	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {
		    url = "/order/checkout";

	      }
	      else if (authService.checkRoleStatus(session) == RoleStatus.NOT_LOGGED_IN)
	      {
		    url = "/auth/login";
		    return new ResponseEntity<>(url, HttpStatus.UNAUTHORIZED);
	      }


	      session.setAttribute("cartDTOList", cartDTOList);
	      return new ResponseEntity<>(url, HttpStatus.OK);
        }

        //	주문 요청
        @PostMapping("/request")
        public ResponseEntity<?> orderRequest(@ModelAttribute OrderItemList orderItemList,
				      @RequestParam(defaultValue = "0") int address_id,
				      HttpServletRequest req,
				      HttpServletResponse res,
				      Model model,
				      HttpSession session)
        {
	      String url = "";
	      int order_id = 0;

	      List<OrderItemDTO> orderItemDTOList = orderItemList.getOrderItemDTOList();


	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {
		    String user_id = authService.getCurrentUser(session).getId();
		    order_id = orderService.insertOrder(user_id, address_id);
		    int r = orderService.insertOrderItemList(orderItemDTOList, order_id);

		    // 판매글의 판매량 증가 및 상품정보의 재고 감소
		    for (OrderItemDTO ele : orderItemDTOList)
		    {

			  int sale_rate = ele.getQuantity();
			  int sale_id = ele.getSale_id();
			  int product_id = ele.getProduct_id();
			  Map<String, Object> hashMap = new HashMap<>();
			  hashMap.put("sale_rate", sale_rate);
			  hashMap.put("sale_id", sale_id);
			  hashMap.put("product_id", product_id);
			  cartService.deleteCartByOrderItem(hashMap);
			  saleService.updateTotalRate(hashMap);
			  productService.updateStock(hashMap);
		    }
		    
		    url = "/user/my-page";
	      }
	      else if (authService.checkRoleStatus(session) == RoleStatus.NOT_LOGGED_IN)
	      {
		    url = "/auth/login";
		    return new ResponseEntity<>(url, HttpStatus.UNAUTHORIZED);
	      }

	      return new ResponseEntity<>(url, HttpStatus.OK);
        }


}












