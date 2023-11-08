package com.ecom4.green.user.dto;

import com.ecom4.green.constant.RoleStatus;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class UserDTO {

        private String id;
        private String 	password;
        private String name;
        private int phone;
        private String email;
        private RoleStatus role;
        private Timestamp created_at;
        private int country_code;
}
