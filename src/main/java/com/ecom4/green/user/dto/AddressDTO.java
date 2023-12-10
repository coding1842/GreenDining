package com.ecom4.green.user.dto;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@Scope(value = WebApplicationContext.SCOPE_SESSION,
	  proxyMode = ScopedProxyMode.TARGET_CLASS)
@ToString
@Component
public class AddressDTO
{
        private String user_id;
        private int id;
        private String name;
        private String phone;
        private String address;
        private String address2;
        private String zipcode;
        private String request_option;
        private String request_text;
}
