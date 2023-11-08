package com.ecom4.green.merchant.service;

import com.ecom4.green.merchant.dto.ProductDTO;

import java.util.List;

public interface ProductService {

        ProductDTO getProduct(int productID);

        List<ProductDTO> getProductList(String id);

        int InsertProduct(ProductDTO productDTO);

        int updateProduct(ProductDTO productDTO);

        int deleteProduct(int productID);
}
