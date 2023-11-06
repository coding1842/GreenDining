package com.ecom4.green.merchant.dto;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.web.context.WebApplicationContext;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@Scope(value = WebApplicationContext.SCOPE_SESSION,
	   proxyMode = ScopedProxyMode.TARGET_CLASS)
@Data
@ToString
public class ProductDTO {
	private int no;
	private int stock;
	private int price;
	private int discount;
	private String name;
	private String detail;
	private String image;
	private String period;
	private String pr_date;
	private String textarea;
}


//private int rr;
//private int p_no     ;
//private int stock  ;
//private int price  ;
//private String p_name   ;
//private String detail ;
//private String pr_date;
//private String image  ;
//private String path   ;