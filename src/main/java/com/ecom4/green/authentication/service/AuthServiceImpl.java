package com.ecom4.green.authentication.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecom4.green.authentication.dao.AuthDAO;
import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.merchant.dto.MerchantDTO;
import com.ecom4.green.user.dto.UserDTO;
import org.springframework.stereotype.Service;

@Service
public class AuthServiceImpl implements AuthService {

	@Autowired
	AuthDAO authDao;
	
	@Override
	public int signUpUser(UserDTO userDto) throws Exception {
		return authDao.signUpUser(userDto);
	}

	@Override
	public int idCheck(String id) {
		return authDao.idCheck(id);
	}
	
	@Override
	public UserDTO getUser(UserDTO udto) {
		return authDao.getUser(udto);
	}
	
	
	@Override
    public RoleStatus checkRoleStatus(HttpSession session)
    {
      UserDTO currentUser = (UserDTO) session.getAttribute("ssKey");



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

	@Override
	public int signUpBusiness(UserDTO userDto,MerchantDTO merchantDto) {
		// TODO Auto-generated method stub
		
		userDto.setRole(RoleStatus.MERCHANT);
		merchantDto.setId(userDto.getId());
		authDao.signUpUser(userDto);	
		return authDao.signUpBusiness(merchantDto);
	}

	

	

}
