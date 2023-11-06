<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<div id="general_box">
<h1 class="general_title">사업자회원 가입</h1>

	<div id="general">
		<input class="text_in" type="text" name="상호명" placeholder="상호명"><br>
		<input class="text_in" type="text" name="대표자명" placeholder="대표자명"><br>
		<input class="text_in" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="사업자 번호" placeholder="사업자등록 번호( _없이 10자리 )"><br>
		<input class="text_in" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="휴대폰 번호" placeholder="휴대폰 번호( -없이 9자리 )"><br>
		<input class="text_in" type="text" name="이메일" placeholder="이메일"><br>		
		<input class="text_in" type="password" name="비밀번호" placeholder="6자리 이상 비밀번호"><br>
		<input class="text_in" type="password" name="비밀번호 확인" placeholder="비밀번호 확인"><br>
	</div>
	<div id="ch">
		<input type="checkbox">전체 동의<br>
		<input type="checkbox"><span>사이트 이용약관 동의(필수) </span><a href="">보기</a><br>
		<input type="checkbox"><span>개인정보 수집 및 이용 동의(필수) </span><a href="">보기</a><br>
	</div>
		<button class="chb" onclick="">가입하기</button>
</div>

