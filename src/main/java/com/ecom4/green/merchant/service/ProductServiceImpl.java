package com.ecom4.green.merchant.service;

import com.ecom4.green.merchant.dto.ProductDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {


        @Override
        public ProductDTO getProduct(int productID)
        {
	      return null;
        }

        @Override
        public List<ProductDTO> getProductList(String id)
        {
	      return null;
        }

        @Override
        public int InsertProduct(ProductDTO productDTO)
        {
	      return 0;
        }

        @Override
        public int updateProduct(ProductDTO productDTO)
        {
	      return 0;
        }

        @Override
        public int deleteProduct(int productID)
        {
	      return 0;
        }
}
