<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/IdPwSearch.css" />
<link rel="stylesheet" href="/css/User.css" />
<div id="searchIDBox">
  <h1 id="title">아이디 찾기</h1>

  <div id="searchIDBorder">
    <p id="smallIDSearch">휴대폰으로 아이디 찾기</p>
    <input class="text_in" type="text" name="이름" placeholder="이름을 입력하세요" /><br />
    <input
      class="text_in"
      type="text"
      name="휴대폰 번호"
      placeholder="휴대번호를 입력하세요(숫자만 입력)"
      oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /><br />
  </div>
  <button class="IDsearch" onclick="">아이디 찾기</button>
  <p id="searchEmail"><a href="/auth/find-id/email">이메일 주소로 찾기</a></p>
</div>
