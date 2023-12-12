package com.ecom4.green.user.service;

import java.util.List;
import java.util.Map;

import com.ecom4.green.user.dto.AddressDTO;
import com.ecom4.green.user.dto.ReviewDTO;
import com.ecom4.green.user.dto.UserDTO;
import com.ecom4.green.user.dto.CartDTO;
import com.ecom4.green.user.dto.QnaDTO;

public interface UserService
{
        void insertAddress(AddressDTO addressDTO);

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

	//Qna -----------------------------
	int insertQna(QnaDTO qnaDTO);

	List<QnaDTO> selectQnaList(QnaDTO qna);

	QnaDTO selectQnaDetail(int qna_id);

	int updateQna(QnaDTO qnaDTO);

	int deleteQna(QnaDTO qnaDTO);

	QnaDTO qnaUp(QnaDTO qnaDto);

	

        AddressDTO selectAddress(Map<String, Object> map);

		AddressDTO getOrderAddress(int order_id);
}
