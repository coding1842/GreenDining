package com.ecom4.green.imgur.dao;

import com.ecom4.green.imgur.dto.ImgurDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ImgurDAO
{

        int insertImageList(@Param("list") List<ImgurDTO> imgurDTOList);

        int selectMaxGroupId();

        List<ImgurDTO> selectImageList(@Param("group_id") int group_id);

        int deleteImageList(@Param("group_id") int groupId);

        List<ImgurDTO> selectImageAll();


}
