package com.ecom4.green.user.service;

import com.ecom4.green.user.dao.CartDAO;
import com.ecom4.green.user.dto.CartDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService
{

        @Autowired
        CartDAO cartDAO;

        @Override
        public int insertCart(List<CartDTO> cartDTOList, String user_id)
        {
	      return cartDAO.insertCart(cartDTOList,user_id);
        }
}
