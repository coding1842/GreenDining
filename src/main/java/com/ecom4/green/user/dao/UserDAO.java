package com.ecom4.green.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ecom4.green.user.dto.AddressDTO;
@Mapper
public interface UserDAO {

	int insertAddress(AddressDTO addressDTO);

	List<AddressDTO> selectAddressList(AddressDTO addressDTO);

}
