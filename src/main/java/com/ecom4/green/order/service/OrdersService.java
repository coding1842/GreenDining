package com.ecom4.green.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;

import com.ecom4.green.merchant.dto.ProductDTO;
import com.ecom4.green.order.dto.OrderItemDTO;
import com.ecom4.green.order.dto.OrdersDTO;
import com.ecom4.green.user.dto.AddressDTO;

public interface OrdersService
{


        Page<OrdersDTO> getOrdersPage(Map<String, Object> dataMap);

        List<OrderItemDTO> getOrderItemList(int order_id);

        OrdersDTO getOrderDetail(int order_id);

        int countInDelivery(String userId);

	Page<OrdersDTO> getOrdersPageByMId(Map<String, Object> dataMap);

	AddressDTO getUserAddress(int address_id);

	ProductDTO getProductByOrderId(int id);

	Page<OrdersDTO> getMOrdersPage(Map<String, Object> dataMap);

	String getStoreNameByMerchantId(String merchantId);

	int updateDelivery(OrdersDTO ordersDTO);


	int deleteDelivery(List<OrdersDTO> orders);

	int countOrdersByStatus(Map<String, Object> params);



	
	

        int insertOrder(String userId, int addressId);

        int insertOrderItemList(List<OrderItemDTO> orderItemDTOList, int orderId);

        void deleteOrder(int orderId);

        void updateOrderTransactionId(Map<String, Object> orderMap);

        int getOrderMaxId();
	Page<OrdersDTO> getOrdersPageByMId(Map<String, Object> dataMap);

        void cancelOrder(int orderId);
	AddressDTO getUserAddress(int address_id);

	ProductDTO getProductByOrderId(int id);

	Page<OrdersDTO> getMOrdersPage(Map<String, Object> dataMap);

	String getStoreNameByMerchantId(String merchantId);

	int updateDelivery(OrdersDTO ordersDTO);


	int deleteDelivery(List<OrdersDTO> orders);

	int countOrdersByStatus(Map<String, Object> params);

	int insertOrder(String userId, int addressId);

	int insertOrderItemList(List<OrderItemDTO> orderItemDTOList, int orderId);
}
