package com.ecom4.green.merchant.service;

import com.ecom4.green.merchant.dto.SaleDTO;
import com.ecom4.green.merchant.dto.SaleProductDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface SaleService
{
        Page<SaleDTO > getSaleList(Map<String, Object> dataMap);


        void insertSale(SaleDTO saleDTO) throws Exception;

        SaleDTO getSale(int saleID);

        void updateSale(SaleDTO saleDTO) throws Exception;

        void deleteSale(int saleID) throws Exception;

        void insertSaleProductList(List<SaleProductDTO> saleProductDTOList) throws Exception;
}
