package com.ecom4.green.merchant.wrapper;

import com.ecom4.green.merchant.dto.SaleDTO;
import com.ecom4.green.merchant.dto.SaleProductDTO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class SaleForm
{
	private SaleDTO saleDTO;
	private List<SaleProductDTO> saleProductDTOList;
}
