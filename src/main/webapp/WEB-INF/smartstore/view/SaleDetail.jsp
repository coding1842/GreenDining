<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <!-- CSS -->
    <link rel="stylesheet" href="/css/smartstore/view/SaleItemDetail.css" />
    <!-- JS -->
    <script src="/jquery/jquery-3.7.0.min.js"></script>
    <script src="/js/user/Review.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="/js/smartstore/view/SaleItemDetail.js"></script>
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
            <input type="hidden" name="">
            <button class="rounded-0 border-1 btn-secondary dropdown-toggle w-100 h-40px text-start ps-4 bg-transparent" type="button" data-bs-toggle="dropdown" aria-expanded="false">
              선택
            </button>
            <ul class="dropdown-menu border-1 rounded-0 w-100">
              <c:forEach var="sale_product" items="${saleProductList_MAIN}" varStatus="i">
                <li><button class="dropdown-item" value="">${sale_product.name} </li>
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
                <li><a class="dropdown-item" href="#">Action</a></li>
              </c:forEach>
            </ul>
          </div>
          
        </div>
        <div>
          <span>총 상품 금액</span>
          <span style="text-align: right">총 수량 '기능'개</span>
          <span style="font-weight: bold">'기능'원</span>
        </div>
        <div>
          <a><img alt="구매하기" src="" /></a>
          <div style="flex-wrap: nowrap">
            <a><img alt="문의" src="" /></a>
            <a><img alt="찜하기" src="" /></a>
            <a><img alt="장바구니" src="" /></a>
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

      <!-- 리뷰 1 -->
      <div class="fingForm" id="2" style="display: none">
      <c:choose>
      	<c:when test="${fn:length(reviewDTOList) > 0}">
      		<c:forEach var="review" items="${reviewDTOList}" varStatus="index">
		        <h4 id="title" class="mt-5">리뷰</h4>
		        <p>상품을 구매하신 분들이 작성하신 리뷰입니다. <br>리뷰 작성시 포인트가 적립됩니다.</p>
		        <p>전체리뷰 수 : '기능'개</p>
		        <a href="/user/review/write?sale_id=${sale.id}" style="border: solid 1px #dddddd; border-radius: 5px;
		        	 background-color: skyblue; padding: 3px">상품 리뷰 작성하기</a>
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
		        </table>
		        <div style="text-align: center;">
						<div style="display: inline-block;">
							<button onclick="controlReview(this,'update')" id="updateReview"
									type="button" style="border: 1px solid #eaeaea;
									background-color: white; width: 150px; font-size: 20px; margin-bottom: 20px;">리뷰 수정하기</button>
							<button onclick="controlReview(this,'delete')" id="deleteReview"
							type="button" style="border: 1px solid #eaeaea;
							background-color: white; width: 150px; font-size: 20px; margin-bottom: 20px;">리뷰 삭제하기</button>
						</div>
					</div>
	       </c:forEach>
        </c:when>
        <c:when test="${fn:length(reviewDTOList) == 0}">
        	<h4 id="title" class="mt-5">리뷰</h4>
		        <p>상품을 구매하신 분들이 작성하신 리뷰입니다. <br>리뷰 작성시 포인트가 적립됩니다.</p>
		        <p>전체리뷰 수 : '기능'개</p>
		        <a href="/user/review/write?sale_id=${sale.id}" style="border: solid 1px #dddddd; border-radius: 5px;
		        	 background-color: skyblue; padding: 3px">상품 리뷰 작성하기</a>
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
		            <td colspan="6" style="border: none">리뷰가 없습니다. 리뷰를 작성해주세요.</td>
		          </tr>
		        </table>
        </c:when>
	</c:choose>
      </div>


      <!-- Q&A -->
      <div class="fingForm" id="3" style="display: none">
        <h4 id="title" class="mt-5">Q&A</h4>
        <p style="text-align: center; padding-right: 10px; font-size: 16px">총 질문 수: &nbsp;개</p>
        <a href="/qnaWriteForm" style="border: solid 1px #dddddd; border-radius: 5px; background-color: skyblue; padding: 3px">상품 Q&A 작성하기</a>
        <br /><br />
        <table class="noticelist" style="">
          <tr style="" class="headcolor">
            <th>답변상태</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
          </tr>
          <!-- Q&A 리스트 받아오기 -->
          <c:choose>
            <c:when test="${fn:length(nList)>0}">
              <c:forEach var="notice" items="${nList}"> 
		<tr>
			<td class="co1">${notice.rr}</td> 
			<td><input type="hidden" value="${notice.noti_no}"></td>
			<td class="co2"><a href="/noticeDetail?noti_no=${notice.noti_no}">${notice.subject}</a></td>
			<td class="price">${notice.writer}</td>
			<td class="co4">${notice.readcount}</td>
			<td class="co5">${notice.regdate}</td>
			<td class="co5">${notice.vdate}</td>
		</tr>
	      </c:forEach>
            </c:when>
            <c:when test="${fn:length(nList)==0}">
              <tr style="text-align: center; height: 30px">
                <th colspan="5">공지사항이 없습니다.</th>
              </tr>
            </c:when>
          </c:choose>
          <tr style="text-align: right; height: 50px">
            <th colspan="6" style="text-align: right; border: 1px solid #ffffff"></th>
          </tr>
          <tfoot>
            <tr>
              <td colspan="6" style="text-align: center; border: 1px solid #ffffff">
                <c:if test="${pageDto.startPg>pBlock}">
                  <a href="notice?curPage=${pageDto.startPg-pBlock}&curBlock=${pageDto.curBlock-1}"> [이전] </a>
                </c:if>
                <c:forEach begin="${pageDto.startPg}" end="${pageDto.endPg}" var="p" step="1">
                  <a href="notice?curPage=${p}&curBlock=${pageDto.curBlock}">
                    <span><c:out value="${p}"></c:out></span> </a
                  >&nbsp;&nbsp;
                </c:forEach>
                <c:if test="${pageDto.endPg<pageDto.pgCnt}">
                  <a href="notice?curPage=${pageDto.startPg+pBlock}&curBlock=${pageDto.curBlock+1}"> [다음] </a>
                </c:if>
              </td>
            </tr>
          </tfoot>
        </table>
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
