package com.ecom4.green.order.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecom4.green.merchant.dao.ProductDAO;
import com.ecom4.green.merchant.dao.SaleDAO;
import com.ecom4.green.merchant.dto.ProductDTO;
import com.ecom4.green.merchant.dto.SaleDTO;
import com.ecom4.green.merchant.dto.SaleProductDTO;
import com.ecom4.green.order.dao.OrderDAO;
import com.ecom4.green.user.dto.CartDTO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDAO orderDao;
	
	@Autowired
	SaleDAO saleDao;
	
	@Autowired
	ProductDAO productDao;
	
	@Override
	public int insertOrder(List<CartDTO> cartDTOList, String user_id) {
		return orderDao.insertOrder(cartDTOList, user_id);
	}


	@Override
	public List<CartDTO> selectOrderList(String id) {
		List<CartDTO> cartDTOList = new ArrayList<>();
		
		cartDTOList = orderDao.selectOrderList(id);
		
		for(CartDTO cartDTO : cartDTOList)
		{
			SaleDTO sale = saleDao.getSale(cartDTO.getSale_id());
			ProductDTO product = productDao.getProduct(cartDTO.getProduct_id());
			SaleProductDTO saleProduct = saleDao.selectSaleProduct(cartDTO.getSale_id(), cartDTO.getProduct_id());
			
			cartDTO.setImage_path(saleDao.selectImagePath(sale.getImage_group_id()));
			cartDTO.setDiscount(sale.getDiscount());
			cartDTO.setTitle(sale.getTitle());
			cartDTO.setPrice(product.getPrice());
			cartDTO.setStock(product.getStock());
			cartDTO.setName(saleProduct.getName());
			cartDTO.setSale_type(saleProduct.getSale_type());
			cartDTO.initSaleTotal();
		}
		
		return cartDTOList;
	}

}
