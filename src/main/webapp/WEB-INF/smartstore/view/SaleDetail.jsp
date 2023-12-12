<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="" isErrorPage="false" 
 import="java.util.Date" 
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />


    <!-- JS -->
    <script src="/jquery/jquery-3.7.0.min.js"></script>

    <script src="/js/user/Review.js"></script>
	
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>  
  </head>
  <body>
    <!-- 상품이미지 -->
    <section id="detailSwiper" class="w-50 h-500px d-block position-relative float-start">
      <div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff" class="swiper mySwiper mainSwiper">
	<div class="swiper-wrapper">
		<c:forEach var="path" items="${sale.image_group_path}" varStatus="i">
			<div class="swiper-slide" style="background-image:
			url(${path});">
			</div>
		</c:forEach>
        </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-pagination"></div>
      </div>
    </section>
    <!-- 상품대표 설명 -->
    <section id="product_detail" class="w-50 float-end">
      <div class="product_info" >
        <h3>${sale.title}</h3>
        <div class="float-start">
          <span id="percent" class="text-danger me-2 fs-3">${sale.discount}%</span>
        </div>
        <div class="float-end">
          <c:set var="discountedPrice" value="${sale.min_price*(1-sale.discount/100)}" />
          <span class="text-decoration-line-through fs-5 text-secondary"><fmt:formatNumber value="${sale.min_price}" pattern="#,##0" />원</span>
          <span class="fs-3 fw-bold"><fmt:formatNumber value="${discountedPrice}" pattern="#,##0" />원</span>
        </div>
        <div class="clearfix"></div>

        <div id="delivery_type">
          <span><span class="text-primary">오늘 출발</span> 낮 12시 마감</span>
          <p>12시 이후 주문시 내일 발송</p>
          <select>
            <option value="">배송방법 선택</option>
            <option value="택배">택배</option>
            <option value="퀵서비스">퀵서비스</option>
          </select>
          <div>
            <p>택배배송 | 3,000원(주문시 결제) • 롯데택배</p>
            <p style="color: #a6a6a6">제주, 도서지역 추가 5,000원</p>
          </div>
        </div>
        
        <div id="sale_product_select">
          <div class="dropdown">
            <button class="rounded-0 border-1 btn-secondary dropdown-toggle w-100 h-40px text-start ps-4 bg-transparent" type="button" data-bs-toggle="dropdown" aria-expanded="false">
              선택
            </button>
            <ul class="dropdown-menu border-1 rounded-0 w-100">
              <c:forEach var="sale_product" items="${saleProductList_MAIN}" varStatus="i">
                <c:choose>
                <c:when test="${sale_product.stock > 0}">             
                <li>
                  <div class="dropdown-item main_type">
                    <span class="selected_name">${sale_product.name}
                      <br>
                      <input type="number" class="checked_quantity visually-hidden w-25" name="cartDTOList[].quantity" value="1" min="1" id="">
                      <span class="float-end selected_price visually-hidden">
                        <input type="hidden" name="cartDTOList[].name" value="${sale_product.name}">
                        <input type="hidden" name="cartDTOList[].before_price" class="before_price" value="${sale_product.before_price}"/>
                        <input type="hidden" name="cartDTOList[].after_price" class="after_price" value="${sale_product.before_price*(1-sale.discount/100)}" name="">
                         <input type="hidden" class="total_price" value="${sale_product.before_price*(1-sale.discount/100)}">
                        <span class="total_price_text">
                          <fmt:formatNumber value="${sale_product.before_price*(1-sale.discount/100)}" pattern="#,##0" />원                          
                        </span> 
                          <span class="sale_product_delete material-symbols-outlined">close</span>
                      </span>
                    </span>
                    <input type="hidden" class="product_id" name="cartDTOList[].product_id" value="${sale_product.product_id}">
                    <input type="hidden" name="cartDTOList[].sale_id" value="${sale_product.sale_id}">
                    <input type="hidden" name="cartDTOList[].store_name" value="${sale.store_name}">
                  </div>
                </li>
                </c:when>   
                <c:when test="${sale_product.stock <= 0}">
                  <li>
                  <div class="dropdown-item sold_out">
                    <span class="selected_name text-secondary">${sale_product.name} - 품절
                      <br>
                      <input type="number" class="checked_quantity visually-hidden w-25" name="cartDTOList[].quantity" value="1" min="1" id="">
                      <span class="float-end selected_price visually-hidden">
                        <input type="hidden" name="cartDTOList[].name" value="${sale_product.name}">
                        <input type="hidden" name="cartDTOList[].before_price" class="before_price" value="${sale_product.before_price}"/>
                        <input type="hidden" name="cartDTOList[].after_price" class="after_price" value="${sale_product.before_price*(1-sale.discount/100)}" name="">
                         <input type="hidden" class="total_price" value="${sale_product.before_price*(1-sale.discount/100)}">
                        <span class="total_price_text">
                          <fmt:formatNumber value="${sale_product.before_price*(1-sale.discount/100)}" pattern="#,##0" />원                          
                        </span> 
                          <span class="sale_product_delete material-symbols-outlined">close</span>
                      </span>
                    </span>
                    <input type="hidden" class="product_id" name="cartDTOList[].product_id" value="${sale_product.product_id}">
                    <input type="hidden" name="cartDTOList[].sale_id" value="${sale_product.sale_id}">
                    <input type="hidden" name="cartDTOList[].store_name" value="${sale.store_name}">
                  </div>
                </li>
                </c:when>
                </c:choose>
              </c:forEach>
            </ul>

          </div>
          
          <p class="mb-0">추가상품</p>
          <div class="dropdown">
            <input type="hidden" name="">
            <button class="rounded-0 border-1 btn-secondary dropdown-toggle w-100 h-40px text-start ps-4 bg-transparent" type="button" data-bs-toggle="dropdown" aria-expanded="false">
              함께구입
            </button>
            <ul class="dropdown-menu border-1 rounded-0 w-100">
              <c:forEach var="sale_product" items="${saleProductList_SUB}" varStatus="i">
                <c:choose>
                <c:when test="${sale_product.stock > 0}">
               <li>
                  <div class="dropdown-item sub_type">
                    <span class="selected_name text-secondary">${sale_product.name} - 품절
                      <br>
                      <input type="number" class="checked_quantity visually-hidden w-25" name="cartDTOList[].quantity" value="1" min="1" id="">
                      <span class="float-end selected_price visually-hidden">
                        <input type="hidden" name="cartDTOList[].name" value="${sale_product.name}">
                        <input type="hidden" name="cartDTOList[].before_price" class="before_price" value="${sale_product.before_price}"/>
                        <input type="hidden" name="cartDTOList[].after_price" class="after_price" value="${sale_product.before_price*(1-sale.discount/100)}" name="">
                         <input type="hidden" class="total_price" value="${sale_product.before_price*(1-sale.discount/100)}">
                        <span class="total_price_text">
                          <fmt:formatNumber value="${sale_product.before_price*(1-sale.discount/100)}" pattern="#,##0" />원
                        </span> 
                        <span class="sale_product_delete material-symbols-outlined">close</span>
                      </span>
                    </span>
                    <input type="hidden" class="product_id" name="cartDTOList[].product_id" value="${sale_product.product_id}">
                    <input type="hidden" name="cartDTOList[].sale_id" value="${sale_product.sale_id}">
                    <input type="hidden" name="cartDTOList[].store_name" value="${sale.store_name}">
                  </div>
                </li>
                </c:when>
                <c:when test="${sale_product.stock <= 0}">
                <li>
                  <div class="dropdown-item sub_type">
                    <span class="selected_name">${sale_product.name}
                      <br>
                      <input type="number" class="checked_quantity visually-hidden w-25" name="cartDTOList[].quantity" value="1" min="1" id="">
                      <span class="float-end selected_price visually-hidden">
                        <input type="hidden" name="cartDTOList[].name" value="${sale_product.name}">
                        <input type="hidden" name="cartDTOList[].before_price" class="before_price" value="${sale_product.before_price}"/>
                        <input type="hidden" name="cartDTOList[].after_price" class="after_price" value="${sale_product.before_price*(1-sale.discount/100)}" name="">
                         <input type="hidden" class="total_price" value="${sale_product.before_price*(1-sale.discount/100)}">
                        <span class="total_price_text">
                          <fmt:formatNumber value="${sale_product.before_price*(1-sale.discount/100)}" pattern="#,##0" />원
                        </span> 
                        <span class="sale_product_delete material-symbols-outlined">close</span>
                      </span>
                    </span>
                    <input type="hidden" class="product_id" name="cartDTOList[].product_id" value="${sale_product.product_id}">
                    <input type="hidden" name="cartDTOList[].sale_id" value="${sale_product.sale_id}">
                    <input type="hidden" name="cartDTOList[].store_name" value="${sale.store_name}">
                  </div>
                </li>
                </c:when>
                </c:choose>

              </c:forEach>
            </ul>
          </div>
        </div>
        <!-- !!! 매우 중요한 부분 -->
            <hr>

        <div id="selected_sale_product">

          <form action="" method="post" id="sale_product_form">
            <div id="main_type">
              
            </div>
            <hr>

            <div id="sub_type">
            	
            </div>
          </form>
        </div>
            <hr>

        <!-- !!! 매우 중요한 부분 -->
        <div id="total_div">
          <span>총 상품 금액</span>
          <span style="text-align: right" class="float-end total_count"> </span>
          <span style="font-weight: bold" class="fs-3 total_price"></span>
         
        </div>
        <div id="sale_button">
          <button type="button"  class="btn btn-success w-100 h-50px" id="buy_now">구매하기</button>
          <div class="btn-group mt-2 w-100" role="group">
            <a><button type="button" class="btn btn-danger">문의하기</button></a>
            <a><button type="button" class="btn btn-primary">찜하기</button></a>
            <button type="button" class="btn btn-info" id="cart_add">장바구니</button>
          </div>
        </div>
      </div>
    </section>
    <div class="clear"></div>
    <!-- 상품 디테일 선택란 -->
    <section id="info" style="text-align: center">
      <div class="btn-group w-600px" role="group" aria-label="Basic radio toggle button group">
        <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked />
        <label class="btn btn-outline-primary" for="btnradio1">상세정보</label>
        <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" />
        <label class="btn btn-outline-primary" for="btnradio2">리뷰</label>
        <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" />
        <label class="btn btn-outline-primary" for="btnradio3">Q&A</label>
        <input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off" />
        <label class="btn btn-outline-primary" for="btnradio4">반품/교환정보</label>
      </div>
      <!-- 상세정보 -->
      <div class="fingForm" id="1">
        <h4 id="title" class="mt-5">상세정보</h4>
        <table class="product_info" style="text-align: center; display: inline">
          <tr>
            <th>상품번호</th>
            <td>0</td>
            <th>상품상태</th>
            <td>신상품</td>
          </tr>
          <tr>
            <th>제조사</th>
            <td>인혁이네 공장</td>
            <th>브랜드</th>
            <td>인혁짱짱맨</td>
          </tr>
          <tr>
            <th>모델명</th>
            <td>맛도리 장어구이</td>
            <th>원산지</th>
            <td>노스코리아</td>
          </tr>
        </table>
        <br /><br />
        <img alt="상품상세정보이미지" src="/image/hani1.jpg" />
        <img alt="상품상세정보이미지" src="/image/hani2.jpg" />
        <img alt="상품상세정보이미지" src="/image/hani3.jpg" />
        <img alt="상품상세정보이미지" src="/image/hani4.jpg" />
        <img alt="상세정보 펼처보기 기능넣기" src="" />
      </div>

      <!-- 리뷰  -->
      	<div class="fingForm" id="2" style="display: none;">
		        <h4 id="title" class="mt-5">리뷰</h4>
		        <p>상품을 구매하신 분들이 작성하신 리뷰입니다. <br>리뷰 작성시 포인트가 적립됩니다.</p>
		        <p>전체리뷰 수 : '기능'개</p>
		        <a href="/user/review/write?sale_id=${sale.id}" style="border: solid 1px #dddddd; border-radius: 5px;
		        	 background-color: skyblue; padding: 3px">상품 리뷰 작성하기</a>
		        <br /><br />
		      <c:choose>
		      	<c:when test="${fn:length(reviewDTOList) > 0}">
	      		<c:forEach var="review" items="${reviewDTOList}">
		        <table style="margin:  10px 10px;">
		          <tr style="border: none">
		            <th style="border: none">평점</th>
		            <th style="border: none">제목</th>
		            <th style="border: none">작성자</th>
		            <th style="border: none">내용</th>
		            <th style="border: none">이미지</th>
		            <th style="border: none">작성일</th>
		          </tr>
		          <tr>
		            <td style="border: none">${review.star}</td>
		            <td style="border: none">${review.title}</td>
		            <td style="border: none">${review.user_id}</td>
		            <td style="border: none">${review.content}</td>
		            <td style="border: none">${review.image_group_id}</td>
		            <td style="border: none">${review.created_at}</td>
		          </tr>
		        </table>
	       		</c:forEach>
		        <div style="text-align: center; padding: 15px;">
						<div style="display: inline-block; gap:10px">
							<button  id="updateReview"
									type="submit" style="border: 1px solid #eaeaea;
									background-color: white; width: 150px; font-size: 20px; margin-bottom: 20px;">리뷰 수정하기</button>
							<button onclick="controlReview(this,'delete')" id="deleteReview"
							type="button" style="border: 1px solid #eaeaea;
							background-color: white; width: 150px; font-size: 20px; margin-bottom: 20px;">리뷰 삭제하기</button>
						</div>
					</div>
        </c:when>
        <c:when test="${fn:length(reviewDTOList) == 0}">
		        <br /><br />
		        <table style="">
		          <tr style="border: none">
		            <th style="border: none">평점</th>
		            <th style="border: none">제목</th>
		            <th style="border: none">작성자</th>
		            <th style="border: none">내용</th>
		            <th style="border: none">이미지</th>
		            <th style="border: none">작성일</th>
		          </tr>
		          <tr>
		            <td style="border: none">${review.star}</td>
		            <td style="border: none">${review.title}</td>
		            <td style="border: none">${review.user_id}</td>
		            <td style="border: none">${review.content}</td>
		            <td style="border: none">${review.image_group_id}</td>
		            <td style="border: none">${review.created_at}</td>
		          </tr>
		          <tr>
		            <td colspan="6" style="border: none">리뷰가 없습니다. 리뷰를 작성해주세요.</td>
		          </tr>
		        </table>
        </c:when>
		</c:choose>
      </div>

      <!-- Q&A -->
           	<div class="fingForm" id="3" style="display: none;">
		        <h4 id="title" class="mt-5">Q&A</h4>
		        <p>작성하신 질문내역입니다. 문의사항이 있다면 질문을 작성해주세요.</p>
		        <a href="/user/qna/write?sale_id=${sale.id}" style="border: solid 1px #dddddd; border-radius: 5px;
		        	 background-color: skyblue; padding: 3px">상품 질문 작성하기</a>
		        <br />	
	
		        <table style="margin:  10px 10px;">
		          <tr style="border: none">
		            <th style="border: none">제목</th>
		            <th style="border: none">내용</th>
		            <th style="border: none">작성자</th>
		            <th style="border: none">이미지</th>
		            <th style="border: none">작성일</th>
		            <th style="display: none">아이디</th>
		      
		          </tr>
        	   <c:choose>
	          	<c:when test="${fn:length(qnaDTOList) > 0}">
      			<c:forEach var="qna" items="${qnaDTOList}">
		          <tr>
		            <td onclick="location.href='/user/qna/detail?qna_id=${qna.id}'" style="border: none">${qna.title}</td>
		            <td onclick="location.href='/user/qna/detail?qna_id=${qna.id}'" style="border: none">${qna.content}</td>
		            <td onclick="location.href='/user/qna/detail?qna_id=${qna.id}'" style="border: none">${qna.user_id}</td>
		            <td onclick="location.href='/user/qna/detail?qna_id=${qna.id}'" style="border: none">${qna.image_group_id}</td>
		            <td onclick="location.href='/user/qna/detail?qna_id=${qna.id}'" style="border: none">${qna.created_at}</td>
		            <td onclick="location.href='/user/qna/detail?qna_id=${qna.id}'" style="display: none">${qna.id}</td>
	          	  </tr>
			   </c:forEach>
	           </c:when>
	           <c:when test="${fn:length(qnaDTOList) == 0}">
	           	  <tr>
		            <td colspan="6" style="border: none">질문이 없습니다. 문의사항을 작성해주세요.</td>
		          </tr>
		        </c:when>
        		</c:choose>
		        </table>
	       	
		        <div style="text-align: center; padding: 15px;">
						<div style="display: inline-block; gap:10px">
							<button  id="updateQna"
									type="submit" style="border: 1px solid #eaeaea;
									background-color: white; width: 150px; font-size: 20px; margin-bottom: 20px;">질문 수정하기</button>
							<button onclick="controlQna(this,'delete')" id="deleteQna"
							type="button" style="border: 1px solid #eaeaea;
							background-color: white; width: 150px; font-size: 20px; margin-bottom: 20px;">질문 삭제하기</button>
						</div>
					</div>
       
        

      </div>
      
      <!-- 반품/교환 정보 -->
      <div class="fingForm" id="4" style="display: none">
        <h4 id="title" class="mt-5">반품/교환 정보</h4>
        <table>
          <tr>
            <td colspan="2" style="text-align: center">
              반품/교환 안내<br />반품 시 먼저 판매자와 연락하셔서 반품사유, 택배사, 배송비, 반품지 주소 등을 협의하신 후 반품상품을 발송해 주시기
              바랍니다.
            </td>
          </tr>
          <tr>
            <th>판매자 지정택배사</th>
            <td>대현택배</td>
          </tr>
          <tr>
            <th>보내실 곳</th>
            <td>대현이네집</td>
          </tr>
          <tr>
            <th rowspan="2">반품/교환 사유에 따른 요청 가능 기간</th>
            <td>구매자 단순 변심은 상품 수령 후 7일 이내</td>
          </tr>
          <tr>
            <td>표시/광고와 상이, 계약 내용과 다르게 이행된 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내</td>
          </tr>
          <tr>
            <th scope="row" rowspan="7">반품/교환 불가능 사유</th>
            <td>
              <ul>
                <li>
                  <span>1. 반품요청기간이 지난 경우</span>
                </li>
                <li>
                  <span>2. 구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우</span><br />
                  <span class="text-black-50">(단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)</span>
                </li>
                <li>
                  <span>3. 구매자의 책임있는 사유로 포장이 훼손되어 상품 가치가 현저히 상실된 경우</span><br />
                  <span class="text-black-50">(예: 식품, 화장품, 향수류, 음반 등)</span>
                </li>
                <li>
                  <span>4. 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</span><br />
                  <span class="text-black-50">(라벨이 떨어진 의류 또는 태그가 떨어진 명품관 상품인 경우)</span>
                </li>
                <li>
                  <span>5. 시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우</span>
                </li>
                <li>
                  <span>6. 고객의 요청사항에 맞춰 제작에 들어가는 맞춤제작상품의 경우</span><br />
                  <span class="text-black-50"
                    >(판매자에게 회복불가능한 손해가 예상되고, 그러한 예정으로 청약철회권 행사가 불가하다는 사실을 서면 동의 받은 경우)</span
                  >
                </li>
                <li>
                  <span>7. 복제가 가능한 상품 등의 포장을 훼손한 경우</span><br />
                  <span class="text-black-50">(CD/DVD/GAME/도서의 경우 포장 개봉 시)</span>
                </li>
              </ul>
            </td>
          </tr>
        </table>
      </div>
    </section>
    <div class="clear"></div>
  </body>

</html>
