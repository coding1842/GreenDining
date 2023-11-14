package com.ecom4.green.merchant.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.merchant.dto.SaleDTO;
import com.ecom4.green.merchant.service.SaleService;

@RestController
@RequestMapping("/rest")
public class SaleRestController {
	
	@Autowired
	SaleService saleService;
	
	@Autowired
	AuthService authService;
	@GetMapping("/sale/list")
    public List<SaleDTO> selectSaleList() {
		
		return null;
        
    }

}
