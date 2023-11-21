package com.ecom4.green.user.dao;

import com.ecom4.green.user.dto.CartDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CartDAO
{
        public int insertCart(@Param("list") List<CartDTO> cartDTOList,@Param("user_id") String user_id);

}
