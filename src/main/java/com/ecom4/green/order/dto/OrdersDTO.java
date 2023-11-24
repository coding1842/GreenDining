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
public class OrdersDTO {

        private int id;
        private String status;
        private String user_id;
        private String created_at;
        
        
}
