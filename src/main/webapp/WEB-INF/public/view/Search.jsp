<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="" isErrorPage="false" import="java.util.Date" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous" />
    <link rel="stylesheet" href="/css/Search.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue@2"></script>
  	<script type="module" src="/js/auth/Search.js"></script>
  </head>
  <body>
  <div id="searchF">
    <!-- ? 왼쪽 검색 옵션 필터 -->
    <section id="filter" class="position-relative d-flex flex-column float-start w-200px border border-1">
      <h5 class="mt-4 ms-3">필터</h5>
      <!-- ! 체크 항목 있으면 전체 해제 옵션 보이게 -->
      <div id="checked_option" class="fs-14px position-absolute end-0 mt-4 me-2">
        <button class="bg-white" @click="resetFilters"><span class="fs-16px material-symbols-outlined align-middle"> restart_alt </span>전체해제</button>
      </div>
      <!-- ! 배송 옵션 -->
      <div id="delivery_option" class="d-flex flex-column mt-2">
        <label><input type="checkbox" name="s_addr" value="오늘출발" v-model="filters.delivery" /> 오늘출발</label>
        <label><input type="checkbox" name="s_addr" value="무료배송" v-model="filters.delivery" /> 무료배송</label>
      </div>
      <!-- ! 보관방법 옵션 -->
      <div id="keep_option" class="d-flex flex-column">
        <h6 class="fw-bold">보관방법</h6>
        <label><input type="checkbox" name="s_addr" value="냉동" v-model="filters.keep" /> 냉동</label>
        <label><input type="checkbox" name="s_addr" value="냉장" v-model="filters.keep" /> 냉장</label>
        <label><input type="checkbox" name="s_addr" value="실온" v-model="filters.keep" /> 실온</label>
      </div>
      <!-- ! 브랜드 옵션 -->
      <div id="brand_option" class="d-flex flex-column">
        <h6 class="fw-bold">브랜드</h6>
        <label><input type="checkbox" name="s_addr" value="풀무원" v-model="filters.brand" /> 풀무원</label>
        <label><input type="checkbox" name="s_addr" value="그리닝 스텐다드" v-model="filters.brand" /> 그리닝 스텐다드</label>
        <label><input type="checkbox" name="s_addr" value="안성 인삼조합" v-model="filters.brand" /> 안성 인삼조합</label>
      </div>
      <!-- ! 중량 옵션 -->
      <div id="weight_option" class="d-flex flex-column">
        <h6 class="fw-bold">총 중량</h6>
        <label><input type="checkbox" name="s_addr" value="500g 이하" v-model="filters.weight" /> 500g 이하</label>
        <label><input type="checkbox" name="s_addr" value="500g~1kg" v-model="filters.weight" /> 500g~1kg</label>
        <label><input type="checkbox" name="s_addr" value="1~3kg" v-model="filters.weight" /> 1~3kg</label>
        <label><input type="checkbox" name="s_addr" value="3~5kg" v-model="filters.weight" /> 3~5kg</label>
        <label><input type="checkbox" name="s_addr" value="5~10kg" v-model="filters.weight" /> 5~10kg</label>
        <label><input type="checkbox" name="s_addr" value="10kg 이상" v-model="filters.weight" /> 10kg 이상</label>
      </div>
      <!-- ! 별점 옵션 -->
      <div id="star_option" class="d-flex flex-column">
        <h6 class="fw-bold">별점</h6>
        <label><span>별점 전체</span></label>
        <label><span>별점 4점 이상</span></label>
        <label><span>별점 3점 이상</span></label>
        <label><span>별점 2점 이상</span></label>
        <label><span>별점 1점 이상</span></label>
      </div>
      <!-- ! 가격 옵션 -->
      <div id="price_option">
        <h6 class="fw-bold">가격</h6>
        <div id="price_range" class="fs-10px">
          <span> <input type="text" class="" maxlength="10" /> ~ </span>
          <span> <input type="text" class="" maxlength="10" />원 </span>
          <span><button class="bg-info rounded-2">검색</button></span>
        </div>
      </div>
    </section>
    <section id="search_items" class="float-start border border-1">
      <!-- ! 상단 나열 옵션 -->
      <div id="product_option" class="ms-4 mt-4">
        <h5>''에 대한 검색 결과</h5>
        <div id="product_option_list" class="bg-secondary">
          <label for="" class="ms-3">랭킹순</label>
          <label for="">낮은가격순</label>
          <label for="">높은가격순</label>
          <label for="">판매량순</label>

          <label for="">최신순</label>
        </div>
      </div>

      <!-- ! 상품 카드 목록 -->
      <div id="product_list" class="ms-2 me-2 mb-5 mt-5 row row-cols-lg-4 row-cols-md-3 row-cols-sm-2 h-100 row-gap-5">
        <div class="col h-460px">
          <div class="card h-100">
            <img
              src="https://images.pexels.com/photos/3804878/pexels-photo-3804878.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
              class="card-img-top w-220px h-220px"
              alt="..." />
            <div class="card-body">
              <h5 class="card-title"><span id="percent" class="text-danger me-2">17%</span>24,800원</h5>
              <p class="card-text fw-lighter fs-14px">
                산지직송 13brix 프리미엄 유라조생 감귤 5kg 3kg
                <br />
                <i class="fa-solid fa-star fs-10px mt-3" style="color: #ff0000"></i>
                <span id="star_score" class="fs-11px mt-3">4.8</span>
                <span id="review_count" class="fs-12px text-black-50 mt-3">- 리뷰 14,321</span>
              </p>
            </div>
            <div class="card-footer border-0 bg-transparent ps-1 pb-0 pe-0 w-100">
              <small class="position-absolute bottom-0 mb-2 ms-2 fs-12px align-bottom">제주도 강지헌</small>
              <img
                src="https://images.pexels.com/photos/1482101/pexels-photo-1482101.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                alt=""
                srcset=""
                class="w-60px h-60px rounded-circle float-end mb-2 me-2" />
            </div>
          </div>
        </div>
        <div class="col h-460px">
          <div class="card h-100">
            <img
              src="https://images.pexels.com/photos/3804878/pexels-photo-3804878.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
              class="card-img-top w-220px h-220px"
              alt="..." />
            <div class="card-body">
              <h5 class="card-title"><span id="percent" class="text-danger me-2">17%</span>24,800원</h5>
              <p class="card-text fw-lighter fs-14px">
                산지직송 13brix 프리미엄 유라조생 감귤 5kg 3kg
                <br />
                <i class="fa-solid fa-star fs-10px mt-3" style="color: #ff0000"></i>
                <span id="star_score" class="fs-11px mt-3">4.8</span>
                <span id="review_count" class="fs-12px text-black-50 mt-3">- 리뷰 14,321</span>
              </p>
            </div>
            <div class="card-footer border-0 bg-transparent ps-1 pb-0 pe-0 w-100">
              <small class="position-absolute bottom-0 mb-2 ms-2 fs-12px align-bottom">제주도 강지헌</small>
              <img
                src="https://images.pexels.com/photos/1482101/pexels-photo-1482101.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                alt=""
                srcset=""
                class="w-60px h-60px rounded-circle float-end mb-2 me-2" />
            </div>
          </div>
        </div>
        <div class="col h-460px">
          <div class="card h-100">
            <img
              src="https://images.pexels.com/photos/3804878/pexels-photo-3804878.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
              class="card-img-top w-220px h-220px"
              alt="..." />
            <div class="card-body">
              <h5 class="card-title"><span id="percent" class="text-danger me-2">17%</span>24,800원</h5>
              <p class="card-text fw-lighter fs-14px">
                산지직송 13brix 프리미엄 유라조생 감귤 5kg 3kg
                <br />
                <i class="fa-solid fa-star fs-10px mt-3" style="color: #ff0000"></i>
                <span id="star_score" class="fs-11px mt-3">4.8</span>
                <span id="review_count" class="fs-12px text-black-50 mt-3">- 리뷰 14,321</span>
              </p>
            </div>
            <div class="card-footer border-0 bg-transparent ps-1 pb-0 pe-0 w-100">
              <small class="position-absolute bottom-0 mb-2 ms-2 fs-12px align-bottom">제주도 강지헌</small>
              <img
                src="https://images.pexels.com/photos/1482101/pexels-photo-1482101.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                alt=""
                srcset=""
                class="w-60px h-60px rounded-circle float-end mb-2 me-2" />
            </div>
          </div>
        </div>
        <div class="col h-460px">
          <div class="card h-100">
            <img
              src="https://images.pexels.com/photos/3804878/pexels-photo-3804878.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
              class="card-img-top w-220px h-220px"
              alt="..." />
            <div class="card-body">
              <h5 class="card-title"><span id="percent" class="text-danger me-2">17%</span>24,800원</h5>
              <p class="card-text fw-lighter fs-14px">
                산지직송 13brix 프리미엄 유라조생 감귤 5kg 3kg
                <br />
                <i class="fa-solid fa-star fs-10px mt-3" style="color: #ff0000"></i>
                <span id="star_score" class="fs-11px mt-3">4.8</span>
                <span id="review_count" class="fs-12px text-black-50 mt-3">- 리뷰 14,321</span>
              </p>
            </div>
            <div class="card-footer border-0 bg-transparent ps-1 pb-0 pe-0 w-100">
              <small class="position-absolute bottom-0 mb-2 ms-2 fs-12px align-bottom">제주도 강지헌</small>
              <img
                src="https://images.pexels.com/photos/1482101/pexels-photo-1482101.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                alt=""
                srcset=""
                class="w-60px h-60px rounded-circle float-end mb-2 me-2" />
            </div>
          </div>
        </div>

        <div class="col h-460px">
          <div class="card h-100">
            <img
              src="https://images.pexels.com/photos/3804878/pexels-photo-3804878.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
              class="card-img-top w-220px h-220px"
              alt="..." />
            <div class="card-body">
              <h5 class="card-title"><span id="percent" class="text-danger me-2">17%</span>24,800원</h5>
              <p class="card-text fw-lighter fs-14px">
                산지직송 13brix 프리미엄 유라조생 감귤 5kg 3kg
                <br />
                <i class="fa-solid fa-star fs-10px mt-3" style="color: #ff0000"></i>
                <span id="star_score" class="fs-11px mt-3">4.8</span>
                <span id="review_count" class="fs-12px text-black-50 mt-3">- 리뷰 14,321</span>
              </p>
            </div>
            <div class="card-footer border-0 bg-transparent ps-1 pb-0 pe-0 w-100">
              <small class="position-absolute bottom-0 mb-2 ms-2 fs-12px align-bottom">제주도 강지헌</small>
              <img
                src="https://images.pexels.com/photos/1482101/pexels-photo-1482101.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                alt=""
                srcset=""
                class="w-60px h-60px rounded-circle float-end mb-2 me-2" />
            </div>
          </div>
        </div>
        <div class="col h-460px">
          <div class="card h-100">
            <img
              src="https://images.pexels.com/photos/3804878/pexels-photo-3804878.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
              class="card-img-top w-220px h-220px"
              alt="..." />
            <div class="card-body">
              <h5 class="card-title"><span id="percent" class="text-danger me-2">17%</span>24,800원</h5>
              <p class="card-text fw-lighter fs-14px">
                산지직송 13brix 프리미엄 유라조생 감귤 5kg 3kg
                <br />
                <i class="fa-solid fa-star fs-10px mt-3" style="color: #ff0000"></i>
                <span id="star_score" class="fs-11px mt-3">4.8</span>
                <span id="review_count" class="fs-12px text-black-50 mt-3">- 리뷰 14,321</span>
              </p>
            </div>
            <div class="card-footer border-0 bg-transparent ps-1 pb-0 pe-0 w-100">
              <small class="position-absolute bottom-0 mb-2 ms-2 fs-12px align-bottom">제주도 강지헌</small>
              <img
                src="https://images.pexels.com/photos/1482101/pexels-photo-1482101.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                alt=""
                srcset=""
                class="w-60px h-60px rounded-circle float-end mb-2 me-2" />
            </div>
          </div>
        </div>
        <div class="col h-460px">
          <div class="card h-100">
            <img
              src="https://images.pexels.com/photos/3804878/pexels-photo-3804878.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
              class="card-img-top w-220px h-220px"
              alt="..." />
            <div class="card-body">
              <h5 class="card-title"><span id="percent" class="text-danger me-2">17%</span>24,800원</h5>
              <p class="card-text fw-lighter fs-14px">
                산지직송 13brix 프리미엄 유라조생 감귤 5kg 3kg
                <br />
                <i class="fa-solid fa-star fs-10px mt-3" style="color: #ff0000"></i>
                <span id="star_score" class="fs-11px mt-3">4.8</span>
                <span id="review_count" class="fs-12px text-black-50 mt-3">- 리뷰 14,321</span>
              </p>
            </div>
            <div class="card-footer border-0 bg-transparent ps-1 pb-0 pe-0 w-100">
              <small class="position-absolute bottom-0 mb-2 ms-2 fs-12px align-bottom">제주도 강지헌</small>
              <img
                src="https://images.pexels.com/photos/1482101/pexels-photo-1482101.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                alt=""
                srcset=""
                class="w-60px h-60px rounded-circle float-end mb-2 me-2" />
            </div>
          </div>
        </div>
       <!-- 필터링 연습 -->
       <div class="col h-460px" v-for="item in filteredItems" :key="item.id">
          <div class="card h-100">
            <img
              :src="item.imageUrl1"
              class="card-img-top w-220px h-220px"
              alt="..." />
            <div class="card-body">
              <h5 class="card-title"><span id="percent" class="text-danger me-2">{{ item.discount }}</span>{{ item.price }}원</h5>
              <p class="card-text fw-lighter fs-14px">
                {{ item.name }}
                <br />
                <i class="fa-solid fa-star fs-10px mt-3" style="color: #ff0000"></i>
                <span id="star_score" class="fs-11px mt-3">{{ item.rating }}</span>
                <span id="review_count" class="fs-12px text-black-50 mt-3">- 리뷰 {{ item.reviews }}</span>
              </p>
            </div>
            <div class="card-footer border-0 bg-transparent ps-1 pb-0 pe-0 w-100">
              <small class="position-absolute bottom-0 mb-2 ms-2 fs-12px align-bottom">{{ item.seller }}</small>
              <img
                :src="item.imageUrl2"
                alt=""
                srcset=""
                class="w-60px h-60px rounded-circle float-end mb-2 me-2" />
            </div>
          </div>
        </div>
        <!-- 연습 끝 -->
      </div>
      </div>
    </section>
    <div class="clearfix"></div>
  </body>

</html>