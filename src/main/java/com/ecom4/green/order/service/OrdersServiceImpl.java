package com.ecom4.green.order.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.ecom4.green.data.RequestPageList;
import com.ecom4.green.imgur.dao.ImgurDAO;
import com.ecom4.green.merchant.dao.ProductDAO;
import com.ecom4.green.merchant.dao.SaleDAO;
import com.ecom4.green.merchant.dto.ProductDTO;
import com.ecom4.green.merchant.dto.SaleProductDTO;
import com.ecom4.green.order.dao.OrdersDAO;
import com.ecom4.green.order.dto.OrderItemDTO;
import com.ecom4.green.order.dto.OrdersDTO;
import com.ecom4.green.user.dto.AddressDTO;

@Service
public class OrdersServiceImpl implements OrdersService
{


	@Autowired
    private SqlSessionTemplate sqlSession;
	
	@Autowired
	SaleDAO saleDAO;
	
	@Autowired
	ImgurDAO imgurDAO;
	
	@Autowired
	OrdersDAO ordersDAO;

	@Autowired
	ProductDAO productDAO;
	
	@Override
	public Page<OrdersDTO> getOrdersPage(Map<String, Object> dataMap) {
		
		RequestPageList<?> requestPageList = RequestPageList.builder()
				.data(dataMap)
				.pageable((Pageable)dataMap.get("pageable"))
				.build();
		
		List<OrdersDTO> content = ordersDAO.getOrdersPage(requestPageList);
		int total = ordersDAO.getOrdersCount(dataMap);
		
		return new PageImpl<>(content,(Pageable)dataMap.get("pageable"), total);
	}


	@Override
	public OrdersDTO getOrderDetail(int order_id) {
		
		return ordersDAO.getOrderDetail(order_id);
	}
	
	@Override
	public int countInDelivery(String userId) {
	    return ordersDAO.countInDelivery(userId);
	}

	@Override
	public Page<OrdersDTO> getOrdersPageByMId(Map<String, Object> dataMap) {
		RequestPageList<?> requestPageList = RequestPageList.builder()
				.data(dataMap)
				.pageable((Pageable)dataMap.get("pageable"))
				.build();
		
		List<OrdersDTO> content = ordersDAO.getOrdersPage(requestPageList);
		int total = ordersDAO.getOrdersCount(dataMap);
		
		return new PageImpl<>(content,(Pageable)dataMap.get("pageable"), total);
	
	}

	@Override
	public AddressDTO getUserAddress(int address_id) {
		// TODO Auto-generated method stub
		return ordersDAO.getUserAddress(address_id);
	}

	@Override
	public ProductDTO getProductByOrderId(int id) {
		// TODO Auto-generated method stub
		return ordersDAO.getProductByOrderId(id);
	}

	@Override
	public Page<OrdersDTO> getMOrdersPage(Map<String, Object> dataMap) {
		 RequestPageList<?> requestPageList = RequestPageList.builder()
                 .data(dataMap)
                 .pageable((Pageable)dataMap.get("pageable"))
                 .build();

     List<OrdersDTO> content = ordersDAO.getMOrdersPage(requestPageList);
     int total = ordersDAO.getMOrdersListCount(dataMap);

     return new PageImpl<>(content,(Pageable)dataMap.get("pageable"),total);
	}

	@Override
	public String getStoreNameByMerchantId(String merchantId) {
		return ordersDAO.getStoreNameByMerchantId(merchantId);
	}

	@Override
	public int updateDelivery(OrdersDTO ordersDTO) {
		return ordersDAO.updateDelivery(ordersDTO);
	}


	@Override
	public int deleteDelivery(List<OrdersDTO> orders) {
	    int count = 0;
	    for (OrdersDTO order : orders) {
	        sqlSession.delete("deleteOrderItem", order);
	        sqlSession.delete("deleteOrder", order);
	        count++;
	    }
	    return count;
	}

	@Override
	public int countOrdersByStatus(Map<String, Object> params) {
		return ordersDAO.countOrdersByStatus(params);
	}

        @Override
        public List<OrderItemDTO> getOrderItemList(int order_id)
        {
	      List<OrderItemDTO> orderItemList = ordersDAO.getOrderItemList(order_id);

	      for (OrderItemDTO ele : orderItemList)
	      {
		    ProductDTO product = productDAO.getProduct(ele.getProduct_id());
		    SaleProductDTO saleProduct = saleDAO.selectSaleProduct(ele.getSale_id(), ele.getProduct_id());
		    ele.setImage_path(imgurDAO.selectImagePath(product.getImage_group_id()));
		    ele.setName(saleProduct.getName());
	      }
	      return orderItemList;
        }

        @Override
        public int insertOrder(String userId, int addressId)
        {

	      ordersDAO.insertOrder(userId, addressId);
	      int r = ordersDAO.selectMaxOrderId();
	      return r;
        }

        @Override
        public int insertOrderItemList(List<OrderItemDTO> orderItemDTOList, int orderId)
        {

	      return ordersDAO.insertOrderItemList(orderItemDTOList, orderId);
        }

        @Override
        public void deleteOrder(int orderId)
        {

	      ordersDAO.deleteOrder(orderId);
	      ordersDAO.deleteOrderItem(orderId);
        }

        @Override
        public void updateOrderTransactionId(Map<String, Object> orderMap)
        {
	      ordersDAO.updateOrderTransactionId(orderMap);
        }

        @Override
        public int getOrderMaxId()
        {
	      int r = ordersDAO.selectMaxOrderId();
	      return r;
        }

        @Override
        public void cancelOrder(int orderId)
        {
	      ordersDAO.cancelOrder(orderId);
        }

	

	

	

	
	


	

	
}
	
	

