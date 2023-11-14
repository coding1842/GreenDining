package com.ecom4.green.user.service;

import java.util.List;

import com.ecom4.green.user.dto.AddressDTO;

public interface UserService
{

	void insertAddress(AddressDTO addressDTO) throws Exception;

	List<AddressDTO> selectAddressList(String id);
	
}
