package com.ecom4.green.order.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;

import com.ecom4.green.order.dto.OrderItemDTO;
import com.ecom4.green.order.dto.OrdersDTO;

public interface OrdersService {

	

	Page<OrdersDTO> getOrdersPage(Map<String, Object> dataMap);

	List<OrderItemDTO> getOrderItemList(int order_id);

	OrdersDTO getOrderDetail(int order_id);

	int countInDelivery(String userId);


	int insertOrder(String userId, int addressId);

	int insertOrderItemList(List<OrderItemDTO> orderItemDTOList, int orderId);
}
