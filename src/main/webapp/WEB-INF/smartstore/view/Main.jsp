<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>스마트 스토어 메인</title>
    <!-- CSS -->
    <link rel="stylesheet" href="/css/smartstore/view/Main.css" />
    <!-- JS -->
  </head>
  <body>
    <div class="clear"></div>
    <div id="smartstore">
      <!-- top 배너 -->
      <div class="banner">
        <img alt="" src="/image/store_banner.png" style="width: 88.5rem; height: 25rem; margin-bottom: 30px" />
      </div>

      <!-- 베스트 상품 -->
      <p style="text-align: center; font-size: 30px; font-weight: bold">BEST 상품</p>
      <div class="bestlist">
        <div class="bestproduct">
          <a href="/detail" class="bestproduct">
            <img class="medal" src="/image/medal.png" />
            <img alt="" src="/image/best_product01.png" style="width: inherit; height: inherit" /> 맛있는 장어구이<br />63,000원
          </a>
        </div>
        <div class="bestproduct">
          <a href="/detail" class="bestproduct">
            <img class="medal" src="/image/medal.png" />
            <img alt="" src="/image/best_product02.png" style="width: inherit; height: inherit" /> 야무진 오코노미야끼<br />11,000원
          </a>
        </div>
        <div class="bestproduct">
          <a href="/detail" class="bestproduct">
            <img class="medal" src="/image/medal.png" />
            <img alt="" src="/image/best_product03.png" style="width: inherit; height: inherit" /> 지리는 우니<br />80,000원
          </a>
        </div>
        <div class="bestproduct">
          <a href="/detail" class="bestproduct">
            <img class="medal" src="/image/medal.png" />
            <img alt="" src="/image/best_product04.png" style="width: inherit; height: inherit" /> 명인의 허브 스테이크<br />31,500원
          </a>
        </div>
      </div>

      <!-- 신상품 -->
      <p style="text-align: center; font-size: 30px; font-weight: bold">신상품</p>
      <div class="newlist">
        <div class="newproduct">
          <a href="/detail" class="bestproduct">
            <img class="medal" src="/image/new.png" />
            <img alt="" src="/image/new_product01.jpg" style="width: inherit; height: inherit" /> 비엣남 셀러드<br />6,000원
          </a>
        </div>
        <div class="newproduct">
          <a href="/detail" class="bestproduct">
            <img class="medal" src="/image/new.png" />
            <img alt="" src="/image/new_product02.jpg" style="width: inherit; height: inherit" /> 주호민아니고 타코야끼<br />5,000원
          </a>
        </div>
        <div class="newproduct">
          <a href="/detail" class="bestproduct">
            <img class="medal" src="/image/new.png" />
            <img alt="" src="/image/new_product03.jpg" style="width: inherit; height: inherit" /> 둘이먹다 하나 죽어도 모르는 민초피자<br />17,000원
          </a>
        </div>
        <div class="newproduct">
          <a href="/detail" class="bestproduct">
            <img class="medal" src="/image/new.png" />
            <img alt="" src="/image/new_product04.jpg" style="width: inherit; height: inherit" /> 아잉 귀여운 떡<br />9,900원
          </a>
        </div>
      </div>
      <!-- middle 배너 -->
      <div class="banner">
        <img alt="" src="/image/insta_banner.png" style="width: 88.5rem; height: 15rem; margin-bottom: 20px" />
      </div>

      <!-- 상품 전체 -->
      <p style="text-align: center; font-size: 30px; font-weight: bold">상품 전체</p>
      <div class="all">
        <div class="sortlist">
          <ul>
            <li><button>인기도순</button></li>
            <li><button>최신등록순</button></li>
            <li><button>낮은 가격순</button></li>
            <li><button>높은 가격순</button></li>
            <li><button>할인율순</button></li>
            <li><button>누적 판매순</button></li>
            <li><button>리뷰 많은순</button></li>
            <li><button>평점 높은순</button></li>
          </ul>
        </div>
        <div class="all_list">
          <div>
            <a href="/detail"> <img alt="" src="/image/loading.jpg" /><br />상품 준비중 <br />10,000원 </a>
          </div>
          <div>
            <a href="/detail"> <img alt="" src="/image/loading.jpg" /><br />상품 준비중 <br />10,000원 </a>
          </div>
          <div>
            <a href="/detail"> <img alt="" src="/image/loading.jpg" /><br />상품 준비중 <br />10,000원 </a>
          </div>
          <div>
            <a href="/detail"> <img alt="" src="/image/loading.jpg" /><br />상품 준비중 <br />10,000원 </a>
          </div>
          <div>
            <a href="/detail"> <img alt="" src="/image/loading.jpg" /><br />상품 준비중 <br />10,000원 </a>
          </div>
          <div>
            <a href="/detail"> <img alt="" src="/image/loading.jpg" /><br />상품 준비중 <br />10,000원 </a>
          </div>
          <div>
            <a href="/detail"> <img alt="" src="/image/loading.jpg" /><br />상품 준비중 <br />10,000원 </a>
          </div>
          <div>
            <a href="/detail"> <img alt="" src="/image/loading.jpg" /><br />상품 준비중 <br />10,000원 </a>
          </div>
          <div>
            <a href="/detail"> <img alt="" src="/image/loading.jpg" /><br />상품 준비중 <br />10,000원 </a>
          </div>
          <div>
            <a href="/detail"> <img alt="" src="/image/loading.jpg" /><br />상품 준비중 <br />10,000원 </a>
          </div>
        </div>
        <a href="/list" style="text-align: center; display: block; margin-top: 20px; margin-bottom: 20px"> 전체 상품 더보기</a>
      </div>
    </div>
  </body>
</html>
