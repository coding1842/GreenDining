package com.ecom4.green.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecom4.green.user.dao.UserDAO;
import com.ecom4.green.user.dto.AddressDTO;

@Service
public class UserServiceImpl implements UserService
{
	@Autowired
	AddressDTO addressDTO;
	
	@Autowired
	UserDAO userDao;

	@Override
	public void insertAddress(AddressDTO addressDTO) throws Exception {
		int r = userDao.insertAddress(addressDTO);
		
		if(r < 1)
		{
			throw new Exception("주소가 정상적으로 삽입 되지 않았습니다.");
		}
		
	}

	@Override
	public List<AddressDTO> selectAddressList(String id) {
		return userDao.selectAddressList(addressDTO);
	}
}
