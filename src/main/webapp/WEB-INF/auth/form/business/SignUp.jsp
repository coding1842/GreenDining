<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
	<link rel="stylesheet" href="/css/auth/SignUp.css" />
	<script src="/jquery/jquery-3.7.0.min.js"></script>
	<script src="/js/auth/Sign_Up.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	
</head>
<div id="general_box">
  <h1 class="general_title">사업자회원 가입</h1>

<form action="/auth/sign-up/business" method="post">
	<div id="general">
	    
	    <input class="text_in chk" id="idchk"  title="아이디" type="text" name="userDTO.id" placeholder="아이디" /><br />
	     <font id="warning" size="2" color="red"></font>
	     <br>
     	<input class="text_in chk" id="check1" title="비밀번호" type="password" name="userDTO.password" placeholder="비밀번호" /><br />
	    <input class="text_in" id="check2" type="password" placeholder="비밀번호 확인" /><br />
	    <font id="check" size="2" color="green"></font>
	    <br>
	    <input class="text_in chk" title="이름" type="text" name="userDTO.name" placeholder="이름" /><br />
	    <input class="text_in chk" title="이메일" type="text" name="userDTO.email" id="user_email" placeholder="이메일" /><br />
	    <input
	      class="text_in"
	      type="text"
	      oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
	      name="userDTO.phone"
	      placeholder="휴대폰 번호( -없이 9자리 )" /><br />
	 </div>
	   

	  <div id="general">
	    <input class="text_in" type="text" name="merchantDTO.business_name" placeholder="상호명" /><br />
	    <input
	      class="text_in"
	      type="text"
	      oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
	      name="merchantDTO.business_number"
	      placeholder="사업자등록 번호( _없이 10자리 )" /><br />
	   </div>
	  <div id="ch">
	    <input type="checkbox" />전체 동의<br />
	    <input type="checkbox" /><span>사이트 이용약관 동의(필수) </span><a href="">보기</a><br />
	    <input type="checkbox" /><span>개인정보 수집 및 이용 동의(필수) </span><a href="">보기</a><br />
	  </div>
	  <button type="submit" id="submit11" class="chb">가입하기</button>
</form>



</div>
<div class="clearfix"></div>
