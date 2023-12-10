package com.ecom4.green.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.ecom4.green.user.dao.UserDAO;
import com.ecom4.green.user.dto.AddressDTO;
import com.ecom4.green.user.dto.ReviewDTO;
import com.ecom4.green.user.dto.UserDTO;
import com.ecom4.green.user.dto.CartDTO;
import com.ecom4.green.user.dto.ReviewDTO;

@Service
public class UserServiceImpl implements UserService
{
        @Autowired
        AddressDTO addressDTO;

        @Autowired
        UserDAO userDao;


        @Override
        public void insertAddress(AddressDTO addressDTO)
        {
	      int r = userDao.insertAddress(addressDTO);


        }

        @Override
        public List<AddressDTO> selectAddressList(String id)
        {
	      return userDao.selectAddressList(id);
        }

        @Override
        public int updateAddress(AddressDTO addressDTO)
        {
	      return userDao.updateAddress(addressDTO);
        }

        @Override
        public int deleteAddress(AddressDTO addressDTO)
        {
	      return userDao.deleteAddress(addressDTO);
        }


        //review
        @Override
        public int insertReview(ReviewDTO reviewDTO)
        {
	      return userDao.insertReview(reviewDTO);
        }

        @Override
        public List<ReviewDTO> selectReviewList(ReviewDTO reviewDTO)
        {
	      return userDao.selectReviewList(reviewDTO);
        }

        @Override
        public int updateReview(ReviewDTO reviewDTO)
        {
	      return userDao.updateReview(reviewDTO);
        }

        @Override
        public int deleteReview(ReviewDTO reviewDTO)
        {
	      return userDao.deleteReview(reviewDTO);
        }

        @Override
        public UserDTO getOrderUser(String userId)
        {
	      // TODO Auto-generated method stub
	      return userDao.getOrderUser(userId);
        }

        @Override
        public AddressDTO getOrderAddress(String userId)
        {
	      // TODO Auto-generated method stub
	      return null;
        }

        @Override
        public AddressDTO selectAddress(Map<String, Object> map)
        {
	      return userDao.selectAddress(map);
        }


}
