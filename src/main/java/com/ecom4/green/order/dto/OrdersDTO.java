package com.ecom4.green.order.dto;

import com.ecom4.green.constant.RoleStatus;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
@ToString
public class OrdersDTO
{

	private int id;
	private String status;
	private String user_id;
	private int address_id;
	private String transaction_id;
	private String payment;
	private String merchant_id;
	
        
    // NO DB
    private int total_price;
    private int discount_price;
    private int payment_price;
    private int order_id;
    private String created_at;

}
