package com.ecom4.green.merchant.dao;

import com.ecom4.green.data.RequestPageList;
import com.ecom4.green.merchant.dto.SaleDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface SaleDAO
{
        List<SaleDTO> getSaleList(RequestPageList<?> requestPageList);

        int getSaleListCount(@Param("map") Map<String, Object> dataMap);


        int insertSale(SaleDTO saleDTO);

        SaleDTO getSale(int saleID);

        int updateSale(SaleDTO saleDTO);

        int deleteSale(int saleID);
}
