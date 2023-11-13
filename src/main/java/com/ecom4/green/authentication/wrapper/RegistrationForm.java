package com.ecom4.green.authentication.wrapper;

import com.ecom4.green.merchant.dto.MerchantDTO;
import com.ecom4.green.user.dto.UserDTO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RegistrationForm {

	private UserDTO userDTO;
	private MerchantDTO merchantDTO;
}
