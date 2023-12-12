package com.ecom4.green.authentication.dao;


import org.apache.ibatis.annotations.Mapper;

import com.ecom4.green.merchant.dto.MerchantDTO;
import com.ecom4.green.user.dto.UserDTO;

@Mapper
public interface AuthDAO
{

        int idCheck(String id);

        int signUpUser(UserDTO userDto);

        UserDTO getUser(UserDTO udto);

        int signUpBusiness(MerchantDTO merchantDto);


        String selectSalt(UserDTO userDto);

        int phoneCheck(String phone);
}
