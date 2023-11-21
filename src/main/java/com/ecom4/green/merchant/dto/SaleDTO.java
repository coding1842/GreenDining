package com.ecom4.green.merchant.dto;

import com.sun.xml.messaging.saaj.soap.impl.TextImpl;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@ToString
public class SaleDTO
{
        private  int id;
        private String title;
        private String content;
        private String status;
        private int discount;
        private String started_at;
        private String ended_at;

        private String created_at;
        private int image_group_id;
        private String merchant_id;
        private int category_code;
        private int region_code;

//        DB없는 필드
        private String image_path;
        private int min_price;
        private String store_name;
        private List<String> image_group_path;
        
        
}
