package com.ecom4.green.merchant.service;

import com.ecom4.green.data.RequestPageList;
import com.ecom4.green.merchant.dao.ProductDAO;
import com.ecom4.green.merchant.dto.ProductDTO;
import com.ecom4.green.merchant.dto.SaleDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;

        @Override
        public ProductDTO getProduct(int productID)
        {
        	
	      return productDAO.getProduct(productID);
        }

        @Override
        public Page<ProductDTO> getProductList(Map<String, Object> dataMap)
        {
        	  RequestPageList<?> requestPageList = RequestPageList.builder()
                      .data(dataMap.get("category"))
                      .data(dataMap.get("keyword"))
                      .data(dataMap.get("merchant_id"))
                      .pageable((Pageable)dataMap.get("pageable"))
                      .build();

          List<ProductDTO> content = productDAO.getProductList(requestPageList);
          int total = productDAO.getProductListCount(dataMap);

          return new PageImpl<>(content,(Pageable)dataMap.get("pageable"),total);
        }

        @Override
        public int insertProduct(ProductDTO productDTO)
        {
          
	      return productDAO.insertProduct(productDTO);
        }

        @Override
        public int updateProduct(ProductDTO productDTO)
        {
        	
	      return productDAO.updateProduct(productDTO);
        }

        @Override
        public int deleteProduct(int productID)
        {
	      return productDAO.deleteProduct(productID);
        }

		
}
