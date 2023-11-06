<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/IdPwSearch.css" />
<link rel="stylesheet" href="/css/User.css" />
<div id="searchPwdBox">
<h1 id="title">비밀번호 찾기</h1>

	<div id="searchIDBorder">
	<p id="smallIDSearch">휴대폰으로 비밀번호 찾기</p>
		<input class="text_in" type="text" name="아이디" placeholder="아이디를 입력하세요"><br>
		<input class="text_in" type="text" name="이름" placeholder="이름을 입력하세요"><br>
		<div id="pNumBorder">
			<input id="pNumberSend" type="text" name="휴대폰 번호" placeholder="휴대번호를 입력하세요(숫자만 입력)" 
			oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
			<button id="sendBtn">전송</button>	
		</div>
		<div id="pNumBorder">
			<input id="pNumberSend" type="text" name="인증 번호" placeholder="인증번호를 입력하세요" 
			oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
			<button id="sendBtn">확인</button>	
		</div>
	</div>	
		<button class="IDsearch" onclick="">비밀번호 찾기</button>
		<p id="searchEmail"><a href="/user/login/fing-password/by-email-address">이메일 주소로 찾기</a></p>
</div>

