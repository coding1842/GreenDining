package com.ecom4.green.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecom4.green.user.dao.UserDAO;
import com.ecom4.green.user.dto.AddressDTO;
import com.ecom4.green.user.dto.QnaDTO;
import com.ecom4.green.user.dto.ReviewDTO;
import com.ecom4.green.user.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService
{
        @Autowired
        AddressDTO addressDTO;

        @Autowired
        UserDAO userDao;

        @Autowired
        QnaDTO qnaDTO;

        @Override
        public void insertAddress(AddressDTO addressDTO)
        {
	      int r = userDao.insertAddress(addressDTO);


        }

        //review ----------------------------------------------------
        @Override
        public int insertReview(ReviewDTO reviewDTO)
        {
	      return userDao.insertReview(reviewDTO);
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


        // QnA ----------------------------------------------------
        @Override
        public int insertQna(QnaDTO qnaDTO)
        {
	      return userDao.insertQna(qnaDTO);
        }

        @Override
        public List<QnaDTO> selectQnaList(QnaDTO qnaDTO)
        {
	      return userDao.selectQnaList(qnaDTO);
        }


        @Override
        public QnaDTO selectQnaDetail(int qna_id)
        {
	      return userDao.selectQnaDetail(qna_id);
        }

        @Override
        public int updateQna(QnaDTO qnaDTO)
        {
	      return userDao.updateQna(qnaDTO);
        }

        @Override
        public int deleteQna(QnaDTO qnaDTO)
        {
	      return userDao.deleteQna(qnaDTO);
        }

        @Override
        public QnaDTO qnaUp(QnaDTO qnaDto)
        {
	      System.err.println(qnaDto);
	      return userDao.qnaUp(qnaDto);
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
        public AddressDTO selectAddress(Map<String, Object> map)
        {
	      return userDao.selectAddress(map);
        }

        @Override
        public AddressDTO getOrderAddress(int order_id)
        {
	      // TODO Auto-generated method stub
	      int address_id = userDao.getAddressIdByOrderId(order_id);
	      return userDao.getOrderAddress(address_id);
        }

        @Override
        public AddressDTO selectAddressById(int addressId)
        {
	      return userDao.selectAddressById(addressId);
        }


}
