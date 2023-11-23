<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<script src="/jquery/jquery-3.7.0.min.js"></script>
<script src="/js/smartstore/view/SaleItemDetail.js"></script>
<script src="/js/user/OrderPaymentForm.js"></script>
<meta charset="UTF-8">
<title>주문/결제폼</title>
</head>
<body>
<h2 style="border-bottom: solid 2px black; padding-bottom: 8px;">주문/결제</h2>
<section>
<form action="/order/add" method="post">
	<!-- 구매자정보 -->
	<div><br>
		<h4>구매자정보</h4>
		<form action="" method="get">
		<c:forEach var="user" items="${selectUser}">
			<table>
				<tr>
					<th style="border: solid 1px #ddd;">이름</th>
					<td>${user.name}</td>
				</tr>
				<tr>
					<th style="border: solid 1px #ddd;">이메일</th>
					<td>${uesr.email}</td>
				</tr>
				<tr>
					<th style="border: solid 1px #ddd;">휴대폰 번호</th>
					<td>${user.phone}</td>
				</tr>	
			</table>
		</c:forEach>
		</form>
	</div><br>
	<!-- 받는사람정보 -->
	<div>
		<div style="    display: flex;
					    padding-bottom: 10px;
					    gap: 30px;">
			<h4 style="margin: 0;">받는사람정보</h4>
			<button type="button" onclick="location.href='/user/address/list'" style="margin-bottom: 4px;">배송지변경</button>
		</div>
		<form action="" method="post">
			<table style="border: solid 1px #eeeeee	">
				<tr>
					<th style="border: solid 1px #ddd;">이름</th>
					<td>${user.name}</td>
				</tr>
				<tr>
					<th style="border: solid 1px #ddd;">이메일</th>
					<td>${user.email}</td>
				</tr>
				<tr>
					<th style="border: solid 1px #ddd;">휴대폰 번호</th>
					<td>${user.phone}</td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 결제정보 -->
	<div><br>
		<h4>결제정보</h4>
		<form action="" method="post">
			<table>
			<c:forEach var="cart" items="${cartDTOList}">
				<tr>
					<th style="border: solid 1px #ddd;">총상품가격</th>
					<td>${cart.total_price}&nbsp;원</td>
				</tr>
				<tr>
					<th style="border: solid 1px #ddd;">즉시할인</th>
					<td>-${cart.discount}&nbsp;원</td>
				</tr>
				<tr>
					<th style="border: solid 1px #ddd;">배송비</th>
					<td>-2,500&nbsp;원</td>
				</tr>
				<tr>
					<th style="border: solid 1px #ddd;">총결제금액</th>
					<td>${cart.total_price}-${cart.after_price}&nbsp;원</td>
				</tr>
			</c:forEach>	
				<tr>
					<th style="border: solid 1px #ddd;">결제방법</th>
					<td>		
						<div class="form-check form-check-inline">
						  <input class="form-check-input" name="payRadio" type="radio" id="inlineCheckbox1" value="option1" checked>
						  <label class="form-check-label" for="inlineCheckbox1" id="btnradio1">포인트머니</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" name="payRadio" type="radio" id="inlineCheckbox2" value="option2">
						  <label class="form-check-label" for="inlineCheckbox2" id="btnradio2">신용/체크카드</label>
						</div>
						<div class="form-check form-check-inline">
						  <input class="form-check-input" name="payRadio" type="radio" id="inlineCheckbox3" value="option3">
						  <label class="form-check-label" for="inlineCheckbox3" id="btnradio3">무통장입금(가상계좌)</label>
						</div><br><br>
						<!-- 포인트머니 -->	
						<div id="1">
							<h5>포인트머니</h5>
							<p>보유 포인트머니 : *&nbsp;원</p>
							<div class="input-group has-validation">
								<span class="input-group-text">사용</span>
								<div class="form-floating is-invalid">
						    		<input type="text" class="form-control is-invalid" id="floatingInputGroup2" placeholder="Username" required>
									<label for="floatingInputGroup2">0원</label>
								</div>
								<div class="invalid-feedback">
									사용할 포인트머니를 입력하세요
								</div>
							</div>
						</div>
						<!-- 신용/체크카드 -->
						<div id="2" style="display: none;">
							<h5>신용/체크카드</h5>
							<div>
								<ul>
									<li>카드선택</li>
									<li>할부기간</li>
								</ul>
							</div>
						</div>
						<!-- 무통장입금 -->
						<div id="3" style="display: none;">
							<h5>무통장입금</h5>
							<select class="form-select" aria-label="Default select example">
							  <option selected>은행선택</option>
							  <option value="1">농협</option>
							  <option value="2">국민은행</option>
							  <option value="4">신한은행</option>
							  <option value="5">우리은행</option>
							  <option value="6">기업은행</option>
							  <option value="7">하나은행</option>
							  <option value="8">대구은행</option>
							  <option value="9">부산은행</option>
							</select>
							<br>
							<h5>환불방법</h5>
							<div class="form-check">
							  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
							  <label class="form-check-label" for="flexRadioDefault1">
							    본인계좌환불
							  </label>
							  <div class="input-group has-validation">
								<span class="input-group-text">환불계좌입력</span>
								<div class="form-floating is-invalid">
						    		<input type="text" class="form-control is-invalid" id="floatingInputGroup2" placeholder="Username" required>
									<label for="floatingInputGroup2">'-'를 제외하고 입력하세요</label>
								</div>
								<div class="invalid-feedback">
									계좌번호를 확인하고 기입해주세요
								</div>
							</div>
							</div>
							<br>
							<div class="form-check">
							  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
							  <label class="form-check-label" for="flexRadioDefault2">
							    환불정산액 적립
							  </label>
							</div>
						</div>
					</td>
				</tr>	
			</table>
			<br><br>
			<div class="d-grid gap-2 col-6 mx-auto">
			  <button class="btn btn-primary" id="order_add" onclick="location.href='/order/list'" type="submit" style="height: 65px;">결제하기</button>
			</div>
		</form>
	</div><br>
</form>
</section>
</body>
</html>