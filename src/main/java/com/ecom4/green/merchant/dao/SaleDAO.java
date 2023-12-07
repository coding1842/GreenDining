package com.ecom4.green.merchant.dao;

import com.ecom4.green.data.RequestPageList;
import com.ecom4.green.merchant.dto.SaleDTO;
import com.ecom4.green.merchant.dto.SaleProductDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface SaleDAO
{
        List<SaleDTO> getSalePage(RequestPageList<?> requestPageList);

        int getSaleListCount(@Param("map") Map<String, Object> dataMap);


        int insertSale(SaleDTO saleDTO);

        SaleDTO getSale(@Param("id") int sale_id);

        int updateSale(SaleDTO saleDTO);

        int deleteSale(SaleDTO saleDTO);
//        int deleteSale(int saleID);

        int insertSaleProductList(@Param("list") List<SaleProductDTO> saleProductDTOList, @Param("sale_id") int sale_id);

        int selectMaxSaleId();

        String selectImagePath(@Param("image_group_id") int image_group_id);

        //        int selectMinPrice(int id);
        Integer selectMinPrice(int id);

        String selectStoreName(@Param("merchant_id") String merchant_id);

        List<String> selectImageGroupPath(int image_group_id);

        SaleProductDTO selectSaleProduct(@Param("sale_id") int sale_id, @Param("product_id") int product_id);

        List<SaleProductDTO> selectSaleProductListMain(int sale_id);

        List<SaleProductDTO> selectSaleProductListSub(int sale_id);

        int deleteSaleProduct(int sale_id);


        void updateTotalRate(@Param("map") Map<String, Object> hashMap);
}
