package com.ecom4.green.merchant.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MerchantDTO
{
        private String id;
        private int business_number;
        private String business_name;
        private String store_name;
        private String report_number;
}
