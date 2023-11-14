package com.ecom4.green.merchant.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SaleProductDTO
{
        private int sale_id;
        private int product_id;
        private String name;
        private String sale_option;
        private String sale_type;
}
