package com.ecom4.green.order.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ecom4.green.data.RequestPageList;
import com.ecom4.green.merchant.dto.ProductDTO;
import com.ecom4.green.order.dto.OrderItemDTO;
import com.ecom4.green.order.dto.OrdersDTO;
import com.ecom4.green.user.dto.AddressDTO;

@Mapper
public interface OrdersDAO
{


        List<OrdersDTO> getOrdersPage(RequestPageList<?> requestPageList);

        int getOrdersCount(@Param("map") Map<String, Object> dataMap);

        List<OrderItemDTO> getOrderItemList(@Param("order_id") int order_id);

        OrdersDTO getOrderDetail(int order_id);

        int countInDelivery(String userId);

        int insertOrder(@Param("user_id") String userId, @Param("address_id") int addressId);

        int insertOrderItemList(@Param("list") List<OrderItemDTO> orderItemDTOList, @Param("order_id") int orderId);

        int selectMaxOrderId();

        void deleteOrder(@Param("order_id") int orderId);

        void deleteOrderItem(@Param("order_id") int orderId);

        void updateOrderTransactionId(@Param("map") Map<String, Object> orderMap);

        void cancelOrder(@Param("order_id") int orderId);
	AddressDTO getUserAddress(int address_id);

	ProductDTO getProductByOrderId(int id);

	List<OrdersDTO> getMOrdersPage(RequestPageList<?> requestPageList);

	int getMOrdersListCount(@Param("map") Map<String, Object> dataMap);

	String getStoreNameByMerchantId(String merchantId);

	int updateDelivery(OrdersDTO ordersDTO);

	int countOrdersByStatus(Map<String, Object> params);







}
