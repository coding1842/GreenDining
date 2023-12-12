package com.ecom4.green.user.controller;

import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.user.dto.AddressDTO;
import com.ecom4.green.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/address")
public class AddressController
{
        @Autowired
        UserService userService;

        @Autowired
        AuthService authService;

        //여기는 배송관련 테스트 폼-------------------------------------
        @RequestMapping("/form")
        public String addressForm(HttpServletRequest request,
			    HttpServletResponse response,
			    Model model)
        {

	      String main = "user/form/AddressForm";

	      model.addAttribute("main", main);

	      return "Index";
        }

        @PostMapping("/insert")
        public String insertAddress(HttpServletRequest request,
			      HttpServletResponse response,
			      Model model,
			      AddressDTO addressDTO)
        {
	      String url = "redirect:/user/address/list";

	      try
	      {
		    userService.insertAddress(addressDTO);
	      }
	      catch (Exception e)
	      {
		    e.printStackTrace();
	      }

	      return url;
        }

        @GetMapping("/list")
        public String AddressList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session)
        {
	      String main = "user/view/AddressList";
	      String url = "";
	      List<AddressDTO> addressDTOList = null;

	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {
		    addressDTOList = userService.selectAddressList(authService.getCurrentUser(session).getId());
	      }
	      else
	      {
		    url = "redirect:/auth/login";
		    return url;
	      }

	      model.addAttribute("addressDTOList", addressDTOList);
	      model.addAttribute("main", main);
	      return "Index";
        }

//	@PostMapping("/updateAddress")
//	public String updateAddress( AddressDTO addressDTO){
//
//		AddressDTO updateAddress = userService.updateAddress(addressDTO);
//
//		return "success";
//	}

        @PostMapping("/update")
        public ResponseEntity<String> updateAddress(AddressDTO addressDTO)
        {
	      int r = userService.updateAddress(addressDTO);

	      if (r < 1)
	      {
		    return new ResponseEntity<>("배송 정보 수정 실패. 다시 수정 해주십시오", HttpStatus.BAD_REQUEST);
	      }
	      return new ResponseEntity<>("정상적으로 배송 정보 수정 되었습니다.", HttpStatus.OK);
        }

        @PostMapping("/delete")
        public ResponseEntity<String> deleteAddress(HttpServletRequest req, HttpServletResponse res, AddressDTO addressDTO)
        {
	      int r = userService.deleteAddress(addressDTO);

	      if (r < 1)
	      {
		    return new ResponseEntity<>("배송 정보 삭제 실패. 다시 수정 해주십시오", HttpStatus.BAD_REQUEST);
	      }
	      return new ResponseEntity<>("정상적으로 배송 정보 삭제 되었습니다.", HttpStatus.OK);
        }

        //        주문 페이지에서 배송지 변경,삭제,추가 팝업
        @GetMapping("/popup/form")
        public String addressPopupForm(Model model)
        {
	      String main = "user/popup/AddressPopupInsertForm";

	      return main;
        }

        @GetMapping("/popup/list")
        public String addressPopupList(Model model, HttpSession session)
        {
	      String main = "user/popup/AddressPopupList";
	      String url = "";
	      List<AddressDTO> addressDTOList = null;

	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {
		    addressDTOList = userService.selectAddressList(authService.getCurrentUser(session).getId());
	      }
	      else
	      {
		    url = "redirect:/auth/login";
		    return url;
	      }

	      model.addAttribute("addressDTOList", addressDTOList);

	      return main;
        }

        @GetMapping("/popup/update/{address_id}")
        public String addressUpdateForm(@PathVariable("address_id") int address_id, Model model, HttpSession session)
        {
	      Map<String, Object> map = new HashMap<>();
	      map.put("address_id", address_id);
	      map.put("user_id", authService.getCurrentUser(session).getId());
	      String main = "user/popup/AddressPopupUpdateForm";
	      String url = "";
	      AddressDTO addressDTO = new AddressDTO();

	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {
		    addressDTO = userService.selectAddress(map);
	      }
	      else
	      {
		    url = "redirect:/auth/login";
		    return url;
	      }

	      model.addAttribute("address", addressDTO);
	      return main;
        }

        @PostMapping("/popup/insert")
        public String insertAddressPopup(Model model, HttpSession session, AddressDTO addressDTO)
        {
	      String url = "redirect:/address/popup/list";

	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {
		    userService.insertAddress(addressDTO);
	      }
	      else
	      {
		    url = "redirect:/auth/login";
		    return url;
	      }

	      return url;
        }

        @PostMapping("/popup/update")
        public String updateAddressPopup(Model model, HttpSession session, AddressDTO addressDTO)
        {
	      String url = "redirect:/address/popup/list";

	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {
		    userService.updateAddress(addressDTO);
	      }
	      else
	      {
		    url = "redirect:/auth/login";
		    return url;
	      }

	      return url;
        }

        @PostMapping("/popup/delete")
        public String deleteAddress(Model model, HttpSession session, AddressDTO addressDTO)
        {
	      String url = "redirect:/address/popup/list";

	      if (authService.checkRoleStatus(session) == RoleStatus.USER)
	      {
		    userService.deleteAddress(addressDTO);
	      }
	      else
	      {
		    url = "redirect:/auth/login";
		    return url;
	      }

	      return url;
        }
}
