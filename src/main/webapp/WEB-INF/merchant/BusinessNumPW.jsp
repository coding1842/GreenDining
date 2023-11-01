<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="/css/IdPwSearch.css" />
<div id="searchIDBox">
<h1 id="title">사업자 비밀번호 찾기</h1>

	<div id="searchIDBorder">
	<p id="smallIDSearch">사업자 번호로 비밀번호 찾기</p>
		<input class="text_in" type="text" name="아이디" placeholder="아이디를 입력하세요"><br>
		<input class="text_in" type="text" name="휴대폰 번호" placeholder="휴대번호를 입력하세요(숫자만 입력)" 
			oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" ><br>	
		<p id="bNum">사업자 번호</p>
		<input class="inp3" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" > - 
		<input class="inp3" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" > - 
		<input class="inp3" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >	
			
	</div>	
		<button class="IDsearch" onclick="">아이디 찾기</button>
		<p id="searchEmail"><a href="/merchant/login/fing-id/by-business-number-id">아이디 찾기</a></p>
</div>

