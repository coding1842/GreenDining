<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="" isErrorPage="false" import="java.util.Date" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원정보 수정</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous" />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"></script>

  </head>
  <body>
    <h3>회원정보 수정</h3>
   
      <table class="table">
        <tbody>
          <tr>
            <th>아이디</th>
            <td>
              <span>${user.id}</span>
              <button class="ms-5 btn btn-light border-1 border-black h-30px" id="id_change" type="button">아이디 변경</button>
              <form action="/auth/id-change" id="id-change-form" class="mt-3 visually-hidden">
                <input type="text" name="id" id="idCheck" value="${user.id}">
                <button type="button" class="btn btn-light border-1 border-black h-30px" id="id-change-submit">아이디 변경</button>
                <div id="id_text" class="text-start ms-2 me-2 h-25 text-danger fs-12px mt-2">
                  <span class="material-symbols-outlined float-start"> close </span>
                  <div class="float-start align-middle" style="line-height: 27px">띄어쓰기 없이 영/숫자 6~15자</div>
                </div>
                <font id="warning" size="2" color="red"></font>
              </form>
            </td>
          </tr>
          <tr>
            <th>이메일</th>
            <td>
              <span>${user.email}</span>
              <input type="hidden" name="" id="hidden_email" value="${user.email}">
              <button class="ms-5 btn btn-light border-1 border-black h-30px" id="email_change" type="button">이메일 변경</button>
              <form action="/auth/email-change" class="visually-hidden mt-3">
                <input type="text" name="email" id="email_chk" value="${user.email}">
                <button type="button" class="btn btn-light border-1 border-black h-30px" id="email-change-submit">이메일 변경</button>
                <div id="email_text" class="text-start ms-2 h-25 text-danger fs-12px mt-2">
                  <span class="material-symbols-outlined float-start"> close </span>
                  <div class="float-start align-middle" style="line-height: 27px">이메일을 입력하세요.</div>
                </div>
              </form>
            </td>
          </tr>
          <tr>
            <th>이름</th>
            <td>
              <span class="fw-bold">${user.name}</span>
              <button class="ms-5 btn btn-light border-1 border-black h-30px" id="name_change" type="button">개명하셨다면? 이름 변경</button>
              <form action="/auth/name-change" class="mt-3 visually-hidden">
                <input id="name_check" title="이름" type="text" name="name" value="${user.name}" />
                <button type="button" class="btn btn-light border-1 border-black h-30px" id="name-change-submit">이름 변경</button>
                <div id="name_text" class="text-start ms-2 h-25 text-danger fs-12px mt-2">
                  <span class="material-symbols-outlined float-start"> close </span>
                  <div class="float-start align-middle" style="line-height: 27px">이름을 정확히 입력해주세요.(2글자 이상)</div>
                </div>
              </form>
            </td>
          </tr>
          <tr>
            <th>휴대폰 번호</th>
            <td>
              <span>${user.phone}</span>
              <button class="ms-5 btn btn-light border-1 border-black h-30px" id="phone_change" type="button">휴대폰 변경</button>
              <form action="/auth/phone-change" class="mt-3 visually-hidden">
                <input id="phone_check" title="이름" type="text" name="phone" value="${user.phone}" />
                <button type="button" class="btn btn-light border-1 border-black h-30px" id="name-change-submit">이름 변경</button>
                <div id="phone_text" class="text-start ms-2 h-25 text-danger fs-12px mt-2">
                  <span class="material-symbols-outlined float-start"> close </span>
                  <div class="float-start align-middle" style="line-height: 27px">휴대폰 번호을 정확히 입력해주세요.(-없이)</div>
                </div>
                <font id="phone_font" size="2" color="red"></font>
              </form>
            </td>
          </tr>
          <tr>
            <th>비밀번호</th>
            <td>
              <form action="">
                <span class="d-inline-block w-150px">현재 비밀번호</span>
                <!--  -->
                <input type="password" name="old_password" id="" />
                <br>
                <br>
                <span class="d-inline-block w-150px">새 비밀번호</span>
                <!--  -->
                <input type="password" name="password" id="new_password" />
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
                <span class="d-inline-block w-150px">비밀번호 다시 입력</span>
                <!--  -->
                <input type="password" name="re_password" id="re_password">
                <div id="password_text_04" class="text-start ms-2 h-25 text-danger fs-12px mt-2">
                  <span class="material-symbols-outlined float-start"> close </span>
                  <div class="align-middle" style="line-height: 27px">확인을 위해 새 비밀번호를 다시 입력해주세요.</div>
                </div>
                
                <span class="d-inline-block w-150px"></span>
                <button type="submit" class="btn btn-light border-1 border-black h-30px mb-2 mt-3">비밀번호 변경</button>
              </form>
            </td>
          </tr>
          <tr>
            <th>배송지</th>
            <td>
              <p>배송지 주소 관리는 <span class="fw-bold text-primary">[배송지 관리]</span>에서 수정, 등록 합니다.</p>
            </td>
          </tr>
          
        </tbody>
      </table>
      <div class="float-end">
        <form class="float-end ms-2" action="/auth/delete-user">
          <button type="button" id="delete_user" class="btn btn-secondary w-80px h-30px fs-12px">회원탈퇴</button>          
        </form>
        <span class="float-end h-30px" style="line-height: 30px;">탈퇴를 원하시면 우측의 회원탈퇴 버튼을 눌러주세요.</span>
      </div>
      <br>
      <div class="d-flex justify-content-center">
        <a href="/user/my-page"><button type="button" id="modify-check" class="btn btn-warning w-70px h-30px fs-12px">나가기</button></a>
      </div>
    </form>
  </body>
</html>
