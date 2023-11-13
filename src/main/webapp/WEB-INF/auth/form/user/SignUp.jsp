<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/auth/Login.css" />
<link rel="stylesheet" href="/css/auth/SignUp.css" />
<script src="/jquery/jquery-3.7.0.min.js"></script>
<script src="/js/auth/Sign_Up.js"></script>
 
<form action="/auth/sign-up/user" name="form1" method="post">
	<div id="general_box">
	  <h1 class="general_title">일반회원 가입</h1>
	  <div id="general">
	    <input class="text_in chk" title="이름" type="text" name="name" placeholder="이름" /><br />
	    <input class="text_in chk" id="idchk"  title="아이디" type="text" name="id" placeholder="아이디" /><br /><br><br>
	    <font id="warning" size="2" color="red"></font>
	    <input class="text_in chk" title="이메일" type="text" name="email" id="user_email" placeholder="이메일" /><br />
	    <input class="text_in chk" id="check1" title="비밀번호" type="password" name="password" placeholder="비밀번호" /><br />
	    <input class="text_in" id="check2" type="password" placeholder="비밀번호 확인" /><br />
	    <font id="check" size="2" color="green"></font>
	  </div>
	  <div id="ch">
	    <input type="checkbox" />전체 동의<br />
	    <input type="checkbox" /><span>사이트 이용약관 동의(필수) </span><a href="">보기</a><br />
	    <input type="checkbox" /><span>개인정보 수집 및 이용 동의(필수) </span><a href="">보기</a><br />
	  </div>
	  <button id="submit11" class="chb" onclick="#">가입하기</button>
	</div>
</form>
