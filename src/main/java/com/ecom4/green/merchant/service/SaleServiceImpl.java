package com.ecom4.green.merchant.service;


import com.ecom4.green.data.RequestPageList;
import com.ecom4.green.merchant.dao.SaleDAO;
import com.ecom4.green.merchant.dto.SaleDTO;
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

        
}
