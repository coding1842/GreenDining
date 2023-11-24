

package com.ecom4.green.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ecom4.green.user.dto.CartDTO;

@Mapper
public interface CartDAO {
	public int insertCart(@Param("list") List<CartDTO> cartDTOList,@Param("user_id") String user_id);

    int checkDuplication(@Param("sale_id") int sale_id);
	//카트 추가
	public int addCart(CartDTO cart);
	
	//카드 삭제
	public int deleteCart(int product_id);
	
	//카트 수량 수정
	public int editCart(CartDTO cart);
	
	//카트 목록
	public List<CartDTO> getCart(String user_id);
	
	//카트 확인
	public CartDTO checkCart(CartDTO cart);

	List<CartDTO> selectCartList(@Param("user_id") String id);

	public int updateCart(CartDTO cartDto);

	public int deleteCart(CartDTO cartDto);
}
