package com.ecom4.green.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ecom4.green.user.dto.CartDTO;

@Mapper
public interface OrderDAO {

	int insertOrder(@Param("list") List<CartDTO> cartDTOList, @Param("user_id") String user_id);

	List<CartDTO> selectOrderList(@Param("user_id") String id);

}
