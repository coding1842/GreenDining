package com.ecom4.green.merchant.service;


import com.ecom4.green.data.RequestPageList;
import com.ecom4.green.merchant.dao.ProductDAO;
import com.ecom4.green.merchant.dao.SaleDAO;
import com.ecom4.green.merchant.dto.SaleDTO;
import com.ecom4.green.merchant.dto.SaleProductDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

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

        @Override
        public  Page<SaleDTO>  getSalePage(Map<String, Object> dataMap )
        {
                RequestPageList<?> requestPageList = RequestPageList.builder()
                            .data(dataMap)
                            .pageable((Pageable)dataMap.get("pageable"))
                            .build();

                List<SaleDTO> content = saleDAO.getSalePage(requestPageList);
                int total = saleDAO.getSaleListCount(dataMap);
                
                for (SaleDTO ele : content) {
                    ele.setImage_path(saleDAO.selectImagePath(ele.getImage_group_id()));

                    // SelectMinPrice를 호출하는 부분
                    Integer result = saleDAO.selectMinPrice(ele.getId());
                    int minPrice;
                    if (result != null) {
                        minPrice = result;
                    } else {
                        // 적절한 기본값 할당 또는 오류 처리
                        minPrice = 0;  // 예시입니다. 실제로는 적절한 기본값 또는 오류 처리를 해야합니다.
                    }
                    ele.setMin_price(minPrice);

                    ele.setStore_name(saleDAO.selectStoreName(ele.getMerchant_id()));
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
        public void insertSaleProductList(List<SaleProductDTO> saleProductDTOList, int sale_id) throws Exception
        {
                int r = saleDAO.insertSaleProductList(saleProductDTOList,sale_id);

                if(r<1)
                {
                        throw new Exception("정상적으로 판매글상품정보가 삽입 되지 않았습니다.");
                }
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

                for(SaleProductDTO ele : saleProductList)
                {
                        ele.setBefore_price(productDAO.getProductPrice(ele.getProduct_id()));
                }

                return saleProductList;
        }

        @Override
        public List<SaleProductDTO> selectSaleProductListSub(int saleId)
        {
                List<SaleProductDTO> saleProductList = saleDAO.selectSaleProductListSub(saleId);
                for(SaleProductDTO ele : saleProductList)
                {
                        ele.setBefore_price(productDAO.getProductPrice(ele.getProduct_id()));
                }

                return saleProductList;

        }

            @Override
            public void updateSaleProduct(List<SaleProductDTO> saleProductDTOList, int sale_id) {

                      saleDAO.deleteSaleProduct(sale_id);
                      saleDAO.insertSaleProductList(saleProductDTOList, sale_id);
                      // TODO Auto-generated method stub

            }


}
