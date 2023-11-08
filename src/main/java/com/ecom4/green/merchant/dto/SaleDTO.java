package com.ecom4.green.merchant.dto;

import com.sun.xml.messaging.saaj.soap.impl.TextImpl;

import java.sql.Timestamp;

public class SaleDTO
{
        private  int id;
        private String title;
        private String content;
        private String status;
        private int discount;
        private Timestamp started_at;
        private Timestamp ended_at;
        private Timestamp created_at;
        private int image_id;
        private String merchant_id;
        private int category_code;
        private int region_code;
}
