<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="" isErrorPage="false" import="java.util.Date" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>main</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous" />
  </head>
  <body>
    <section id="main_slider">
      <div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff" class="swiper mySwiper mainSwiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide" style=" background-image:
          url(https://images.pexels.com/photos/2252584/pexels-photo-2252584.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1)"">
          <div class="title" data-swiper-parallax="-300">매주 화요일은</div>
          <div class="subtitle" data-swiper-parallax="-200">농산물 데이</div>
          <div class="text" data-swiper-parallax="-100">
            <p>오늘 단 하루, 24시간 특가</p>
          </div>
        </div>
        <div
          class="swiper-slide"
          style="
            background-image: url(https://images.pexels.com/photos/2031994/pexels-photo-2031994.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1);
          ">
          <div class="title" data-swiper-parallax="-300">가을 제철 특선</div>
          <div class="subtitle" data-swiper-parallax="-200">9월~11월</div>
          <div class="text" data-swiper-parallax="-100">
            <p>지금이 제철! 속이 꽉 찬 꽃게</p>
          </div>
        </div>
        <div
          class="swiper-slide"
          style="
            background-image: url(https://images.pexels.com/photos/566344/pexels-photo-566344.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1);
          ">
          <div class="title" data-swiper-parallax="-300">가을 제철 특선</div>
          <div class="subtitle" data-swiper-parallax="-200">9월~12월</div>
          <div class="text" data-swiper-parallax="-100">
            <p>팔딱팔딱 싱싱한 새우</p>
          </div>
        </div>
        <div
          class="swiper-slide"
          style="
            background-image: url(https://images.pexels.com/photos/2313686/pexels-photo-2313686.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1);
          ">
          <div class="title" data-swiper-parallax="-300">주말엔 뭐 먹지?</div>
          <div class="subtitle" data-swiper-parallax="-200">#삼겹살 #목살</div>
          <div class="text" data-swiper-parallax="-100">
            <p></p>
          </div>
        </div>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-pagination"></div>
    </section>
    <section id="banner" class="position-relative">
      <video class="position-relative" src="/video/pexels_videos_2620043 (1080p).mp4" autoplay muted loop></video>
      <span id="video_text" class="z-3 position-absolute text-end"> 추천 식자재 구매 </span>
      <span class="material-symbols-outlined z-3 position-absolute text-end" id="video_icon"> arrow_forward_ios </span>
    </section>
    <section id="best_product" title="지금 제일 잘 나가는 상품">
      <h3 class="mb-5 fw-bold">지금 제일 잘 나가는 상품</h3>
      <div class="swiper mySwiper bestSwiper">
        <div class="swiper-wrapper">
          <div
            class="swiper-slide"
            style="
              background-image: url(https://images.pexels.com/photos/2313686/pexels-photo-2313686.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1);
            ">
            <div id="product_rank"></div>
            <div class="product_title">[충북진천] 최종 17920원 가을 진미 꽃게 1KG</div>
            <div class="product_price"><span id="sale_percent">15%</span> 15,000원</div>
          </div>
          <div
            class="swiper-slide"
            style="
              background-image: url(https://images.pexels.com/photos/8108145/pexels-photo-8108145.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1);
            ">
            <div class="product_title">[경기이천] 2023년 이천 경기미 특 햇쌀 10KG</div>
            <div class="product_price"><span id="sale_percent">30%</span> 21,560원</div>
          </div>
          <div
            class="swiper-slide"
            style="
              background-image: url(https://images.pexels.com/photos/769289/pexels-photo-769289.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1);
            ">
            <div class="product_title">[횡성한우 진미네] 한우 +1 등급 기획전 등심,안심,안창살</div>
            <div class="product_price"><span id="sale_percent">45%</span> 32,500원</div>
          </div>
          <div
            class="swiper-slide"
            style="
              background-image: url(https://images.pexels.com/photos/3233282/pexels-photo-3233282.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1);
            ">
            <div class="product_title">[전남영암] 믿고먹는 김의준 세척 꿀 고구마</div>
            <div class="product_price"><span id="sale_percent">22%</span> 24,900원</div>
          </div>
          <div
            class="swiper-slide"
            style="
              background-image: url(https://images.pexels.com/photos/2313686/pexels-photo-2313686.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1);
            ">
            <div class="product_title">[충북진천] 최종 17920원 가을 진미 꽃게 1KG</div>
            <div class="product_price">15,000원</div>
          </div>
          <div
            class="swiper-slide"
            style="
              background-image: url(https://images.pexels.com/photos/2313686/pexels-photo-2313686.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1);
            ">
            <div class="product_title">[충북진천] 최종 17920원 가을 진미 꽃게 1KG</div>
            <div class="product_price">15,000원</div>
          </div>
        </div>
        <div class="swiper-button-next_2"></div>
        <div class="swiper-button-prev_2"></div>
      </div>
    </section>
    <section id="recommand_theme" class="mt-5">
      <h3 class="mb-1 fw-bold">추천 테마</h3>
      <div class="" id="image_over">
        <div class="box">
          <img src="https://images.pexels.com/photos/3655916/pexels-photo-3655916.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" />
          <span>프리미엄</span>
        </div>
        <div class="box">
          <img src="https://images.pexels.com/photos/4491279/pexels-photo-4491279.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" />
          <span>식단관리</span>
        </div>
        <div class="box">
          <img src="https://images.pexels.com/photos/4597169/pexels-photo-4597169.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" />
          <span>제철식탁</span>
        </div>
        <div class="box">
          <img src="https://images.pexels.com/photos/18748111/pexels-photo-18748111.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" />
          <span>산지직송</span>
        </div>
      </div>
    </section>
    <section id="special_exhibition" class="h-600px">
      <h3 class="mb-5 fw-bold">기획전 핫딜</h3>
      <div class="container text-light" id="top">
        <div class="row gap-5 w-100 h-200px mt-3">
          <div class="col h-100">
            <div class="perspective">
              <div class="card1">
                <div
                  class="thumb"
                  style="
                    background-image: url(https://images.pexels.com/photos/123013/pexels-photo-123013.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1);
                  "></div>
                <h2>11월 제철</h2>
                <span>수산 시장 새벽 경매 직송 기획전</span>
              </div>
            </div>
          </div>
          <div class="col h-100">
            <div class="perspective">
              <div class="card1">
                <div
                  class="thumb"
                  style="
                    background-image: url(https://images.unsplash.com/photo-1546548970-71785318a17b?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8JUVBJUIwJTkwJUVBJUI3JUE0fGVufDB8fDB8fHww);
                  "></div>
                <h2>타이벡 감귤</h2>
                <span>제주도 서귀포산 감귤 특가</span>
              </div>
            </div>
          </div>
          <div class="col h-100">
            <div class="perspective">
              <div class="card1">
                <div
                  class="thumb"
                  style="
                    background-image: url(https://images.unsplash.com/photo-1695273849615-84f03841b65f?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D);
                  "></div>
                <h2>따뜻한 국수</h2>
                <span>전남 미리내 국수공방</span>
              </div>
            </div>
          </div>
          <div class="col h-100">
            <div class="perspective">
              <div class="card1">
                <div
                  class="thumb"
                  style="
                    background-image: url(https://images.unsplash.com/photo-1601118964938-228a89955311?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D);
                  "></div>
                <h2>겨울 파티 기획전</h2>
                <span>칠면조,소고기 특가</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <div class="clear-fix"></div>
  </body>
</html>
