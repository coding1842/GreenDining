<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/smartstore/SaleForm.css">
<script src="/jquery/jquery-3.7.0.min.js"></script>
<script src="/js/smartstore/DMLProductForm.js"></script>
</head>
<meta charset="UTF-8">
<title>상품 판매 등록</title>
</head>
<body>
	<div id="sale-wrap">
	<h2 style="text-align: center; padding: 10px 0;">상품 판매 등록</h2>
		<form action="#" method="get">
			<table>
				<tr>
					<th>제목</th>
					<td>상품 판매 제목</td>
				</tr>
				<tr>
					<th>상품 유형</th>
					<td>
						<select>
							<option selected="selected">선택</option>
							<option value="농산물">농산물</option>
							<option value="수산물">수산물</option>
							<option value="축산물">축산물</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>상세 설명</th>
					<td>
						<textarea rows="5" cols="30" placeholder="상품설명을 작성해주세요."></textarea>
					</td>
				</tr>
				<tr>
					<th>상태</th>
					<td class="sale_flex">
						<label class="sale-type-label"><input type="radio" name="insert-sale-type"><span>판매 대기</span></label>
						<label class="sale-type-label"><input type="radio" name="insert-sale-type"><span>판매중</span></label>
						<label class="sale-type-label"><input type="radio" name="insert-sale-type"><span>판매 종료</span></label>
					</td>
				</tr>
				<tr>
					<th>무게</th>
					<td>
					  <span>10</span>&nbsp;kg
					  <br />
					  <small>*(순수 상품무게만 포함입니다.)</small>
					</td>
            	</tr>
            	<tr>
					<th>재고수량</th>
					<td>
						<span>30</span>&nbsp;개
					</td>
				</tr>
				<tr>
					<th>할인</th>
					<td>
						<div class="sale_flex">
							<input type="radio" id="sale-discount-yes" class="discount-public" name="sale-discount">
							<label for="sale-discount-yes" class="discount-public"><span>설정함</span></label>	
							<input type="radio" id="sale-discount-none" class="discount-public" name="sale-discount" checked="checked">
							<label for="sale-discount-none" class="discount-public"><span>설정안함</span></label>	
						</div>
						<div id="sale-discount-text" style="display: none;">
						<br>
							<input type="text" placeholder="숫자만 입력" class="sale-discount-text">&nbsp;%
						</div>
						<div id="sale-discount-total" style="display: none">
						<br>
							<input type="text" placeholder="총 금액" class="sale-discount-text">&nbsp;원(총 금액)
						</div>
					</td>
				</tr>
				<tr>
					<th>판매 시작시간</th>
					<td>
						<input type="datetime-local" class="datetime">
					</td>
				</tr>
				<tr>
					<th>판매 종료시간</th>
					<td>
						<input type="datetime-local" class="datetime">
					</td>
				</tr>
				<tr>
  					<th>상품 설명 이미지</th>
  					<td>
  						<input type="file" multiple>
  						<br>
  						<small>*(여러개 선택 가능합니다.)</small>
  					</td>
  				</tr>
			</table>
			<div class="sale_flex" id="submit-data-div">
				<input type="button" value="등록하기" class="submit-data">
			</div>
		</form>
	</div>
</body>
</html>