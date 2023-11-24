

package com.ecom4.green.user.service;

import com.ecom4.green.user.dto.CartDTO;

import java.util.List;

public interface CartService{
		List<CartDTO> selectCartList(String id);
		
		int updateCart(CartDTO cartDto);
		
		int deleteCart(CartDTO cartDTO);

        int insertCart(List<CartDTO> cartDTOList,String user_id);

        int checkDuplication(int sale_id);
}
