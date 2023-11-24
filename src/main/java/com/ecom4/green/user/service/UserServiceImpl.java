package com.ecom4.green.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.ecom4.green.user.dao.UserDAO;
import com.ecom4.green.user.dto.AddressDTO;
<<<<<<< main
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
	public void insertAddress(AddressDTO addressDTO) throws Exception {
		int r = userDao.insertAddress(addressDTO);
		
		if(r < 1)
		{
			throw new Exception("주소가 정상적으로 삽입 되지 않았습니다.");
		}
		
	}

	@Override
	public List<AddressDTO> selectAddressList(String id) {
		return userDao.selectAddressList(id);
	}

	@Override
	public int updateAddress(AddressDTO addressDTO){
		return userDao.updateAddress(addressDTO);
	}

	@Override
	public int deleteAddress(AddressDTO addressDTO) {
		return userDao.deleteAddress(addressDTO);
	}
<<<<<<< main
	
	
	//review
	@Override
	public int insertReview(ReviewDTO reviewDTO) {
		return userDao.insertReview(reviewDTO);
	}

	@Override
	public List<ReviewDTO> selectReviewList(String id) {
		return userDao.selectReviewList(id);
	}

	@Override
	public int updateReview(ReviewDTO reviewDTO) {
		return userDao.updateReview(reviewDTO);
	}

	@Override
	public int deleteReview(ReviewDTO reviewDTO) {
		return userDao.deleteReview(reviewDTO);
	}

	@Override
	public UserDTO getOrderUser(String userId) {
		// TODO Auto-generated method stub
		return userDao.getOrderUser(userId);
	}

	@Override
	public AddressDTO getOrderAddress(String userId) {
		// TODO Auto-generated method stub
		return userDao.getOrderAddress(userId);
	}

}
