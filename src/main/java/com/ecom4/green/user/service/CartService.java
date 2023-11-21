<<<<<<< main


package com.ecom4.green.user.service;

import com.ecom4.green.user.dto.CartDTO;

import java.util.List;

public interface CartService{
		List<CartDTO> selectCartList(String id);
		
		int updateCart(CartDTO cartDto);
		
		int deleteCart(CartDTO cartDTO);

        int insertCart(List<CartDTO> cartDTOList,String user_id);

        int checkDuplication(int sale_id);
=======
package com.ecom4.green.user.service;

import java.util.List;

import com.ecom4.green.user.dto.CartDTO;

public interface CartService {

	List<CartDTO> selectCartList(String id);

	int updateCart(CartDTO cartDto);

	int deleteCart(CartDTO cartDTO);


>>>>>>> #62 - 장바구니 수정,삭제 기능구현 완료
}
