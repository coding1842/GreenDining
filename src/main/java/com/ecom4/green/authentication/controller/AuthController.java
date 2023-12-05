package com.ecom4.green.authentication.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom4.green.encryption.service.EncryptionService;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.logging.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.authentication.service.AuthServiceImpl;
import com.ecom4.green.authentication.wrapper.RegistrationForm;
import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.merchant.dao.MerchantDAO;
import com.ecom4.green.merchant.dto.MerchantDTO;
import com.ecom4.green.user.dto.UserDTO;


@Controller
@RequestMapping("/auth")
public class AuthController
{
        private static final org.slf4j.Logger logger = LoggerFactory.getLogger(AuthController.class);

        private static final String pepper = "qc822";

        @Autowired
        AuthService authService;

        @Autowired
        EncryptionService encryptionService;

        /*로그인페이지*/
        @GetMapping("/login")
        public String loginView(HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model)
        {

	      String main = "";
	      String url = null;
	      String msg = "";


	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {
		    url = "redirect:/user/my-page";
		    return url;

	      }
	      else if (authService.checkRoleStatus(session) == RoleStatus.MERCHANT)
	      {
		    url = "redirect:/merchant/my-page";
		    return url;

	      }
	      else if (authService.checkRoleStatus(session) == RoleStatus.NOT_LOGGED_IN)
	      {
		    main = "auth/view/Login";
	      }


	      model.addAttribute("main", main);
	      return "Index";
        }

        /*일반or사업자 회원가입*/
        @RequestMapping("/sign-up")
        public String signUpView(HttpServletRequest req, HttpServletResponse resp, Model model)
        {

	      String main = null;
	      String url = null;
	      main = "auth/view/Registration";

	      model.addAttribute("main", main);
	      return "Index";
        }

        /*일반 회원가입*/
        @GetMapping("/sign-up/user")
        public String signUpUserForm(HttpServletRequest req, HttpServletResponse resp, Model model, UserDTO userDto)
        {
	      String main = null;

	      main = "auth/form/user/SignUp";

	      model.addAttribute("main", main);
	      return "Index";
        }

        /*일반 회원가입 기입된 정보 보낼때*/
        @PostMapping("/sign-up/user")
        public String signUpUser(UserDTO userDto, HttpServletRequest req, HttpServletResponse resp, Model model)
        {
	      String main = null;
	      String url = null;
	      logger.warn(userDto.toString());
	      url = "redirect:/auth/login";


	      try
	      {
		    userDto.setRole(RoleStatus.USER);
		    userDto.setSalt(RandomStringUtils.randomAlphabetic(10));
		    String encryptionPassword = encryptionService.getSHA256Hash(userDto.getPassword() + userDto.getSalt() + pepper);
		    userDto.setPassword(encryptionPassword);

		    int r = authService.signUpUser(userDto);
	      }
	      catch (Exception e)
	      {
		    e.printStackTrace();
	      }

	      return url;
        }

        @RequestMapping("/id-check")
        @ResponseBody
        public int idCheck(HttpServletRequest request, HttpServletResponse response, Model model, UserDTO userDto)
        {
	      int cnt = 0;
	      if (userDto.getId() != null)
	      {
		    cnt = authService.idCheck(userDto.getId());
	      }
	      return cnt;
        }

        @RequestMapping("/phone-check")
        @ResponseBody
        public int phoneCheck(HttpServletRequest req, HttpServletResponse resp, Model model, UserDTO userDto)
        {
	      int cnt = 0;
	      if (userDto.getPhone() != null)
	      {
		    cnt = authService.phoneCheck(userDto.getPhone());
	      }
	      return cnt;
        }


        @GetMapping("/sign-up/business")
        public String signUpBusinessForm(HttpServletRequest req, HttpServletResponse resp, Model model)
        {
	      String main = null;

	      main = "auth/form/business/SignUp";

	      model.addAttribute("main", main);

	      return "Index";
        }


        @PostMapping("/sign-up/business")
        public String signUpBusiness(HttpServletRequest req, HttpServletResponse resp, Model model, @ModelAttribute RegistrationForm form)
        {
	      String url = null;
	      String msg;

	      int r = 0;

	      try
	      {
		    UserDTO userDTO = form.getUserDTO();
		    MerchantDTO merchantDTO = form.getMerchantDTO();

		    r = authService.signUpBusiness(userDTO, merchantDTO);

	      }
	      catch (Exception e)
	      {
		    e.printStackTrace();
	      }

	      if (r > 0)
	      {
		    url = "/auth/login";
		    msg = "사업자 회원가입 성공";
	      }
	      else
	      {
		    msg = "사업자 회원가입 실패 다시 시도해주세요";
		    url = "/auth/sign-up/business";
	      }

	      model.addAttribute("msg", msg);
	      model.addAttribute("url", url);

	      return "MsgPage";
        }

        @PostMapping("/loginProc")
        public String loginProc(HttpSession session, HttpServletRequest request, HttpServletResponse response, UserDTO userDto, Model model)
        {

	      try
	      {
		    String salt = authService.selectSalt(userDto);
		    String encyptionPassword = encryptionService.getSHA256Hash(userDto.getPassword() + salt + pepper);
		    userDto.setPassword(encyptionPassword);
	      }
	      catch (Exception e)
	      {
		    e.printStackTrace();
	      }
	      UserDTO udto = authService.getUser(userDto);
	      String url = "redirect:/";
	      String msg;


	      if (udto == null)
	      {
		    msg = "아이디 또는 패스워드가 맞지 않습니다.";
	      }
	      else
	      {
		    UserDTO ssKey = new UserDTO();
		    ssKey.setId(udto.getId());
		    ssKey.setPassword(udto.getPassword());
		    ssKey.setName(udto.getName());
		    ssKey.setRole(udto.getRole());
		    msg = udto.getName() + "님 반갑습니다!!";
		    model.addAttribute("msg", msg);
		    model.addAttribute("url", url);
		    session.setAttribute("ssKey", ssKey);
	      }

	      return url;
        }

        @RequestMapping("/logoutProc")
        public String logoutProc(HttpServletRequest request, HttpServletResponse response, UserDTO userdto, Model model)
        {

	      String url = "redirect:/";

	      HttpSession session = request.getSession();
	      session.invalidate();
	      return url;
        }


}
