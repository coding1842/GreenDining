package com.ecom4.green.user.service;

import com.ecom4.green.user.dto.CartDTO;

import java.util.List;

public interface CartService
{
        int insertCart(List<CartDTO> cartDTOList,String user_id);
}
