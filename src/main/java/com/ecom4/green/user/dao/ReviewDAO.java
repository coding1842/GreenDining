package com.ecom4.green.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ecom4.green.user.dto.ReviewDTO;

@Mapper
public interface ReviewDAO {
	//review
		int insertReview(ReviewDTO reviewDTO);

		List<ReviewDTO> selectReviewList(String id);

		int updateReview(ReviewDTO reviewDTO);

		List<ReviewDTO> selectReviewList(ReviewDTO reviewDTO);

		ReviewDTO selectReview(ReviewDTO review);

		int deleteReview(ReviewDTO reviewDTO);
}
