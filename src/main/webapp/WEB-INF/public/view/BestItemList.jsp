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
    <link rel="stylesheet" href="/dist/bundle/bundle.css" />
    <script src="/dist/bundle/bundle.js"></script>
    <script src="/js/Script.js"></script>
    <script src="/js/public/Search.js"></script>
  </head>
  <body>
    <input type="hidden" name="category_code" value="${category}">
    <input type="hidden" id="redirect_url" value="/np/best-item"></input>
    <section class="container">
      <div class="row">
        <div class="col">
          <section id="category_group">
            <fieldset class="checkbox-group">
              <legend class="checkbox-group-legend">MD 추천</legend>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" value="0" onclick="checkedCategory(this,0)" />
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
                  <input type="checkbox" class="checkbox-input" value="10000" onclick="checkedCategory(this,10000)" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon"> <i class="fa-solid fa-lemon fs-2 mb-3 text-warning"></i> </span>
                    <span class="checkbox-label">과일</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" value="20000" onclick="checkedCategory(this,20000)" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa-solid fa-carrot fs-2 mb-3" style="color: rgb(247, 138, 21)"></i>
                    </span>
                    <span class="checkbox-label">채소</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" value="30000" onclick="checkedCategory(this,30000)" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa-solid fa-bowl-rice fs-2 mb-3" style="color: rgb(192, 176, 133)"></i>
                    </span>
                    <span class="checkbox-label">쌀/잡곡</span>
                  </span>
                </label>
              </div>

              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" value="40000" onclick="checkedCategory(this,40000)" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa-solid fa-bacon fs-2 mb-3 text-danger"></i>
                    </span>
                    <span class="checkbox-label">축산물</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" value="50000" onclick="checkedCategory(this,50000)" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa-solid fa-fish-fins fs-2 mb-3 text-primary"></i>
                    </span>
                    <span class="checkbox-label">수산물</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" value="60000" onclick="checkedCategory(this,60000)" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa-solid fa-egg fs-2 mb-3" style="color: rgb(242, 154, 95)"></i>
                    </span>
                    <span class="checkbox-label">가공식품</span>
                  </span>
                </label>
              </div>
            </fieldset>
          </section>
        </div>
      </div>
      <div class="mb-5 mt-5 row row-cols-lg-5 row-cols-md-4 row-cols-sm-3 h-100 row-gap-5">
        <c:choose>
          <c:when test="${fn:length(salePage.content) > 0}">
            <c:forEach var="sale" items="${salePage.content}" varStatus="i">
              <div class="col h-460px">
                <div class="card h-100">
                  <img src="${sale.image_path}" class="card-img-top w-220px h-220px" alt="..." />
                  <div class="card-body">
                    <h5 class="card-title">
                      <span id="percent" class="text-danger me-2">${sale.discount}%</span>
                      <c:set var="discountedPrice" value="${sale.min_price*(1-sale.discount/100)}" />
                      <fmt:formatNumber value="${discountedPrice}" pattern="#,##0" />원
                    </h5>
                    <p class="card-text fw-lighter fs-14px">
                      ${sale.title}
                      <br />
                      <i class="fa-solid fa-star fs-10px mt-3" style="color: #ff0000"></i>
                      <span id="star_score" class="fs-11px mt-3">4.8</span>
                      <span id="review_count" class="fs-12px text-black-50 mt-3">- 리뷰 14,321</span>
                    </p>
                  </div>
                  <div class="card-footer border-0 bg-transparent ps-1 pb-0 pe-0 w-100">
                    <small class="position-absolute bottom-0 mb-2 ms-2 fs-12px align-bottom">${sale.store_name}</small>
                    <img src="${sale.image_path}" alt="" srcset="" class="w-60px h-60px rounded-circle float-end mb-2 me-2" />
                  </div>
                </div>
              </div>
            </c:forEach>
          </c:when>
          <c:when test="${fn:length(salePage.content) == 0}">
            <h6>검색한 상품이 없습니다.</h6>
          </c:when>
        </c:choose>
      </div>
    </section>
  </body>
</html>
