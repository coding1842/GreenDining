package com.ecom4.green.order.service;

import java.util.List;

import com.ecom4.green.user.dto.CartDTO;

public interface OrderService {

	
	int insertOrder(List<CartDTO> cartDTOList, String user_id);

	List<CartDTO> selectOrderList(String id);


}
