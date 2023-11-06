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
      <a href="/login/memberjoin">
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
          <a href="/user/login">
            <div class="d-flex align-items-center h-40px">
              <img src="/icon/image__header-cart.svg" alt="" />
            </div>
          </a>
          <a href="/user/my-page">
            <div class="d-flex align-items-center h-40px">
              <img src="/icon/image__header-mypage.svg" alt="" srcset="" />
            </div>
          </a>
        </div>
      </nav>
      <!-- ! 카테고리 버튼 -->
      <div id="category_button" class="float-start w-50px h-50px border-1 text-center">
        <span class="material-symbols-outlined fs-50px align-middle"> menu </span>
        <!-- ! 카테고리 내부 2차 항목 -->
        <div id="category_box" class="d-flex flex-column w-150px h-400px bg-white border-3 shadow-lg position-absolute z-3 visually-hidden">
          <div id="category_box_inside" class="visually-hidden position-absolute w-500px h-400px">
            <div id="fruit_inside" class="d-flex visually-hidden">
              <a href="/np/search?category=11000" data-inside="fruit_inside_01">과일</a>
              <a href="/np/search?category=12000" data-inside="fruit_inside_02">견과</a>
            </div>
            <div id="vegetable_inside" class="d-flex visually-hidden">
              <a href="/np/search?category=21000" data-inside="vegetable_inside_01">뿌리채소</a>
              <a href="/np/search?category=22000" data-inside="vegetable_inside_02">열매채소</a>
            </div>
            <div id="rice_inside" class="d-flex visually-hidden">
              <a href="/np/search?category=31000" data-inside="rice_inside_01">쌀</a>
              <a href="/np/search?category=32000" data-inside="rice_inside_02">잡곡/혼합곡</a>
            </div>
            <div id="meat_inside" class="d-flex visually-hidden">
              <a href="/np/search?category=41000" data-inside="meat_inside_01">돼지고기</a>
              <a href="/np/search?category=42000" data-inside="meat_inside_02">소고기</a>
            </div>
            <div id="fish_inside" class="d-flex visually-hidden">
              <a href="/np/search?category=51000" data-inside="fish_inside_01">생선</a>
              <a href="/np/search?category=52000" data-inside="fish_inside_02">젓갈류/액젓</a>
            </div>
            <div id="processed_inside" class="d-flex visually-hidden">
              <a href="/np/search?category=61000" data-inside="processed_inside_01">냉동/간편조리식</a>
              <a href="/np/search?category=62000" data-inside="processed_inside_02">빵/케이크</a>
            </div>
          </div>
          <!-- ! 카테고리 내부 3차 항목 -->
          <div id="category_box_inside_last" class="visually-hidden position-absolute w-300px h-400px">
            <div id="fruit_inside_01" class="d-flex visually-hidden">
              <a href="/np/search?category=11001">사과</a>
              <a href="/np/search?category=11002">딸기</a>
              <a href="/np/search?category=11003">바나나</a>
            </div>
            <div id="fruit_inside_02" class="d-flex visually-hidden">
              <a href="/np/search?category=12001">호두</a>
              <a href="/np/search?category=12002">아몬드</a>
              <a href="/np/search?category=12003">땅콩</a>
            </div>
            <div id="vegetable_inside_01" class="d-flex visually-hidden">
              <a href="/np/search?category=21001">고구마</a>
              <a href="/np/search?category=21002">감자</a>
              <a href="/np/search?category=21003">양파</a>
            </div>
            <div id="vegetable_inside_02" class="d-flex visually-hidden">
              <a href="/np/search?category=22001">고추</a>
              <a href="/np/search?category=22002">오이</a>
              <a href="/np/search?category=22003">호박</a>
            </div>
            <div id="rice_inside_01" class="d-flex visually-hidden">
              <a href="/np/search?category=31001">백미</a>
              <a href="/np/search?category=31002">흑미</a>
              <a href="/np/search?category=31003">찹쌀</a>
            </div>
            <div id="rice_inside_02" class="d-flex visually-hidden">
              <a href="/np/search?category=32001">혼합곡</a>
              <a href="/np/search?category=32002">보리</a>
              <a href="/np/search?category=32003">콩류</a>
            </div>
            <div id="meat_inside_01" class="d-flex visually-hidden">
              <a href="/np/search?category=41001">한돈</a>
              <a href="/np/search?category=41002">수입산 돼지고기</a>
            </div>
            <div id="meat_inside_02" class="d-flex visually-hidden">
              <a href="/np/search?category=42001">한우</a>
              <a href="/np/search?category=42002">수입산 소고기</a>
            </div>
            <div id="fish_inside_01" class="d-flex visually-hidden">
              <a href="/np/search?category=51001">굴비/조기</a>
              <a href="/np/search?category=51002">갈치</a>
              <a href="/np/search?category=51003">장어</a>
            </div>
            <div id="fish_inside_02" class="d-flex visually-hidden">
              <a href="/np/search?category=52001">조개젓</a>
              <a href="/np/search?category=52002">젓갈세트</a>
            </div>
            <div id="processed_inside_01" class="d-flex visually-hidden">
              <a href="/np/search?category=61001">즉석조리/볶음요리</a>
              <a href="/np/search?category=61002">떡볶이</a>
              <a href="/np/search?category=61003">찌개/찜</a>
            </div>
            <div id="processed_inside_02" class="d-flex visually-hidden">
              <a href="/np/search?category=62001">케이크/머핀</a>
              <a href="/np/search?category=62002">식빵/베이글</a>
            </div>
          </div>

          <!-- ! 카테고리 1차 항목 -->
          <div id="category_box_outside" class="d-flex flex-column w-150px h-400px">
            <a href="/np/search?category=10000" id="category_fruit" data-inside="fruit_inside">
              <span class="checkbox-icon"> <i class="fa-solid fa-lemon fs-6 mb-3 text-warning"></i> </span>
              과일/견과</a
            >

            <a href="/np/search?category=20000" id="category_vegetable" data-inside="vegetable_inside">
              <i class="fa-solid fa-carrot fs-6 mb-3" style="color: rgb(247, 138, 21)"></i>
              채소</a
            >
            <a href="/np/search?category=30000" id="category_rice" data-inside="rice_inside">
              <i class="fa-solid fa-bowl-rice fs-6 mb-3" style="color: rgb(192, 176, 133)"></i>
              쌀/잡곡</a
            >
            <a href="/np/search?category=40000" id="category_meat" data-inside="meat_inside">
              <i class="fa-solid fa-bacon fs-6 mb-3 text-danger"></i>
              축산물</a
            >
            <a href="/np/search?category=50000" id="category_fish" data-inside="fish_inside">
              <i class="fa-solid fa-fish-fins fs-6 mb-3 text-primary"></i>
              수산물</a
            >
            <a href="/np/search?category=60000" id="category_processed" data-inside="processed_inside">
              <i class="fa-solid fa-egg fs-6 mb-3" style="color: rgb(242, 154, 95)"></i>
              가공식품</a
            >
          </div>
        </div>
      </div>

      <!-- ! 상단 nav 메뉴 -->
      <nav id="top_menu" class="fs-6 float-start ms-5 border-1">
        <a href="/np/best-product">
          <div id="style_store"><span>산지제철</span></div>
        </a>
        <a href="/np/best-region">
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
      <div class="clearfix"></div>
    </section>
  </body>
</html>
