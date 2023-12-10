package com.ecom4.green.user.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ecom4.green.user.dto.AddressDTO;
import com.ecom4.green.user.dto.ReviewDTO;
import com.ecom4.green.user.dto.UserDTO;
import com.ecom4.green.user.dto.CartDTO;

@Mapper
public interface UserDAO
{

        int insertAddress(AddressDTO addressDTO);

        List<AddressDTO> selectAddressList(@Param("user_id") String id);

        int updateAddress(AddressDTO addressDTO);

        int deleteAddress(AddressDTO addressDTO);

        //review
        int insertReview(ReviewDTO reviewDTO);

        //	List<ReviewDTO> selectReviewList(int id);
        List<ReviewDTO> selectReviewList(ReviewDTO reviewDTO);

        int updateReview(ReviewDTO reviewDTO);

        int deleteReview(ReviewDTO reviewDTO);

        UserDTO getOrderUser(String userId);


        AddressDTO selectAddress(@Param("map") Map<String, Object> map);
}
