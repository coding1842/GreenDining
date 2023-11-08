package com.ecom4.green.imgur.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ImgurDAO
{
        int InsertImageList(@Param("list")List<String> imgUrlList, @Param("saleID") int saleID);

}
