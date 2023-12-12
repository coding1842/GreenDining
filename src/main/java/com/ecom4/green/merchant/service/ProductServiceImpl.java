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
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService
{

        @Autowired
        ProductDAO productDAO;

        @Override
        public ProductDTO getProduct(int productID)
        {

	      return productDAO.getProduct(productID);
        }

        @Override
        public Page<ProductDTO> getProductPage(Map<String, Object> dataMap)
        {
	      RequestPageList<?> requestPageList = RequestPageList.builder()
		        .data(dataMap)
		        .pageable((Pageable) dataMap.get("pageable"))
		        .build();

	      List<ProductDTO> content = productDAO.getProductPage(requestPageList);
	      int total = productDAO.getProductListCount(dataMap);

	      return new PageImpl<>(content, (Pageable) dataMap.get("pageable"), total);
        }

        @Override
        public List<ProductDTO> getProductList(String merchant_id)
        {

	      return productDAO.getProductList(merchant_id);
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
        public int deleteProduct(ProductDTO productDTO)
        {
	      return productDAO.deleteProduct(productDTO);
        }

        @Override
        public void updateStock(Map<String, Object> hashMap)
        {
	      productDAO.updateStock(hashMap);
        }

//        @Override
//        public int deleteProduct(int productID)
//        {
//	      return productDAO.deleteProduct(productID);
//        }


}
