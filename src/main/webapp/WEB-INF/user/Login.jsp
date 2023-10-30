<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
		<h1 id="title">로그인/회원가입</h1>
		<div class="login_Box">
			<div id="kakao">
				<a href=""><img alt="카카오" src="../image/kakao_login_medium_wide.png"></a>
			</div>
			<div id="ngf">
				<a href=""><img alt="naver" src="../image/naver_icon2.png" width="40px" height="40px"></a>
				<a href=""><img alt="naver" src="../image/google_logo_2_littledeep.png" width="40px" height="40px"></a>
				<a href=""><img alt="naver" src="../image/facebook2-icon-file.png" width="40px" height="40px"></a>
			</div>
			<div id="login_inp">
				<input type="text" title="아이디" placeholder="아이디">
				<input type="password" title="비밀번호" placeholder="비밀번호">
			</div>
			<div id="check">
				<input type="checkbox">로그인 상태 유지
			</div>
			<div id="login_btn">
				<button class="log_but" onclick="">로그인</button>
			</div>
			<div>
				<p><a href="">아이디/비밀번호 찾기</a>&nbsp;	<a href="/user/sign-up">회원가입</a></p>
				
			</div>
		</div>