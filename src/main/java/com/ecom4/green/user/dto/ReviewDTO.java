package com.ecom4.green.user.dto;

import java.util.List;

import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.imgur.dto.ImgurDTO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewDTO {

	private int id;
	private String user_id;
	private int order_id;
	private int sale_id;
	private int product_id;
	private int star;
	private String title;
	private String content;
	private String created_at;
	private int child_id;
	private int image_group_id;
	
	
	
//	DB 필드 아님
	private List<ImgurDTO> imgurList;
}
