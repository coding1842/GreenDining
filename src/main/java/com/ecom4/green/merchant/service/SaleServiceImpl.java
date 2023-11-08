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
        public  Page<SaleDTO>  getSaleList(int category, Pageable pageable)
        {
                RequestPageList<?> requestPageList = RequestPageList.builder()
                            .data(category)
                            .pageable(pageable)
                            .build();

                List<SaleDTO> content = saleDAO.getSaleList(requestPageList);
                int total = saleDAO.getSaleListCount(category);

                return new PageImpl<>(content,pageable,total);
        }

        @Override
        public Page<SaleDTO> getSaleList(int category, String keyword, Pageable pageable)
        {

                RequestPageList<?> requestPageList = RequestPageList.builder()
                            .data(category)
                            .data(keyword)
                            .pageable(pageable)
                            .build();

                List<SaleDTO> content = saleDAO.getSaleList(requestPageList);
                int total = saleDAO.getSaleListCount(category,keyword);

                return new PageImpl<>(content,pageable,total);
        }
}
