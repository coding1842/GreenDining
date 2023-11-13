package com.ecom4.green.authentication.service;

import javax.servlet.http.HttpSession;

import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.merchant.dto.MerchantDTO;
import com.ecom4.green.user.dto.UserDTO;

public interface AuthService {

	int signUpUser(UserDTO userDto) throws Exception;

	int idCheck(String id);

	UserDTO getUser(UserDTO udto);

	 RoleStatus checkRoleStatus(HttpSession session);
	 
     UserDTO getCurrentUser(HttpSession session);

	int signUpBusiness(UserDTO userDto, MerchantDTO merchantDto);

	

}
