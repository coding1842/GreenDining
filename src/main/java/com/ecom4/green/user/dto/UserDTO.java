package com.ecom4.green.user.dto;

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
public class UserDTO {

        private String id;
        private String password;
        private String name;
        private int phone;
        private String email;
        private RoleStatus role;
        private String created_at;
        private int country_code;
}
