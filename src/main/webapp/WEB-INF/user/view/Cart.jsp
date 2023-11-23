<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<script src="/jquery/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="/css/Cart.css" />
<script type="text/javascript" src="/js/user/Cart.js">

</script>
<div id="my_cart_box">
	<c:choose>
		<c:when test="${fn:length(cartDTOList) > 0}">
		<c:forEach var="cart" items="${cartDTOList}" varStatus="index">
			<form  id="cartForm" action="" method="post" enctype="multipart/form-data" autocomplete="off">
				<div class="my_cart_top">
					<div>
						<input type="checkbox" checked="checked">전체선택
					</div>
						<button>선택 취소</button>
				</div>
				<input type="hidden" name="user_id" value="${ssKey.id}">
				<input type="hidden" name="product_id" value="${cart.product_id}">
				<input type="hidden" name="sale_id" value="${cart.sale_id}">
				<div class="my_cart_it">
					<div class="my_cart_title" style="width:500px;">
						<p style="">${cart.title}</p>
					</div>
					<div class="my_cart_middle">
						<div class="cart_middle_1">
							<input type="checkbox" style="zoom:1.4;" checked="checked">
							
							<div>
								<a href="/item/${cart.sale_id}"><img src="${cart.image_path}" style="width: 80px; height: 80px; margin-left: 10px;"></a>
							</div>
							<div class="cart_detail" style="height: 109px;">
								<p class="ps1">상품명 : ${cart.name}</p>
								<p class="ps2">상품단가 : ${cart.price} 원  &nbsp;//&nbsp;
								 주문수량 : <input type="text" name="quantity"  value="${cart.quantity}" size="3" style="text-align: center;">
									<input type="button" value="수정" class="update_cart">&nbsp;/&nbsp;
				                    <input type="button" value="삭제" class="delete_cart">
								</p>
								<p class="ps3">${cart.store_name} | 스마트스토어</p>
							</div>
							
						</div>
					</div>
						<div class="cart_middle_2">
<%-- 							${cart.quantity}; --%>
						</div>
						<div>
						</div>
					<div class="my_cart_under">
						<div class="cart_pc1">
							<span>선택상품금액</span><span>${cart.price * cart.quantity}원</span>
						</div>
						<div class="cart_pc1">
							<span>할인금액</span><span style="color: red;">- ${cart.price * cart.discount / 100 * cart.quantity}원</span>
						</div>
						<div class="cart_pc2">
							<span>주문금액</span><span>${cart.price * cart.quantity - (cart.price * cart.discount / 100 * cart.quantity)}원</span>
						</div>
					</div>
					<button>주문하기</button>
				</div>
			</form>	
			</c:forEach>
		</c:when>
		<c:when test="${fn:length(cartDTOList) == 0}">
			<p>장바구니에 등록된 상품이 없습니다.</p>
		</c:when>
	</c:choose>
</div>


