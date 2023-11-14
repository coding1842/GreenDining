package com.ecom4.green.merchant.service;


import com.ecom4.green.data.RequestPageList;
import com.ecom4.green.merchant.dao.SaleDAO;
import com.ecom4.green.merchant.dto.SaleDTO;
import com.ecom4.green.merchant.dto.SaleProductDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class SaleServiceImpl implements SaleService
{

        @Autowired
        SaleDAO saleDAO;

        @Override
        public  Page<SaleDTO>  getSaleList(Map<String, Object> dataMap )
        {
                RequestPageList<?> requestPageList = RequestPageList.builder()
                            .data(dataMap.get("store_name"))
                            .data(dataMap.get("category"))
                            .data(dataMap.get("keyword")) 
                            .pageable((Pageable)dataMap.get("pageable"))
                            .build();

                List<SaleDTO> content = saleDAO.getSaleList(requestPageList);
                int total = saleDAO.getSaleListCount(dataMap);

                return new PageImpl<>(content,(Pageable)dataMap.get("pageable"),total);
        }

        @Override
        public void insertSale(SaleDTO saleDTO) throws Exception
        {
                int r = saleDAO.insertSale(saleDTO);
                if(r < 1)
                {
                        throw new Exception("정상적으로 판매글 정보가 삽입되지 않았습니다.");
                }

        }

        @Override
        public SaleDTO getSale(int saleID)
        {
                return saleDAO.getSale(saleID);
        }

        @Override
        public void updateSale(SaleDTO saleDTO) throws Exception
        {
                int r = saleDAO.updateSale(saleDTO);
                if(r < 1)
                {
                        throw new Exception("정상적으로 판매글 정보가 수정 되지 않았습니다.");
                }
        }

        @Override
        public void deleteSale(int saleID) throws Exception
        {
                int r = saleDAO.deleteSale(saleID);

                if(r<1)
                {
                        throw new Exception("정상적으로 판매글 정보가 삭제 되지 않았습니다.");
                }
        }

        @Override
        public void insertSaleProductList(List<SaleProductDTO> saleProductDTOList) throws Exception
        {
                int r = saleDAO.insertSaleProductList(saleProductDTOList);

                if(r<1)
                {
                        throw new Exception("정상적으로 판매글상품정보가 삽입 되지 않았습니다.");
                }
        }


}
