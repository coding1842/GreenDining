<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/ProductReturn.css">
<script src="/jquery/jquery-3.7.0.min.js"></script>
<script src="/js/ProductReturn.js"></script>
<title>교환 환불 페이지</title>
</head>
<body >
	<div id="product_return_first">
		<h2 style="text-align: left; margin-bottom: 20px;">교환, 반품 신청</h2>
		<form action="#" method="post" enctype="mutipart/form-data" autocomplete="off">
		<div>
			<div id="product_return_second">
				<ol id="product_return_ol">
					<li id="product_return_choice1" class="product_return_choice"><a href="#">①상품 선택</a></li>&nbsp;
					<span>ㅡ</span>&nbsp;
					<li id="product_return_choice2" class="product_return_choice"><a href="#">②사유 선택</a></li>&nbsp;
					<span>ㅡ</span>&nbsp;
					<li id="product_return_choice3" class="product_return_choice"><a href="#">③해결방법 선택</a></li>
				</ol>
			</div>
			<!-- 상품 선택 start -->
			<div id="product_return_check_div">
				<div id="product_return_check" class="product_return_block">
					<div class="product_return_check_product_select_h3">
						<h3>상품을 선택해 주세요</h3>
					</div>
					<div id="product_return_check_data_box">
						<input type="checkbox" class="product_return_checkbox">
						<div id="product_return_check_check_img">
							<img alt="샘플이미지" src="https://via.placeholder.com/100">
						</div>
						<textarea id="product_return_check_textarea" rows="5" cols="40"></textarea>
						<br>
						<div style="text-align: right; margin-right: 105px; margin-top: -10px;">
							<input type="text" value="총 갯수" style="width: 45px;">
						</div>
					</div>
						<button type="button" id="product_return_check_next">다음 단계 ></button>
				</div>	
					<!-- 사유 선택 start -->
				<div id="product_return_problem" class="product_return_block" style="display: none;">
					<div class="product_return_check_product_select_h3">
						<h3>어떤 문제가 있나요?</h3>
					</div>
					<div id="product_return_problem_data_box">
						<div>
							<p>단순 변심</p>
							<input type="radio" id="1" name="11">
							<label for="1">상품이 마음에 들지 않음</label>
							<hr>
							<input type="radio" id="2" name="11">
							<label for="2">더 저렴한 상품을 발견함</label>
						</div>
						<div>
							<p>배송문제</p>
							<input type="radio" id="22" name="11">
							<label for="22">더 저렴한 상품을 발견함</label>
							<br>
							<textarea id="product_return_problem_textarea" rows="5" cols="40"
								placeholder="* 필수입력 대신 배송 온 상품을 입력해주세요."></textarea>
						</div>
						<div>
							<p>상품문제</p>
							<input type="radio" id="3" name="22">
							<label for="3">상품의 구성품 / 부속품이 들어있지 않음</label>
							<hr>
							<input type="radio" id="4" name="22">
							<label for="4">상품이 설명과 다름</label>
							<hr>
							<input type="radio" id="5" name="22">
							<label for="5">상품이 파손되어 배송됨</label>
						</div>
						<div>
							<button type="button" id="product_return_problem_next">다음 단계 ></button>
						</div>
					</div>
				</div>
					<!-- 해결방법 선택 start -->
				<div id="product_return_solution" class="product_return_block" style="display: none;">
					<div class="product_return_solution_product_select_h3">
						<h3>어떤 해결방법을 원하세요?</h3>
					</div>
					<div id="product_return_solution_data_box">
						<div id="product_return_solution_check_img">
							<img alt="샘플이미지" src="https://via.placeholder.com/100">
						</div>
						<textarea id="product_return_solution_textarea" rows="5" cols="40"></textarea>
						<br>
						<div style="text-align: right; margin-right: 105px; margin-top: -10px;">
							<input type="text" value="총 갯수" style="width: 45px;">
						</div>
						<hr>
						<input type="text" value="선택한 이유">
						<br>
						<input type="text" value="다른 상품이 배송됨">
					</div>
						<div class="product_return_solution_product_select_h3">
							<h3>어떤 해결방법을 원하세요?</h3>
						</div>
						<input type="radio" id="6" name="33">
						<label for="6">교한</label>
						<hr>
						<input type="radio" id="7" name="33">
						<label for="7">반품 후 환불</label>
						<br>
						<button type="button" class="product_return_solution_next">< 이전 단계</button>
						<button type="button" class="product_return_solution_next">신청하기</button>
				</div>
			</div>
		</div>
		</form>
	</div>
</body>
</html>