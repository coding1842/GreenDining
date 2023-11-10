package com.ecom4.green.authentication.service;

import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.user.dto.UserDTO;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
public class AuthServiceImpl implements  AuthService
{

        @Override
        public RoleStatus checkRoleStatus(HttpSession session)
        {
	      UserDTO currentUser = (UserDTO) session.getAttribute("ssKey");

	      currentUser = new UserDTO();
//	      임시 가짜 신분 부여
	      currentUser.setRole(RoleStatus.MERCHANT);

	      if(currentUser == null)
	      {
		    return RoleStatus.NOT_LOGGED_IN;
	      }
	      else if(currentUser.getRole().equals(RoleStatus.USER))
	      {
		    return RoleStatus.USER;
	      }
	      else if(currentUser.getRole().equals(RoleStatus.MERCHANT))
	      {
		    return RoleStatus.MERCHANT;
	      }
	      else if(currentUser.getRole().equals(RoleStatus.ADMIN))
	      {
		    return RoleStatus.ADMIN;
	      }

	      return RoleStatus.NOT_FOUND;
        }

        @Override
        public UserDTO getCurrentUser(HttpSession session)
        {
	      UserDTO currentUser = (UserDTO) session.getAttribute("ssKey");

	      return currentUser;
        }



}
