package com.ecom4.green.user.service;

import java.util.List;

import com.ecom4.green.user.dto.AddressDTO;
<<<<<<< main
import com.ecom4.green.user.dto.ReviewDTO;
=======
import com.ecom4.green.user.dto.CartDTO;
>>>>>>> #62 - 장바구니 수정,삭제 기능구현 완료

public interface UserService
{

	void insertAddress(AddressDTO addressDTO) throws Exception;

	List<AddressDTO> selectAddressList(String id);

	int updateAddress(AddressDTO addressDTO);

	int deleteAddress(AddressDTO addressDTO);
	
	//review
	int insertReview(ReviewDTO reviewDTO);

	List<ReviewDTO> selectReviewList(String id);

	int updateReview(ReviewDTO reviewDTO);

	int deleteReview(ReviewDTO reviewDTO);




}
