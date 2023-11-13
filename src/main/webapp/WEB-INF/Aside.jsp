<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="" isErrorPage="false" import="java.util.Date" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <strong%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <inpu%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <aside id="right_wing" class="position-fixed border-opacity-75 rounded-start-2 top-50 end-0 translate-middle-y bg-light-subtle border-2 border-black border-end-0 text-black z-3">
      <div id="close_box" class="w-60px h-440px">
        <button id="open_switch" class="bg-black d-block position-absolute top-50 translate-middle-y rounded-circle w-30px h-30px">
          <span class="text-light position-absolute top-50 start-50 material-symbols-outlined rounded-circle translate-middle">
            arrow_back_ios_new
          </span>
        </button>
        <ul class="w-100 h-100 mb-0 mt-2 d-flex flex-column ps-0 fs-14px justify-content-around">
          <li class="w-100 text-center">
            <c:choose>
	            <c:when test="${ssKey!=null}">
	            <a href="/auth/logoutProc">
		            <span class="material-symbols-outlined fs-35px">logout</span>
		            <p>로그아웃</p></a>
		        </c:when>
	            <c:when test="${ssKey==null}">
	            <a href="/auth/login">
		            <span class="material-symbols-outlined fs-35px"> login </span>
		            <p>로그인</p></a>
	            </c:when>
            </c:choose>
            
          </li>
          <li class="w-100 h-60px text-center">
            <span class="material-symbols-outlined fs-35px"> local_shipping </span>
            <p>배송</p>
          </li>
          <li class="w-100 h-60px text-center">
            <span class="material-symbols-outlined fs-35px"> shopping_cart </span>
            <p>장바구니</p>
          </li>
          <li class="w-100 h-60px text-center">
            <span class="material-symbols-outlined fs-35px"> inventory </span>
            <p>최근 본</p>
          </li>
          <li class="w-100 h-60px text-center" onclick="scrollToTop()">
            <span class="material-symbols-outlined fx-35px"> arrow_upward </span>
            <p>TOP</p>
          </li>
        </ul>
      </div>
      <div id="open_box" class="w-200px vh-100 visually-hidden bg-light-subtle">
        <button id="close_switch" class="border-0 bg-transparent position-absolute top-50 translate-middle-y">
                <img id="icon_img" src="/image/icon_149.png" alt="">
                <span id="aside_arrow" class="material-symbols-outlined position-absolute text-white">arrow_forward_ios</span>
        </button>
        <!-- 오픈 박스 머리 부분 로그인 요청 -->
        <header class="w-100 h-200px text-center bg-secondary text-white">
          <span class="material-symbols-outlined text-center fs-60px"> account_circle </span>
          <c:choose>
	          <c:when test="${ssKey==null}">
		          <p>
		            <strong><a href="/auth/login" class="text-decoration-underline text-white">로그인</a> 하시고</strong>
		            <br />
		            <span class="fs-12px">즐거운 쇼핑을 시작해보세요.</span>
		          </p>
	          </c:when>
	          <c:when test="${ssKey!=null}">
		          <p>
		            <strong><a href="/auth/login" class="text-decoration-underline text-white">${ssKey.name}(님)</a> 환영합니다.</strong>
		            <br />
		            <span class="fs-12px">즐거운 쇼핑을 시작해보세요.</span>
		          </p>
	          </c:when>
          </c:choose>
        </header>
        <ul class="w-100 h-100 mb-0 d-flex flex-column ps-0 fs-14px text-white bg-black">
          <li class="w-170px fs-6 text-start mx-auto mt-4 position-relative">
            <p class="mb-2">배송</p>
            <div id="delivery_box" class="rounded-3 border border-1 border-black text-wrap bg-secondary h-130px">
              <strong class="mt-2 ms-2 fs-12px">송파점</strong>
              <br />
              <p class="mt-1 ms-2 fs-11px">지금 주문하면 내일 10~13시 <br>도착</p>
              <a href="" class="w-100 position-absolute bottom-0 fs-12px text-center d-block h-50px lh-50px align-middle text-white bg-gradient ">
                <span class="material-symbols-outlined align-middle fs-16px"> timer </span>
                <span class="align-middle">배송가능시간 조회</span>
              </a>
              </
            </div>
          </li>
          <hr>
          <li class="w-100  text-center">
            <span class="material-symbols-outlined fs-35px"> shopping_cart </span>
            <p>장바구니</p>
          </li>
          <hr>
          <li class="w-100  text-center">
            <span class="material-symbols-outlined fs-35px"> inventory </span>
            <p>최근 본</p>
          </li>
          <li class="w-100  text-center bg-secondary position-absolute bottom-0" onclick="scrollToTop()">
            <span class="material-symbols-outlined fx-35px"> arrow_upward </span>
            <p>TOP</p>
          </li>
        </ul>
      </div>
    </aside>
  </body>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</html>
