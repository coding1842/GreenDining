<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage=""
isErrorPage="false" import="java.util.Date" %> <%-- <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %> --%>

<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Header</title>
  
  </head>
  <body>    
        <section id="coupon_banner">
          <a href="/login/memberJoin">
            <div class="text-center h-30px" id="coupon_contents">
              <p>지금 회원가입 하면 즉시 <b>1만원 쿠폰팩 지급</b></p>
            </div>
          </a>
        </section>
        <section id="header_popup" class="mt-4">
          <nav id="logo_and_icons" class="position-relative h-80px">
            <div id="logo" class="position-absolute start-0 w-300px">
              <a href="/index">
                <div id="style_logo" class="fs-4">
                  <span>그린 다이닝</span>
                </div>
              </a>
            </div>
            <div id="icons" class="fs-5 position-absolute end-0 w-300px d-flex align-items-end">
              <a href="/search" class="">
                <div>
                  <i class="fa-solid fa-magnifying-glass"></i>
                </div>
              </a>
              <a href="/cart">
                <div>
                  <i class="fa-solid fa-cart-shopping"></i>
                </div>
              </a>
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
            <a href="/store">
              <div id="style_store"><span>스토어</span></div>
            </a>
            <a href="/recipe">
              <div id="style_recipe"><span>레시피</span></div>
            </a>
            <a href="/chikenGuide" class="me-0">
              <div id="style_chikenGuide"><span>키친가이드</span></div>
            </a>
            <div class="lh-27px h-40px">|</div>
            <a href="/curation">
              <div id="style_curation"><span>CURATION</span></div>
            </a>
            <a href="/event">
              <div id="style_event"><span>EVENT</span></div>
            </a>
          </nav>
        </section>
       
     
    
   

  </body>
</html>
