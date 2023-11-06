<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="" isErrorPage="false" import="java.util.Date" %> <%--
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib
prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> --%>

<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Header</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous" />
  </head>
  <body>
    <section id="coupon_banner">
      <a href="/login/memberJoin">
        <div class="text-center h-30px" id="coupon_contents">
          <p>지금 회원가입 하면 즉시 <b>1만원 쿠폰팩 지급</b></p>
        </div>
      </a>
    </section>
    <section id="header_popup" class="mt-2 border-bottom border-2 mb-3 border-danger border-opacity-50">
      <nav id="logo_and_icons" class="position-relative h-60px">
        <div id="logo" class="position-absolute start-0 w-300px">
          <a href="/index">
            <div id="logo_container" class=""><span class="logo">Green</span><span class="logo logo-accent">ing</span></div>
          </a>
        </div>
        <div id="search" class="position-absolute start-50 border h-40px w-600px translate-middle-x rounded-3 border-1 border-black">
          <input
            type="text"
            placeholder="검색어를 입력하세요"
            class="w-290px h-38px ms-3 border-0 position-absolute start-0 top-50 translate-middle-y" />
          <i class="fa-solid fa-magnifying-glass position-absolute end-0 top-50 translate-middle"></i>
        </div>
        <div id="icons" class="fs-5 position-absolute end-0 w-300px d-flex align-items-end flex-row-reverse">
          <a href="/user/myPage">
            <div class="d-flex align-items-center h-30px">
              <i class="fa-solid fa-user" style="color: #70bee6"></i>
              <span class="ms-2 text-nowrap">마이페이지</span>
            </div>
          </a>
          <a href="/user/login">
            <div class="d-flex align-items-center h-30px">
              <i class="fa-solid fa-user" style="color: #67c73d"></i>
              <span class="ms-2 text-nowrap">로그인</span>
            </div>
          </a>
        </div>
      </nav>
      <nav id="top_menu" class="fs-6">
        <a href="/np/best">
          <div id="style_store"><span>산지제철</span></div>
        </a>
        <a href="/store">
          <div id="style_store"><span>지역명물</span></div>
        </a>

        <div class="lh-30px h-40px">|</div>
        <a href="/recipe">
          <div id="style_recipe"><span>레시피</span></div>
        </a>
        <a href="/chikenGuide" class="me-0">
          <div id="style_chikenGuide"><span>키친가이드</span></div>
        </a>
        <a href="/curation">
          <div id="style_curation"><span>큐레이션</span></div>
        </a>
        <a href="/event">
          <div id="style_event"><span>이벤트/소식</span></div>
        </a>
      </nav>
    </section>
  </body>
</html>
