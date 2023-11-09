<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/user/ReturnProductForm.css">
<script src="/jquery/jquery-3.7.0.min.js"></script>
<script src="/js/user/ReturnProductForm.js"></script>
<title>교환 환불 페이지</title>
</head>
<body>
	<!-- bundle.css 해당 css부분 전체 삭제함 -->
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
						<div id="product_return_check_textarea">
							<textarea rows="5" cols="30"></textarea>
						</div>
					<div>
						<input type="text" value="총 갯수" style="width: 65px;">
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
							<div id="product_return_problem_textarea">
								<textarea rows="5" cols="45"
									placeholder=" * 필수입력 대신 배송 온 상품을 입력해주세요."></textarea>
							</div>
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
							<button type="button" class="product_return_problem_next">이전 단계 ></button>
							<button type="button" class="product_return_problem_next">다음 단계 ></button>
						</div>
					</div>
				</div>
				
				<!-- 해결방법 선택 start -->
				<div id="product_return_solution" class="product_return_block" style="display: none;">
					<div id="product_return_solution_data_box">
						<div class="d-flex align-items-center pt-3 mb-3">
							<div id="return_box_left">
								<img alt="샘플이미지" src="https://via.placeholder.com/100">
							</div>
							<div id="return_box_right" class="d-flex flex-column w-75 text-start">
								<p class="m-0">상품명 어쩌구 저쩌구</p>
								<p class="m-0 fs-14px mt-2 text-secondary"><span id="return_total">1개</span> <span id="return_price">25,120</span><span class="fw-bold fs-16px">원</span></p>
							<hr>
							</div>
						</div>
					
						<div id="return_reason" class="mt-3 mb-3 ms-3">
							<h5>선택한 이유</h5>
							<p class="fs-14px">다른 상품이 배송됨</p>
						</div>
					</div>
				
					<div id="product_return_solution_data_box_second">
						<div class="product_return_solution_product_select_h3 p-3">
							<h3>어떤 해결방법을 원하세요?</h3>
							<div id="product_return_solution_data_box" class="mt-3">
								<label><input type="radio" name="33"> 교환</label>
								<hr class="my-3">
								<label><input type="radio" name="33"> 반품 후 환불</label>
							</div>
						</div>
						
						<br>
						<button type="button" class="product_return_solution_next">< 이전 단계</button>
						<button type="button" class="product_return_solution_next">신청하기</button>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
</body>
</html>