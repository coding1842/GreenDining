package com.ecom4.green.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecom4.green.authentication.service.AuthService;
import com.ecom4.green.constant.RoleStatus;
import com.ecom4.green.merchant.service.SaleService;
import com.ecom4.green.user.dto.ReviewDTO;
import com.ecom4.green.user.dto.UserDTO;
import com.ecom4.green.user.service.ReviewService;
import com.ecom4.green.user.service.UserService;

@RequestMapping("/review")
@Controller
public class ReviewController {

	@Autowired
	UserService userService;

	@Autowired
	AuthService authService;

	@Autowired
	SaleService saleService;

	@Autowired
	ReviewService reviewService;

	//리뷰 작성 페이지
	@GetMapping("/write")
	public String reviewForm(@RequestParam int sale_id, HttpServletRequest req, HttpServletResponse res, Model model) {
		HttpSession session = req.getSession();
		UserDTO custom = (UserDTO) session.getAttribute("ssKey");
		String main = "user/form/ReviewWriteForm";

		model.addAttribute("ssKey", custom);
		model.addAttribute("main", main);
		model.addAttribute("sale_id", sale_id);
		return "Index";
	}

	//리뷰 등록하기
	@ResponseBody
	@PostMapping("/insert")
	public Map<String,Object> insertReview(@RequestParam(required = false, defaultValue = "0") int image_group_id,
			HttpServletRequest req, HttpServletResponse res, Model model, ReviewDTO reviewDTO) {
		
		String url = "/item/" + req.getParameter("sale_id");
		int r = 0;

		try {
			int id = Integer.valueOf(reviewDTO.getSale_id());
			if (image_group_id != 0) {
				reviewDTO.setImage_group_id(image_group_id);
			}
			r = reviewService.insertReview(reviewDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		Map<String,Object> map = new HashMap<>();
		String msg = "";
		if(r == 1)
		{
			msg = "정상적으로 등록되었습니다.";
		}
		else
		{
			msg = "등록 실패. 잠시후에 다시 요청해주세요.";
		}
		map.put("url",url);
		map.put("msg",msg);
		
		return map;
	}

	@GetMapping("/list")
	public String reviewList(HttpServletRequest req, HttpServletResponse resp, Model model, HttpSession session, ReviewDTO reviewDTO) {
		
		String url = "";
		List<ReviewDTO> reviewDTOList = null;

		if (authService.checkRoleStatus(session) == RoleStatus.USER) {
			reviewDTOList = reviewService.selectReviewList(authService.getCurrentUser(session).getId());
			url = "redirect:/item/" + req.getParameter("sale_id");
		} else {
			url = "redirect:/auth/login";
			return url;
		}

		model.addAttribute("reviewDTOList", reviewDTOList);
		model.addAttribute("url", url);
		
		return url;
	}

	@RequestMapping("/update/form/{review_id}")
	public String updateReviewForm(@PathVariable("review_id") int review_id, HttpServletRequest req,
			HttpServletResponse res, HttpSession session, Model model) {
		
		String main = "user/form/UpdateReviewForm";
		ReviewDTO review = new ReviewDTO();
		UserDTO custom = (UserDTO) session.getAttribute("ssKey");
		review.setId(review_id);
		review.setUser_id(authService.getCurrentUser(session).getId());
		review = reviewService.selectReview(review);

		model.addAttribute("ssKey", custom);
		model.addAttribute("main", main);
		model.addAttribute("user_id",authService.getCurrentUser(session).getId());
		model.addAttribute("review", review);

		return "Index";
	}
	@ResponseBody
	@PostMapping("/update")
	public ResponseEntity<?> updateReview(@RequestParam(required = false, defaultValue = "0") int image_group_id, HttpServletRequest req, HttpServletResponse res, Model model, HttpSession session, ReviewDTO reviewDTO) {
		
		//*************************************************************
		//처음에 이미지 넣은 상태로 리뷰 등록하고 수정하기로 이미지 바꾸면 이미지가 사라짐( 데이터도 사라짐 )
		//위에 @RequestParam(required = false, defaultValue = "0") int image_group_id 이걸 넣어보고 아래 if문을 줘봤음
		
		String url = null;
		String msg = null;
        int r = 0;
        Map<String,Object> map = new HashMap<>();
        RoleStatus status = authService.checkRoleStatus(session);
 
        if(status == RoleStatus.USER) {
        	//이미지 if문으로 넣어봄
           if (image_group_id != 0) {
				reviewDTO.setImage_group_id(image_group_id);
			}
           r = reviewService.updateReview(reviewDTO);
           url = "/item/" + req.getParameter("sale_id");
           msg = "리뷰 수정 되었습니다.";
       }
        else {
        	msg = "로그인 이후 이용해주세요.";
            url = "/auth/login";
       }
       
        map.put("msg",msg);
        map.put("url",url);
        
       return new ResponseEntity<>(map,HttpStatus.OK);
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public Map<String,Object> reviewDelete(ReviewDTO reviewDTO,HttpSession session,HttpServletRequest req, HttpServletResponse res, Model model) {
		
		String url = null;
		String msg = null;
		int r = 0;
		int sale_id = 0;
		
		String user_id = authService.getCurrentUser(session).getId();
		
		if(authService.checkRoleStatus(session) == RoleStatus.USER && user_id.equals(reviewDTO.getUser_id()))
		{
			sale_id = reviewService.selectReview(reviewDTO).getSale_id();
			r = reviewService.deleteReview(reviewDTO);
			msg = "정상적으로 삭제되었습니다.";
		}
		else if(authService.checkRoleStatus(session) == RoleStatus.NOT_LOGGED_IN)
		{
			msg = "로그인 이후 요청 바랍니다.";
		}
		
		url = "/item/" + sale_id;
		
		Map<String,Object> map = new HashMap<>();
		map.put("url",url);
		map.put("msg", msg);
		
		return map;
	}
}

