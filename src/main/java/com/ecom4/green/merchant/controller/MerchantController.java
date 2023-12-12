

package com.ecom4.green.merchant.controller; 
 
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.merchant.dto.DeliveryListDTO;
import com.ecom4.green.merchant.dto.ProductDTO;
import com.ecom4.green.merchant.dto.SaleDTO;
import com.ecom4.green.merchant.service.MerchantService;
import com.ecom4.green.merchant.service.ProductService;
import com.ecom4.green.merchant.service.SaleService;
import com.ecom4.green.order.dto.OrderItemDTO;
import com.ecom4.green.order.dto.OrdersDTO;
import com.ecom4.green.order.service.OrdersService;
import com.ecom4.green.user.dto.AddressDTO;
import com.ecom4.green.user.dto.CartDTO;
import com.ecom4.green.user.dto.UserDTO;
import com.ecom4.green.user.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam; 
 
@Controller 
@RequestMapping("/merchant")
public class MerchantController { 

        @Autowired
        AuthService authService;
	
        @Autowired
        ProductService productService;
        
        @Autowired
        SaleService saleService;
        
        @Autowired
        OrdersService ordersService;
        
        @Autowired
        UserService userService;
        
       
	@RequestMapping("/my-page")
	public String merchantMyPage(HttpServletRequest req,
			         HttpServletResponse resp , Model model, HttpSession session) {

	        String main = "";
	        
	        RoleStatus currentStatus = authService.checkRoleStatus(session);
	        String merchantId = authService.getCurrentUser(session).getId();
		    String storeName = ordersService.getStoreNameByMerchantId(merchantId);
		    
		    Map<String, Object> params = new HashMap<>();
		    params.put("storeName", storeName);
		    params.put("status", "결제완료");
		    int completedPaymentOrders = ordersService.countOrdersByStatus(params);
		    model.addAttribute("completedPaymentOrders", completedPaymentOrders);
		    
		    params.put("status", "상품준비중");
		    int preparingOrders = ordersService.countOrdersByStatus(params);
		    model.addAttribute("preparingOrders", preparingOrders);

		    params.put("status", "배송시작");
		    int deliveryStartedOrders = ordersService.countOrdersByStatus(params);
		    model.addAttribute("deliveryStartedOrders", deliveryStartedOrders);

		    params.put("status", "배송중");
		    int deliveringOrders = ordersService.countOrdersByStatus(params);
		    model.addAttribute("deliveringOrders", deliveringOrders);

		    params.put("status", "배송완료");
		    int deliveredOrders = ordersService.countOrdersByStatus(params);
		    model.addAttribute("deliveredOrders", deliveredOrders);
	        if(currentStatus == RoleStatus.MERCHANT)
	        {
		      main = "merchant/view/MyPage";
	        }
	        else if(currentStatus == RoleStatus.USER)
	        {
		      main = "user/view/MyPage";
	        }
	        else
	        {
		      main = "Main";
	        }
	        model.addAttribute("main", main);
		return "Index";
	}
	
	@RequestMapping("/my-page/product/list")
	public String getProductList(HttpSession session ,
								HttpServletRequest req,
								HttpServletResponse resp, 
								Model model ,
								@RequestParam(value = "size", required = false, defaultValue = "5") int size,
								@RequestParam(value = "category",defaultValue = "0", required = false) int category, 
								@RequestParam(value = "keyword",defaultValue = "", required = false)  String keyword , 
								@PageableDefault(size = 5,page = 0) Pageable pageable)
	{
		 String main = null;
	      String url = null;
	      Page<ProductDTO> productPage = null;
	      

	      if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
	      {
		    Map<String, Object> dataMap = new HashMap<>();
		    dataMap.put("category", category);
		    dataMap.put("keyword", keyword);
		    dataMap.put("pageable", pageable);
		    dataMap.put("merchant_id", authService.getCurrentUser(session).getId());

		    
		    productPage = productService.getProductPage(dataMap);
	      }
	      else
	      {
		    url = "redirect:/";
		    return url;
	      }


	      main = "merchant/view/ProductList";
	      model.addAttribute("size",size);
	      model.addAttribute("productPage",productPage);
	      model.addAttribute("main", main);
	      return "Index";
	}
	
	
	@RequestMapping("/my-page/delivery/list")
	public String getDeliveryList(HttpSession session ,
	                            HttpServletRequest req,
	                            HttpServletResponse resp, 
	                            Model model ,
	                            @RequestParam(value = "size", required = false, defaultValue = "5") int size,
	                            @RequestParam(value = "category",defaultValue = "0", required = false) int category, 
	                            @RequestParam(value = "keyword",defaultValue = "", required = false)  String keyword , 
	                            @PageableDefault(size = 5,page = 0) Pageable pageable)
	{
	    String main = null;
	    String url = null;
	    Page<OrdersDTO> ordersPage = null;
	    List<AddressDTO> addressDTOList = new ArrayList<>();
	    List<List<OrderItemDTO>> orderItemDTOList_ = new ArrayList<>();

	    String merchantId = authService.getCurrentUser(session).getId();
	    String storeName = ordersService.getStoreNameByMerchantId(merchantId);
	    
	    
	    if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
	    {
	        Map<String, Object> dataMap = new HashMap<>();
	        dataMap.put("category", category);
	        dataMap.put("keyword", keyword);
	        dataMap.put("pageable", pageable);
	        dataMap.put("merchant_id", authService.getCurrentUser(session).getId());
	        dataMap.put("store_name", storeName);
	        
	        ordersPage = ordersService.getMOrdersPage(dataMap);
	        
	        Map<String, Object> params = new HashMap<>();
	        params.put("storeName", storeName);
	        params.put("status", "결제완료");
	        int completedPaymentOrders = ordersService.countOrdersByStatus(params);
	        model.addAttribute("completedPaymentOrders", completedPaymentOrders);
	        
	        params.put("status", "상품준비중");
	        int preparingOrders = ordersService.countOrdersByStatus(params);
	        model.addAttribute("preparingOrders", preparingOrders);

	        params.put("status", "배송시작");
	        int deliveryStartedOrders = ordersService.countOrdersByStatus(params);
	        model.addAttribute("deliveryStartedOrders", deliveryStartedOrders);

	        params.put("status", "배송중");
	        int deliveringOrders = ordersService.countOrdersByStatus(params);
	        model.addAttribute("deliveringOrders", deliveringOrders);

	        params.put("status", "배송완료");
	        int deliveredOrders = ordersService.countOrdersByStatus(params);
	        model.addAttribute("deliveredOrders", deliveredOrders);
	        
	        if (ordersPage != null && !ordersPage.isEmpty()) {
	            for (OrdersDTO order : ordersPage.getContent()) {
	            	AddressDTO addressDTO = ordersService.getUserAddress(order.getAddress_id());
	                List<OrderItemDTO> orderItemList = ordersService.getOrderItemList(order.getId());
	                
	                if (addressDTO != null) {
	                    addressDTOList.add(addressDTO);
	                    orderItemDTOList_.add(orderItemList);
	                }
	            }
	        }
	    }
	    else
	    {
	        url = "redirect:/";
	        return url;
	    }

	    main = "merchant/view/DeliveryList";
	    model.addAttribute("orderItemDTOList_",orderItemDTOList_);
	    model.addAttribute("addressDTOList", addressDTOList);
	    model.addAttribute("size",size);
	    model.addAttribute("ordersPage",ordersPage);
	    model.addAttribute("main", main);
	    return "Index";
	}
	
	@PostMapping("/my-page/delivery/list/update")
	  public String updateDelivery(HttpSession session,HttpServletRequest req, HttpServletResponse resp, Model model, @RequestBody List<OrdersDTO> orders) {
	          String url = null;
	          int r = 0;
	          
	          RoleStatus status = authService.checkRoleStatus(session);
	          if(status == RoleStatus.MERCHANT) {
	              for (OrdersDTO ordersDTO : orders) {
	                  r = ordersService.updateDelivery(ordersDTO);
	              }
	              url = "redirect:/my-page/delivery/list";
	          } else {
	              url = "redirect:/";
	          }

	          return url;
	      }
	
	@PostMapping("/my-page/delivery/list/delete")
	public String deleteDelivery(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model, @RequestBody List<OrdersDTO> orders) {
	    String url = null;

	    RoleStatus status = authService.checkRoleStatus(session);
	    if(status == RoleStatus.MERCHANT) {
	        int r = ordersService.deleteDelivery(orders);
	        if (r == orders.size()) {
	            url = "redirect:/my-page/delivery/list";
	        } else {
	            // handle error
	        }
	    } else {
	        url = "redirect:/";
	    }

	    return url;
	}
	
	@RequestMapping("/my-page/item/list")
	public String getitemList(HttpSession session ,
								HttpServletRequest req,
								HttpServletResponse resp, 
								Model model ,
								@RequestParam(value = "size", required = false, defaultValue = "5") int size,
								@RequestParam(value = "category",defaultValue = "0", required = false) int category, 
								@RequestParam(value = "keyword",defaultValue = "", required = false)  String keyword , 
								@PageableDefault(size = 5,page = 0) Pageable pageable)
	{
		String main = null;
		String url = null;
		Page<SaleDTO> salePage = null;
		
		
		if(authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
		{
			Map<String, Object> dataMap = new HashMap<>();
			dataMap.put("category", category);
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
		
		
		main = "merchant/view/ItemList";
		model.addAttribute("size",size);
		model.addAttribute("salePage",salePage);
		model.addAttribute("main", main);
		return "Index";
	}
	
	
	
}
