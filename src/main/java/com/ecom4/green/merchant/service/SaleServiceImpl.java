package com.ecom4.green.merchant.service;


import com.ecom4.green.data.RequestPageList;
import com.ecom4.green.merchant.dao.ProductDAO;
import com.ecom4.green.merchant.dao.SaleDAO;
import com.ecom4.green.merchant.dto.SaleDTO;
import com.ecom4.green.merchant.dto.SaleProductDTO;
import com.ecom4.green.user.dao.ReviewDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class SaleServiceImpl implements SaleService
{

        @Autowired
        SaleDAO saleDAO;

        @Autowired
        ProductDAO productDAO;

        @Autowired
        ReviewDAO reviewDAO;

        @Override
        public Page<SaleDTO> getSalePage(Map<String, Object> dataMap)
        {
	      RequestPageList<?> requestPageList = RequestPageList.builder()
		        .data(dataMap)
		        .pageable((Pageable) dataMap.get("pageable"))
		        .build();

//	      현재 요청한 콘텐츠 size 갯수만큼만 List에 담음
	      List<SaleDTO> content = saleDAO.getSalePage(requestPageList);
//	      size 갯수 상관없이 전부 , 페이지네이션을 위해서
	      int total = saleDAO.getSaleListCount(dataMap);

	      for (SaleDTO ele : content)
	      {
		    ele.setImage_path(saleDAO.selectImagePath(ele.getImage_group_id()));

		    Integer result = saleDAO.selectMinPrice(ele.getId());
		    int minPrice;
		    if (result != null)
		    {
			  minPrice = result;
		    }
		    else
		    {
			  minPrice = 0;
		    }
		    ele.setMin_price(minPrice);

		    ele.setStore_name(saleDAO.selectStoreName(ele.getMerchant_id()));

		    Map<String, Object> map = new HashMap<>();
		    map.put("sale_id", ele.getId());
		    int review_count = reviewDAO.selectReviewCountByMap(map);
		    int review_total_star = reviewDAO.selectReviewTotalStarByMap(map);
		    ele.setReview_count(review_count);
		    if (review_count != 0)
		    {
			  ele.setReview_average_star(review_total_star / review_count);
		    }

	      }

	      return new PageImpl<>(content, (Pageable) dataMap.get("pageable"), total);
        }

        @Override
        public void insertSale(SaleDTO saleDTO) throws Exception
        {
	      int r = saleDAO.insertSale(saleDTO);


        }

        @Override
        public SaleDTO getSale(int saleID)
        {
	      SaleDTO saleDTO = saleDAO.getSale(saleID);
	      saleDTO.setMin_price(saleDAO.selectMinPrice(saleDTO.getId()));
	      saleDTO.setStore_name(saleDAO.selectStoreName(saleDTO.getMerchant_id()));
	      saleDTO.setImage_group_path(saleDAO.selectImageGroupPath(saleDTO.getImage_group_id()));
	      return saleDTO;
        }

        @Override
        public int updateSale(SaleDTO saleDTO)
        {
	      return saleDAO.updateSale(saleDTO);
        }
//        @Override
//        public void updateSale(SaleDTO saleDTO) throws Exception
//        {
//        	int r = saleDAO.updateSale(saleDTO);
//        	if(r < 1)
//        	{
//        		throw new Exception("정상적으로 판매글 정보가 수정 되지 않았습니다.");
//        	}
//        }

        @Override
        public int deleteSale(SaleDTO saleDTO)
        {
	      return saleDAO.deleteSale(saleDTO);
        }
//        @Override
//        public void deleteSale(int saleID) throws Exception
//        {
//        	int r = saleDAO.deleteSale(saleID);
//        	
//        	if(r<1)
//        	{
//        		throw new Exception("정상적으로 판매글 정보가 삭제 되지 않았습니다.");
//        	}
//        }

        @Override
        public void insertSaleProductList(List<SaleProductDTO> saleProductDTOList, int sale_id)
        {
	      int r = saleDAO.insertSaleProductList(saleProductDTOList, sale_id);
        }

        @Override
        public int selectMaxSaleId()
        {
	      return saleDAO.selectMaxSaleId();
        }

        @Override
        public List<SaleProductDTO> selectSaleProductListMain(int saleId)
        {
	      List<SaleProductDTO> saleProductList = saleDAO.selectSaleProductListMain(saleId);

	      for (SaleProductDTO ele : saleProductList)
	      {
		    ele.setBefore_price(productDAO.getProductPrice(ele.getProduct_id()));
	      }

	      return saleProductList;
        }

        @Override
        public List<SaleProductDTO> selectSaleProductListSub(int saleId)
        {
	      List<SaleProductDTO> saleProductList = saleDAO.selectSaleProductListSub(saleId);
	      for (SaleProductDTO ele : saleProductList)
	      {
		    ele.setBefore_price(productDAO.getProductPrice(ele.getProduct_id()));
	      }

	      return saleProductList;

        }

        @Override
        public void updateSaleProduct(List<SaleProductDTO> saleProductDTOList, int sale_id)
        {

	      saleDAO.deleteSaleProduct(sale_id);
	      saleDAO.insertSaleProductList(saleProductDTOList, sale_id);
	      // TODO Auto-generated method stub

        }

        @Override
        public void updateTotalRate(Map<String, Object> hashMap)
        {
	      saleDAO.updateTotalRate(hashMap);
        }


}
