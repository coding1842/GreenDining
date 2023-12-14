package com.ecom4.green.user.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecom4.green.imgur.dao.ImgurDAO;
import com.ecom4.green.merchant.dao.ProductDAO;
import com.ecom4.green.merchant.dao.SaleDAO;
import com.ecom4.green.merchant.dto.ProductDTO;
import com.ecom4.green.merchant.dto.SaleDTO;
import com.ecom4.green.merchant.dto.SaleProductDTO;
import com.ecom4.green.user.dao.CartDAO;
import com.ecom4.green.user.dto.CartDTO;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartDAO cartDao;
	@Autowired
	ProductDAO productDao;
	
	@Autowired
	ImgurDAO imgurDAO;
	@Autowired
	SaleDAO saleDao;
	
	@Override
	public List<CartDTO> selectCartList(String id) {
		
		List<CartDTO> cartDTOList = new ArrayList<>();
		
		cartDTOList = cartDao.selectCartList(id);
		
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

	@Override
	public int updateCart(CartDTO cartDto) {
		return cartDao.updateCart(cartDto);
	}

	@Override
	public int deleteCart(CartDTO cartDTO) {
		
		return cartDao.deleteCart(cartDTO);
	}

    @Override
    public int insertCart(List<CartDTO> cartDTOList, String user_id)
    {
      return cartDao.insertCart(cartDTOList,user_id);
    }

    @Override
    public int checkDuplication(int sale_id)
    {
            return cartDao.checkDuplication(sale_id);
    }

	@Override
	public void deleteCartByOrderItem(Map<String, Object> hashMap) {
		
		cartDao.deleteCartByOrderItem(hashMap);
		
	}
}



