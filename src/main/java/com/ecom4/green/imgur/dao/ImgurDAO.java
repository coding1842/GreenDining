package com.ecom4.green.imgur.dao;

import com.ecom4.green.imgur.dto.ImgurDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ImgurDAO
{

        int insertImgeList(@Param("list") List<ImgurDTO> imgurDTOList,@Param("max_group_id") int max_group_id);

        Integer selectMaxGroupId();

        List<ImgurDTO> selectImageList(@Param("group_id") int group_id);

        int deleteImageList(int groupId);
}
