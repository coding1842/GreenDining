<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<script src="/jquery/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="/css/Cart.css" />
<script type="text/javascript" src="/js/user/Cart.js"></script>
<div id="my_cart_box">
	<div class="all_check_input_div">
		<input id="all_check_input" type="checkbox" checked="checked"><span class="all_chceck_span">전체선택</span>
	</div>
	<c:choose>
		<c:when test="${fn:length(cartDTOList) > 0}">
		<c:forEach var="cart" items="${cartDTOList}" varStatus="index">
			<form  id="cartForm" action="" method="post" enctype="multipart/form-data" autocomplete="off">
				
				<div class="my_cart_it">
					<div class="my_cart_title" style="width:500px;">
						<p style="">${cart.title}</p>
					</div>
					<div class="my_cart_middle">
						<div class="cart_middle_1" style="margin-top: 20px;">
								<div class="cart_info">
									<input name="check_box" class="individual_cart_checkbox" type="checkbox" style="zoom:1.4;" checked>
									<input type="hidden" class="individual_product_price" value="${cart.price * cart.quantity}">
									<input type="hidden" class="individual_product_discount" value="${cart.price * cart.discount / 100 * cart.quantity}">
									<input type="hidden" class="individual_order_price" value="${cart.price * cart.quantity - (cart.price * cart.discount / 100 * cart.quantity)}">
								</div>		
							<div>
								<a href="/item/${cart.sale_id}"><img src="${cart.image_path}" style="width: 90px; height: 90px; margin-left: 10px;"></a>
							</div>
							<div class="cart_detail" style="height: 109px;">
								<p class="ps1">상품명 : ${cart.name}</p>
								<p class="ps2">상품단가 : ${cart.price} 원  &nbsp;//&nbsp;
								 주문수량 : <input type="number" name="quantity"  value="${cart.quantity}" 
								 min="1" style="text-align: center; width: 80px;" class="input_number">
									<input type="button" value="수정" class="update_cart">&nbsp;/&nbsp;
				                    <input type="button" value="삭제" class="delete_cart">
								</p>
								<p class="ps3">${cart.store_name} | 스마트스토어</p>
							</div>
							
						</div>
					</div>
						<div class="my_cart_top">
					<input type="hidden" name="user_id" value="${ssKey.id}">
					<input type="hidden" name="product_id" value="${cart.product_id}">
					<input type="hidden" name="sale_id" value="${cart.sale_id}">
					<input type="hidden" name="store_name" value="${cart.store_name}">
					<input type="hidden" name="quantity" value="${cart.quantity}">
					<input type="hidden" name="name" value="${cart.name}">
					<input type="hidden" name="process_before_price" value="${cart.price}">
					<input type="hidden" name="process_after_price" value="${cart.price * (1-cart.discount/100)}">
				</div>
						<div>
						</div>
					<div class="my_cart_under">
						<div class="cart_pc1">
							<c:set var="productPrice" value="${cart.price * cart.quantity}" />
							<span>선택상품금액</span><span><fmt:formatNumber value="${productPrice}" pattern="#,##0" />원</span>
						</div>
						<div class="cart_pc1">
							<c:set var="discountPrice" value="${cart.price * cart.discount / 100 * cart.quantity}" />
							<span>할인 금액</span><span style="color: red;"><fmt:formatNumber value="${discountPrice}" pattern="#,##0" />원</span>
						</div> 
						<div class="cart_pc2">
							<c:set var="orderPrice" value="${cart.price * cart.quantity - (cart.price * cart.discount / 100 * cart.quantity)}" />
							<span>주문 금액</span><span><fmt:formatNumber value="${orderPrice}" pattern="#,##0" />원</span>
						</div>
					</div>
					<!-- <button>주문하기</button> -->
				</div>
			</form>	
			</c:forEach>
		</c:when>
		<c:when test="${fn:length(cartDTOList) == 0}">
			<p>장바구니에 등록된 상품이 없습니다.</p>
		</c:when>
	</c:choose>
		<div class="" style="height: 70px; text-align: right; margin-bottom: 20px;">
			<span>총 상품금액 :</span>
			<span style="font-size: larger;" class="product_price_span"></span>			
			<span> 원</span>
			<span> - </span>
			<span>총 할인금액 :</span>
			<span style="font-size: larger;" class="product_discount_span"></span>
			<span>원</span>
			<div style="background-color: #DBEEFB;">
				<span>총 결제금액 = </span>
				<span style="font-size: larger;" class="order_price_span">총 결제금액</span>
				<span>원</span>
			</div>
		</div>
		<div class="d-grid gap-2 col-6 mx-auto">
			<button id="cartOrder">구매하기</button>
			<button>계속 쇼핑하기</button>
		</div>
</div>

