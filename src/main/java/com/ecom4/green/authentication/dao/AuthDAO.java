package com.ecom4.green.authentication.dao;


import org.apache.ibatis.annotations.Mapper;

import com.ecom4.green.merchant.dto.MerchantDTO;
import com.ecom4.green.user.dto.UserDTO;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AuthDAO
{

        int idCheck(@Param("id") String id);

        int signUpUser(UserDTO userDto);

        UserDTO getUser(UserDTO udto);

        int signUpBusiness(MerchantDTO merchantDto);


        String selectSalt(UserDTO userDto);

        int phoneCheck(@Param("phone") String phone);

        void updateUserByUserDTO(UserDTO userDTO);
}
