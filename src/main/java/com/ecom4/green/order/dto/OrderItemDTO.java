package com.ecom4.green.order.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderItemDTO {
	
	// DB
	private int order_id;
	private int product_id;
	private int quantity;
	private String status;
	private String store_name;
	private int sale_id;
	private int before_price;
	private int after_price;
	
	// NOT DB
	private String name;
	private String image_path;
	
}
