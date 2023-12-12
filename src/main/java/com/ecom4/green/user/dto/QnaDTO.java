package com.ecom4.green.user.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Component
public class QnaDTO {
	
	private int id;
	private String user_id;
	private int order_id;
	private int sale_id;
	private int product_id;
	private String title;
	private String content;
	private String created_at;
	private int child_id;
	private int image_group_id;
}
