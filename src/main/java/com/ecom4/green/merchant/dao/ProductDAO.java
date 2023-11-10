package com.ecom4.green.merchant.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ecom4.green.data.RequestPageList;
import com.ecom4.green.merchant.dto.ProductDTO;
import com.ecom4.green.merchant.dto.SaleDTO;

@Mapper
public interface ProductDAO
{

	int insertProduct(ProductDTO productDTO);

	int updateProduct(ProductDTO productDTO);

	int deleteProduct(@Param("id") int productID);

	ProductDTO getProduct(@Param("id") int productID);

	List<ProductDTO> getProductList(RequestPageList<?> requestPageList);

	int getProductListCount(@Param("map") Map<String, Object> dataMap);
}
