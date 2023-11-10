package com.ecom4.green.imgur.service;

import com.ecom4.green.imgur.dto.ImgurDTO;

import java.util.List;

public interface ImgurService
{


        int insertImageList(List<ImgurDTO> imgurDTOList);

        List<ImgurDTO> selectImageList(int group_id);

        int deleteImageList(int group_id);
}
