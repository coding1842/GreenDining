package com.ecom4.green.member.dto;

import com.ecom4.green.member.constant.RoleStatus;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {

    private String name;
    private String id;
    private String password;
    private String phone;
    private String email;
    private String address;
    private String address2;
    private int zipcode;
    private RoleStatus role;

}
