package com.ecom4.green.order.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDTO {

	private int id;
	private String status;
	private int created_at;
	private String user_id;
	private int address_id;
}
