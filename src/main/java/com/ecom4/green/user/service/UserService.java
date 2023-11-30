package com.ecom4.green.user.service;

import java.util.List;

import com.ecom4.green.user.dto.AddressDTO;
import com.ecom4.green.user.dto.ReviewDTO;
import com.ecom4.green.user.dto.UserDTO;
import com.ecom4.green.user.dto.CartDTO;

public interface UserService
{
	void insertAddress(AddressDTO addressDTO) throws Exception;

	List<AddressDTO> selectAddressList(String id);

	int updateAddress(AddressDTO addressDTO);

	int deleteAddress(AddressDTO addressDTO);
	
	//review
	int insertReview(ReviewDTO reviewDTO);

//	List<ReviewDTO> selectReviewList(int sale_id);
	List<ReviewDTO> selectReviewList(ReviewDTO reviewDTO);

	int updateReview(ReviewDTO reviewDTO);

	int deleteReview(ReviewDTO reviewDTO);

	UserDTO getOrderUser(String userId);

	AddressDTO getOrderAddress(String userId);


	


}
