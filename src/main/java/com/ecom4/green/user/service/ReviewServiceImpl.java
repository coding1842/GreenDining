package com.ecom4.green.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecom4.green.imgur.dao.ImgurDAO;
import com.ecom4.green.imgur.dto.ImgurDTO;
import com.ecom4.green.user.dao.ReviewDAO;
import com.ecom4.green.user.dto.AddressDTO;
import com.ecom4.green.user.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	AddressDTO addressDTO;
	
	@Autowired
	ReviewDAO reviewDao;
	
	@Autowired
	ImgurDAO imgurDAO;
	//review
		@Override
		public int insertReview(ReviewDTO reviewDTO) {
			return reviewDao.insertReview(reviewDTO);
		}

		@Override
		public int updateReview(ReviewDTO reviewDTO) {
			return reviewDao.updateReview(reviewDTO);
		}

		

		@Override
		public List<ReviewDTO> selectReviewList(ReviewDTO reviewDTO) {
			
			List<ReviewDTO> list = reviewDao.selectReviewList(reviewDTO);
			
			for(ReviewDTO ele : list)
			{
				List<ImgurDTO> imgurList = imgurDAO.selectImageList(ele.getImage_group_id());
				ele.setImgurList(imgurList);
		
			}
			return list;
		}

		@Override
		public ReviewDTO selectReview(ReviewDTO review) {
			return reviewDao.selectReview(review);
		}


		@Override
		public List<ReviewDTO> selectReviewList(String id) {
			return reviewDao.selectReviewList(id);
		}

	
		@Override
		public int deleteReview(ReviewDTO reviewDTO) {
			return reviewDao.deleteReview(reviewDTO);
		}


}