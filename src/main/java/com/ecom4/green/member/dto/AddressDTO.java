package com.ecom4.green.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddressDTO {

    private String address;
    private String address2;
    private int zipcode;

    // 외래키 연관관계 Member : AddressDTO 일 대 다 관계

    private String member_id;
}
