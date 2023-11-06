<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/FingID.css" />
<script src="https://kit.fontawesome.com/dd4730185a.js" crossorigin="anonymous"></script>    
<body>
<div style="text-align: center;">
<h6 class="mt-5 mb-3">회원유형</h6>
<div class="btn-group w-400px" role="group" aria-label="Basic radio toggle button group">
  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
  <label class="btn btn-outline-primary" for="btnradio1">개인</label>
  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
  <label class="btn btn-outline-primary" for="btnradio2">사업자</label>
</div>
<div class="fingForm" id="user_find">
<h1 id="title">비밀번호 찾기</h1>
	<p id="middleTit">비밀번호를 잊으셨나요?</p>
	<p id="pickHow">원하시는 방법을 선택해주세요</p>
	
	<button class="fingBtn" onclick="location.href='/user/login/fing-password/by-phone-number'">
	<i class="fa-solid fa-mobile-screen-button" style="color: #182E15;"></i>
	휴대폰 번호로 찾기
	<div class="fBtnI"><i class="fa-solid fa-chevron-right" style="color: #182e15;"></i></div>
	</button>
	
	<button class="fingBtn" onclick="location.href='/user/login/fing-password/by-email-address'">
	<i class="fa-regular fa-envelope" style="color: #182e15;"></i>
	이메일 주소로 찾기
	<div class="fBtnI"><i class="fa-solid fa-chevron-right" style="color: #182e15;"></i></div>
	</button>
	
	<p id="smallTit">아이디를 잊으셨나요?</p>
	<p id="searchA"><a href="/user/login/fing-id">아이디 찾기</a></p>
	<div id="backCol">
		<p>- 간편가입 회원은 아이디 입력란에 이메일 주소를 입력하세요</p>
		<p>- 아이디/비밀번호를 찾으실 수 없다면 아래 메일주소로 이름, 연락처, 생년 앞 &nbsp;&nbsp;2자리를 보내주세요</p>
		<p>&nbsp; 예)홍길동, 010-1234-5678, 23(년생)</p>
		<p>&nbsp; 메일주소: asdf@asdf.com</p>
		<p>&nbsp; 고객센터: 010-0123-0123</p>
	</div>
</div>
<div class="fingForm" id="business_find" style="display: none;">
<h1 id="title">사업자 비밀번호 찾기</h1>
	<p id="middleTit">비밀번호를 잊으셨나요?</p>
	<p id="pickHow">원하시는 방법을 선택해주세요</p>
	
	<button class="fingBtn" onclick="location.href='/merchant/login/fing-password/by-business-number-pw'">
	<i class="fa-solid fa-mobile-screen-button" style="color: #182E15;"></i>
	사업자등록 번호로 찾기
	<div class="fBtnI"><i class="fa-solid fa-chevron-right" style="color: #182e15;"></i></div>
	</button>
	
<!-- 	<button class="fingBtn" onclick="location.href='/user/login/fing-password/by-email-address'"> -->
<!-- 	<i class="fa-regular fa-envelope" style="color: #182e15;"></i> -->
<!-- 	이메일 주소로 찾기 -->
<!-- 	<div class="fBtnI"><i class="fa-solid fa-chevron-right" style="color: #182e15;"></i></div> -->
<!-- 	</button> -->
	
	<p id="smallTit">아이디를 잊으셨나요?</p>
	<p id="searchA"><a href="/user/login/fing-id">아이디 찾기</a></p>
	<div id="backCol">
		<p>- 간편가입 회원은 아이디 입력란에 이메일 주소를 입력하세요</p>
		<p>- 아이디/비밀번호를 찾으실 수 없다면 아래 메일주소로 이름, 연락처, 생년 앞 &nbsp;&nbsp;2자리를 보내주세요</p>
		<p>&nbsp; 예)홍길동, 010-1234-5678, 23(년생)</p>
		<p>&nbsp; 메일주소: asdf@asdf.com</p>
		<p>&nbsp; 고객센터: 010-0123-0123</p>
	</div>
</div>
</div>
</body>