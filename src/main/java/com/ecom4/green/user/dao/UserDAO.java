package com.ecom4.green.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ecom4.green.user.dto.AddressDTO;
@Mapper
public interface UserDAO {

	int insertAddress(AddressDTO addressDTO);

	List<AddressDTO> selectAddressList(@Param("user_id") String id);

	int updateAddress(AddressDTO addressDTO);


	int deleteAddress(AddressDTO addressDTO);

}
