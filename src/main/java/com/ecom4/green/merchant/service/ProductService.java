package com.ecom4.green.merchant.service;

import com.ecom4.green.merchant.dto.ProductDTO;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;

public interface ProductService {

        ProductDTO getProduct(int productID);

        Page<ProductDTO> getProductPage(Map<String, Object> dataMap);
        List<ProductDTO> getProductList(String merchant_id);
        int insertProduct(ProductDTO productDTO);

        int updateProduct(ProductDTO productDTO);

        int deleteProduct(int productID);

		
}
