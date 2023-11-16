package com.ecom4.green.merchant.service;

import com.ecom4.green.merchant.dto.SaleDTO;
import com.ecom4.green.merchant.dto.SaleProductDTO;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.Map;

public interface SaleService
{
        Page<SaleDTO > getSalePage(Map<String, Object> dataMap);


        void insertSale(SaleDTO saleDTO) throws Exception;

        SaleDTO getSale(int saleID);

        void updateSale(SaleDTO saleDTO) throws Exception;

        void deleteSale(int saleID) throws Exception;

        void insertSaleProductList(List<SaleProductDTO> saleProductDTOList, int sale_id) throws Exception;

        int selectMaxSaleId();

        List<SaleProductDTO> selectSaleProductListMain(int saleId);

        List<SaleProductDTO> selectSaleProductListSUB(int saleId);
}
