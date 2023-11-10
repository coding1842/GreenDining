package com.ecom4.green.authentication.service;

import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.user.dto.UserDTO;

import javax.servlet.http.HttpSession;

public interface AuthService
{
        RoleStatus checkRoleStatus(HttpSession session);
        UserDTO getCurrentUser(HttpSession session);


}
