<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/jquery/jquery-3.7.0.min.js"></script>
<script src="/js/zipCheck.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>배송 관련 테스트 폼</title>
</head>
<body>
	<div id="green-delivery">
		<h2 style="text-align: center;">배송 관련 폼 테스트</h2>
		<form action="user/address" name="deliveryForm1" enctype="mutipart/form-data" method="post">
			<table>	
				<input type="hidden" name="user_id" value="${ssKey.id}" class="add">	
				<tr>
					<th>별칭</th>
					<td>
					<input type="text" name="name" class="add" value="${ssKey.name}">
					</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td style="display: flex;">
						<input type="text" name="zipcode" class="add" value="${ssKey.zipcode}" readonly="readonly"
							id="sample6_postcode" placeholder="우편번호를 검색하세요." title="우편번호">
						<button type="button" onclick="zipCheck()" class="add"
							style="background-color: white; border: 1px solid #ced4da; width: 150px;">우편번호 찾기</button>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="address" class="add" value="${ssKey.address}" readonly="readonly"
							id="sample6_address" placeholder="주소" title="주소">
						<input type="text" name="address2" value="${ssKey.address2}"
							id="sample6_detailAddress" class="add" placeholder="상세주소" title="상세주소">
						<input type="hidden"
							id="sample6_extraAddress" class="add" title="참고항목">
					</td>
				</tr>
				<tr>
					<th>배송옵션</th>
					<td>
						<select name="request_option" value="${ssKey.request_option}">
							<option selected="selected">선택</option>
							<option>문 앞</option>
							<option>직접 받고 부재 시 문 앞</option>
							<option>경비실</option>
							<option>택배함</option>
							<option>기타사항</option>
						</select>
						<br>
						<textarea rows="5" cols="8" name="request_text" value="${ssKey.request_text}" style="resize: none;"
							placeholder="기타 사항 및 공동현관 출입번호를 입력해주세요."></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" id="addSubmit">주소 등록</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>