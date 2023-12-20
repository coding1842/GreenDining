<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/user/MyPage.css" />
<script src="/jquery/jquery-3.7.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="/js/smartstore/ProductPrice.js"></script>
<div class="my_page_box">
	<div class="my_page_aside_box">
		<div class="my_pg_aside_top">
			<h1>MY</h1>
		</div>
	<div id="m_aside">
		<strong>MY 쇼핑</strong>
      	 <ul>
      	 	<a href="/user/my-page"><li>주문목록/배송조회</li></a>
      	 	<a><li>취소/반품/교환/환불</li></a>
      	 	<a><li>정기배송 관리</li></a>
      	 	<a><li>영수증 조회/출력</li></a>
       	</ul>
       </div>
       <div id="m_aside">
       <strong>MY 혜택</strong>
      	 <ul>
      	 	<a><li>할인쿠폰</li></a>
      	 	<a><li>캐시/기프트카드</li></a>
       	</ul>
       </div>
       <div id="m_aside">
       <strong>MY 활동</strong>
      	 <ul>
      	 	<a><li>문의하기</li></a>
      	 	<a><li>문의내역 확인</li></a>
      	 	<a><li>리뷰관리</li></a>
      	 	<a><li>찜 리스트</li></a>
       	</ul>
       </div>
       <div id="m_aside">
       <strong>MY 정보</strong>
      	 <ul>
      	 	<a><li>개인정보확인/수정</li></a>
      	 	<a><li>결제수단관리</li></a>
      	 	<a><li>배송지 관리</li></a>
       	</ul>
	</div>
	</div>
	<div class="my_main_box">
		<div class="m_main_top">
			<div class="m_top1">
				<p>미사용 티켓</p>
				<a href=""><span class="top1_num">0</span><span style="font-weight: 100; color: white;">장</span></a>
			</div>
			<div class="m_top1">
				<p>배송중</p>
				<a href=""><span class="top1_num">${inDeliveryCount}</span><span style="font-weight: 100; color: white;">개</span></a>
			</div>
			<div class="m_top1">
				<p>할인 쿠폰</p>
				<a href=""><span class="top1_num">0</span><span style="font-weight: 100; color: white;">장</span></a>
			</div>
			<div class="m_top2_box">
				<div class="m_top2">
					<div class="m_top2_it">
						쿠폰
					</div>
					<div>
						<a><span>0</span>원</a>
					</div>
				</div>
				<div class="m_top2">
					<div class="m_top2_it">
						캐시
					</div>
					<div>
						<a><span>0</span>원</a>
					</div>
				</div>			
			</div>
		</div>
		 <div class="my_order_title">
			<div id="order_day">			       
				  <fmt:parseDate var="parsedDate" value="${order.created_at}" pattern="yyyy-MM-dd HH:mm:ss"/>
				  <fmt:formatDate pattern="yyyy.MM.dd" value="${parsedDate}" /> 주문
			</div>
			
		</div>
		<div id="my_order_box">
			 <div class="order_body">
					        <div class="or_body_left">
					            <div class="or_body_title">
					                <div class="or_progress">
					                    ${order.status}
					                </div>
					                <div class="or_day">
					                    3/25(월) 도착
					                </div>
					            </div>
					           <c:forEach items="${orderItemList}" var="orderItem">
					            <div class="or_it_box">
					                <div class="or_img_box">
					                	<img alt="" class="w-80px h-80px" src="${orderItem.image_path}">
					                </div>
					                <div class="or_it">
					                    <div class="or_name">
					                        <a href="/item/${orderItem.sale_id}">${orderItem.name}</a>
					                    </div>
					                    <div class="or_price">
					                    	<div>
					                        	<span class="price11">${orderItem.after_price}&nbsp;원 ·</span>
					                       		<span>${orderItem.quantity}&nbsp;개</span>
					                    	</div>
					                    </div>
					                </div>
					            </div>
					          </c:forEach>
					        </div>
					        <div class="or_body_right">
					            <div id="or_right_btn">
					                <button style="margin-bottom: 1rem;">배송 조회</button>
					                <button class="mb-3">교환, 반품 신청</button>
									<c:if test="${order.status == '결제완료'}">
										<button id="order_cancel">결제 취소</button>
										<form id="orderCancelForm" action="">
												<input type="hidden" name="order_id" value="${order.id}">
												<input type="hidden" name="transactionId" value="${order.transaction_id}">
										</form>
									</c:if>
					            </div>
					        </div>
					    </div>
		

			<div id="orderer_box">
				<h5 class="mb-3">받는사람 정보</h5>
				<table class="table table-borderless border-top border-2 border-black">
				<tbody>
					<tr>
						<th scope="row">받는사람</th>
						<td>${addressDTO.name}</td>
					</tr>
					<tr>
						<th scope="row">연락처</th>
						<td colspan="2">${addressDTO.phone}</td>
					</tr>
					<tr>
						<th scope="row">받는주소</th>
						<td colspan="2">${addressDTO.address} ${addressDTO.address2}</td>
					</tr>
					<tr>
						<th scope="row">배송요청사항</th>
						<td colspan="2">${addressDTO.request_option}</td>
					</tr>
				</tbody>
				</table>
			</div>
			<div id="orderer_box">
				<h5 class="mb-3">결제 정보</h5>
				  <table class="table table-borderless border-top border-2 border-black w-100">
					<tbody>
						<tr rowspan="2" class="border-bottom border-1" >
							<th class="w-50">
								결제수단
								<br>
							<span class="fw-light">${order.payment}</span>
							</th>
							<th class="w-50 bg-secondary-subtle">
								<div class="d-flex">
									<div class="w-50 fw-light">총 상품가격</div>
									 <div class="w-50 text-end">
										<fmt:formatNumber value="${order.total_price}" pattern="#,##0"/> 원
									 </div>
								</div>
								
								<div class="d-flex fw-light">
									<div class="w-50">총 할인금액</div>
									 <div class="w-50 text-end">
										<fmt:formatNumber value="${order.discount_price}" pattern="#,##0"/> 원
									</div>
								</div>
								<div class="d-flex fw-light">
									<div class="w-50">배송비</div>
									 <div class="w-50 text-end">3,000 원</div>
								</div>
								
							</th>
						</tr>
						<tr rowspan="2">

							<th>
							
							</th>
							<td>
								<div class="d-flex fw-light">
									<div class="w-50">${order.payment}</div>
									 <div class="w-50 text-end">
										<fmt:formatNumber value="${order.payment_price + 3000}" pattern="#,##0"/> 원
									</div>
								</div>
								<div class="d-flex fw-light">
									<div class="w-50">총 결제금액</div>
									 <div class="w-50 text-end">
										<fmt:formatNumber value="${order.payment_price + 3000}" pattern="#,##0"/> 원
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				  </table>
			</div>
			
		<div class="or_guide_box">
			<div class="or_guide_up">
				<div class="or_guide_1">
					<p>배송상품 주문상태 안내</p>
					<a href="">자세한 내용 더보기 ></a>
				</div>
				<div class="or_guide_2">
					<div class="or_guide_img">
						<i class="fa-solid fa-money-bill-1-wave" style="color: #8a8a8a;"></i>
						<p style="margin: 0;">결제완료</p>
						<p style="font-size: 10px;">주문,결제 확인이 완료되었습니다.</p>
					</div>
					<div class="or_guide_right">
						<i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>					
					</div>
					<div class="or_guide_img">
						<i class="fa-solid fa-box-open" style="color: #8a8a8a;"></i>
						<p style="margin: 0;">상품준비중</p>
						<p style="font-size: 10px;">판매자가 발송할상품을 준비중입니다.</p>
					</div>
					<div class="or_guide_right">
						<i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>					
					</div>
					<div class="or_guide_img">
						<i class="fa-solid fa-gift" style="color: #8a8a8a;"></i>
						<p style="margin: 0;">배송시작</p>
						<p style="font-size: 10px;">상품준비가 완료되어곧 배송될 예정입니다.</p>
					</div>
					<div class="or_guide_right">
						<i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>					
					</div>
					<div class="or_guide_img">
						<i class="fa-solid fa-truck" style="color: #8a8a8a;"></i>
						<p style="margin: 0;">배송중</p>
						<p style="font-size: 10px;">상품이 고객님께 배송중입니다.</p>
					</div>
					<div class="or_guide_right">
						<i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>					
					</div>
					<div class="or_guide_img">
						<i class="fa-solid fa-truck-ramp-box" style="color: #8a8a8a;"></i>
						<p style="margin: 0;">배송완료</p>
						<p style="font-size: 10px;">상품이 주문자에게 전달완료되었습니다.</p>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
</div>