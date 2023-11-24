package com.ecom4.green.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ecom4.green.data.RequestPageList;
import com.ecom4.green.order.dto.OrderItemDTO;
import com.ecom4.green.order.dto.OrdersDTO;

@Mapper
public interface OrdersDAO {

	

	List<OrdersDTO> getOrdersPage(RequestPageList<?> requestPageList);

	int getOrdersCount(@Param("map") Map<String, Object> dataMap);

	List<OrderItemDTO> getOrderItemList(@Param("order_id") int order_id);

	OrdersDTO getOrderDetail(int order_id);

	int countInDelivery(String userId);

}
