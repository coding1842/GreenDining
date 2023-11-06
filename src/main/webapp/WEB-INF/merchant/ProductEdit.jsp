<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스마트 스토어 상품 수정</title>
<script src="/jquery/jquery-3.7.0.min.js"></script>
<script src="/js/ProductEdit.js"></script>
<link rel="stylesheet" href="/css/ProductEdit.css">
</head>
<body>
<div id="product_all">
	<a href="#" id="product_top">상품수정</a>
	<div id="product_box">
		<form action="#" method="post" enctype="mutipart/form-data" autocomplete="off">
			<table id="product_table">
<!-- 				<tr> -->
<!-- 					<th>상품 유형</th> -->
<!-- 					<td> -->
<!-- 						<input type="text" readonly="readonly" value="$product.type"> -->
<!-- 					</td> -->
<!-- 				</tr> -->
				<tr>
					<th>상품명</th>
					<td><input type="text" value="$product.name"></td>
				</tr>
				<tr>
					<th>상품 타입</th>
					<td>
						<input type="radio" id="product_type_main" name="product_type">
						<label for="product_type_main">메인 상품</label>
						<input type="radio" id="product_type_sub" name="product_type">
						<label for="product_type_sub">부가 상품</label>
					</td>
				</tr>
				<tr>
					<th>판매가</th>
					<td><input type="text" value="$product.price"></td>
				</tr>
				<tr>
					<th>무게</th>
					<td>
						<input type="text" placeholder="숫자만 입력">&nbsp;kg
						<br>
						<small>*(순수 상품무게만 포함입니다.)</small>
					</td>
				</tr>
<!-- 				<tr> -->
<!-- 					<th>할인</th> -->
<!-- 					<td> -->
<!-- 						<div> -->
<!-- 							<input type="radio" id="discount_setting" name="discount"> -->
<!-- 							<label for="discount_setting">설정함</label>	 -->
<!-- 							<input type="radio" id="notdiscount_setting" name="discount"> -->
<!-- 							<label for="notdiscount_setting">설정안함</label>	 -->
<!-- 						</div> -->
<!-- 						<div id="discount_rate" style="display: none;"> -->
<!-- 							<input type="text" value="$product.discount">&nbsp;% -->
<!-- 							<hr id="discount_bar"> -->
<!-- 						</div> -->
<!-- 						<div id="discount_total" style="display: none"> -->
<!-- 							<input type="text" value="$product.price_total">&nbsp;원(총 금액) -->
<!-- 						</div> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th>판매기간</th> -->
<!-- 					<td> -->
<!-- 						<input type="datetime-local">&nbsp;까지 -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th>부가세</th> -->
<!-- 					<td> -->
<!-- 						<div> -->
<!-- 							<input type="radio" id="product_tax" name="tax"> -->
<!-- 							<label for="product_tax">과세 상품</label> -->
<!-- 							<input type="radio"  id="product_zero" name="tax"> -->
<!-- 							<label for="product_zero">면세 상품</label> -->
<!-- 							<input type="radio"  id="product_exemption" name="tax"> -->
<!-- 							<label for="product_exemption">영세 상품</label> -->
<!-- 						</div> -->
<!-- 						<div> -->
<!-- 							<small id="product_a" style="display: none;">과세상품은 10%적용 됩니다.</small> -->
<!-- 							<small id="product_b" style="display: none;">미가공 농,축,수,<br>임산물(쌀, 고기, 채소 등)이 있습니다.</small>						 -->
<!-- 							<small id="product_c" style="display: none;">영세상품은 특정 재화나<br> 용역에 세율이 제로입니다.</small> -->
<!-- 						</div> -->
<!-- 					</td> -->
<!-- 				</tr> -->
				<tr>
					<th>재고수량</th>
					<td>
						<input type="text" value="$product.stock">&nbsp;개
					</td>
				</tr>
				<tr>
					<!-- 메인페이지에서 제일먼저 보이는 사진 한장 -->
					<th>상품 대표 이미지</th>
					<td>
						<input type="file">
						<br>
						<small>*(하나만 선택 가능합니다.)</small>
					</td>
				</tr>
<!-- 				<tr> -->
<!-- 					상품 디테일에서 보이는 내부 사진 -->
<!-- 					<th>상품 설명 이미지</th> -->
<!-- 					<td> -->
<!-- 						<input type="file" multiple> -->
<!-- 						<br> -->
<!-- 						<small>*(여러개 선택 가능합니다.)</small> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th>상품설명</th> -->
<!-- 					<td> -->
<!-- 						<textarea id="product_textarea">$product.textarea</textarea> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
					<th>상품 상태</th>
					<td>
						<div>
							<input type="radio" id="product_ready" name="product_status">
							<label for="product_ready">준비중</label>
							<input type="radio"  id="product_sale" name="product_status">
							<label for="product_sale">판매중</label>
							<input type="radio"  id="product_end" name="product_status">
							<label for="product_end">판매종료</label>
						</div>
					</td>
				</tr>
				<tr>
					<th class="product_puch_space"></th>
					<td class="product_puch_space">
						<button type="reset" id="product_reset">초기화</button>
						<input type="button" id="product_push" value="상품 수정하기">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>