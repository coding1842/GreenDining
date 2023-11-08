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
  </head>
  <body>
    <section class="container">
      <div class="row">
        <div class="col">
          <section id="category_group">
            <fieldset class="checkbox-group">
              <legend class="checkbox-group-legend">MD 추천</legend>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" checked onclick="checkedCategory(this,10000)" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <span class="material-symbols-outlined fs-1"> apps </span>
                    </span>
                    <span class="checkbox-label">전체</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" onclick="checkedCategory(this,20000)" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon"> <i class="fa fa-map-marker fs-2 mb-3 text-warning"></i> </span>
                    <span class="checkbox-label">수도권</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" onclick="checkedCategory(this,30000)" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa fa-map-marker fs-2 mb-3" style="color: rgb(247, 138, 21)"></i>
                    </span>
                    <span class="checkbox-label">강원도</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" onclick="checkedCategory(this,40000)" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa fa-map-marker fs-2 mb-3" style="color: rgb(192, 176, 133)"></i>
                    </span>
                    <span class="checkbox-label">충청도</span>
                  </span>
                </label>
              </div>

              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" onclick="checkedCategory(this,50000)" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa fa-map-marker fs-2 mb-3 text-danger"></i>
                    </span>
                    <span class="checkbox-label">경상도</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" onclick="checkedCategory(this,60000)" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa fa-map-marker fs-2 mb-3 text-primary"></i>
                    </span>
                    <span class="checkbox-label">전라도</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" onclick="checkedCategory(this,70000)" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa fa-map-marker fs-2 mb-3" style="color: rgb(242, 154, 95)"></i>
                    </span>
                    <span class="checkbox-label">제주도</span>
                  </span>
                </label>
              </div>
            </fieldset>
          </section>
        </div>
      </div>
      <div class="mb-5 mt-5 row row-cols-lg-5 row-cols-md-4 row-cols-sm-3 h-100 row-gap-5">
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
      </div>
    </section>
  </body>
</html>
