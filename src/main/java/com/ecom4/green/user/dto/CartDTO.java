package com.ecom4.green.user.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Component
public class CartDTO {
	// DB
	//sale 테이블	
	private String title;
	private int discount;
	//sale_product 테이블
	private String name;
	private String sale_type;
	//product 테이블
	private int price;
	private int stock;
	//cart 테이블
	private String user_id;
	private int product_id;
	private int sale_id;
	private int quantity;
	private String store_name;	
	
	// no DB
	private String image_path;
	private int before_price;
	private int after_price; //할인가격
	private int total_price; //총 금액 
	
	public void initSaleTotal() {
		this.after_price = (int) (this.price * (1-discount));
		this.total_price = this.after_price * this.quantity;
	}

}
