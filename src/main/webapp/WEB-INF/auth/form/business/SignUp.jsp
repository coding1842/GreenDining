<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/auth/Login.css" />
<link rel="stylesheet" href="/css/auth/SignUp.css" />
<script src="/jquery/jquery-3.7.0.min.js"></script>
<script src="/js/auth/Sign_Up.js"></script>
<style>
  input[type="number"]::-webkit-outer-spin-button,
  input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
  }
</style>
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
  crossorigin="anonymous" />
<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
  crossorigin="anonymous"></script>
<form action="/auth/sign-up/user" name="form1" method="post" class="h-1300px">
  <div id="general_box">
    <h1 class="general_title">일반회원 가입</h1>
    <div id="general">
      <h6>회원정보를 입력해주세요</h6>
      <input class="text_in chk" id="idchk" title="아이디" type="text" name="userDTO.id" placeholder=" 아이디" /><br />
      <div id="id_text" class="text-start ms-2 h-25 text-danger fs-12px mt-2">
        <span class="material-symbols-outlined float-start"> close </span>
        <div class="float-start align-middle" style="line-height: 27px">띄어쓰기 없이 영/숫자 6~15자</div>
      </div>
      <font id="warning" size="2" color="red"></font>
      <input class="text_in chk" title="이메일" type="text" name="userDTO.email" id="user_email" placeholder=" 이메일" /><br />
      <div id="email_text" class="text-start ms-2 h-25 text-danger fs-12px mt-2">
        <span class="material-symbols-outlined float-start"> close </span>
        <div class="float-start align-middle" style="line-height: 27px">이메일을 입력하세요.</div>
      </div>
      <input class="text_in chk" id="check1" title="비밀번호" type="password" name="userDTO.password" placeholder=" 비밀번호" /><br />
      <div id="password_check" class="fs-12px text-secondary mt-2 h-100px">
        <div id="password_text_01" class="text-start ms-2 h-25 text-danger">
          <span class="material-symbols-outlined float-start"> close </span>
          <div class="float-start align-middle" style="line-height: 27px">영문/숫자/특수문자 2가지 이상 조합 (8~20자)</div>
        </div>
        <div class="clearfix"></div>
        <div id="password_text_02" class="text-start ms-2 h-25 text-danger">
          <span class="material-symbols-outlined float-start"> close </span>
          <div class="float-start align-middle" style="line-height: 27px">3개 이상 연속되거나 동일한 문자/숫자 제외</div>
        </div>
        <div class="clearfix"></div>
        <div id="password_text_03" class="text-start ms-2 h-25 text-danger">
          <span class="material-symbols-outlined float-start"> close </span>
          <div class="float-start align-middle" style="line-height: 27px">아이디(이메일) 제외</div>
        </div>
      </div>
      <input class="text_in" id="check2" type="password" placeholder=" 비밀번호 확인" /><br />
      <div id="password_text_04" class="text-start ms-2 h-25 text-danger fs-12px mt-2">
        <span class="material-symbols-outlined float-start"> close </span>
        <div class="float-start align-middle" style="line-height: 27px">확인을 위해 새 비밀번호를 다시 입력해주세요.</div>
      </div>
      <br />
      <input id="name_check" class="text_in chk" title="이름" type="text" name="userDTO.name" placeholder=" 이름" /><br />
      <div id="name_text" class="text-start ms-2 h-25 text-danger fs-12px mt-2">
        <span class="material-symbols-outlined float-start"> close </span>
        <div class="float-start align-middle" style="line-height: 27px">이름을 정확히 입력해주세요.(2글자 이상)</div>
      </div>
      <input
        id="phone_check"
        maxlength=""
        class="text_in chk"
        oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
        title="휴대폰"
        type="text"
        name="userDTO.phone"
        placeholder=" 휴대폰 번호 (11자리)" /><br />
      <div id="phone_text" class="text-start ms-2 h-25 text-danger fs-12px mt-2">
        <span class="material-symbols-outlined float-start"> close </span>
        <div class="float-start align-middle" style="line-height: 27px">휴대폰 번호을 정확히 입력해주세요.(-없이)</div>
      </div>
      <font id="phone_font" size="2" color="red"></font>
      <input id="business_name_check" class="text_in" type="text" name="merchantDTO.business_name" placeholder=" 상호명" /><br />
      <div id="business_name_text" class="text-start ms-2 h-25 text-danger fs-12px mt-2">
        <span class="material-symbols-outlined float-start"> close </span>
        <div class="float-start align-middle" style="line-height: 27px">상호명을 정확히 입력해주세요.(2글자 이상)</div>
      </div>
      <input
        id="business_number_check"
        class="text_in"
        style="appearance: none"
        type="text"
        maxlength="10"
        oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
        name="merchantDTO.business_number"
        placeholder=" 사업자등록 번호( -없이 10자리 )" /><br />
      <div id="business_number_text" class="text-start ms-2 h-25 text-danger fs-12px mt-2">
        <span class="material-symbols-outlined float-start"> close </span>
        <div class="float-start align-middle" style="line-height: 27px">사업자 번호을 정확히 입력해주세요.(- 없이 10자리)</div>
      </div>
    </div>

    <div id="ch" class="checkbox_group">
      <input type="checkbox" id="check_all" />전체 동의<br />
      <input type="checkbox" /><span>사이트 이용약관 동의(필수) </span><a href="">보기</a><br />
      <input type="checkbox" /><span>개인정보 수집 및 이용 동의(필수) </span><a href="">보기</a><br />
    </div>
    <button id="submit11" class="chb mb-5" type="button">가입하기</button>
  </div>
</form>
