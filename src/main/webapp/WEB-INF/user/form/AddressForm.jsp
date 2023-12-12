<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/jquery/jquery-3.7.0.min.js"></script>
<script src="/js/zipCheck.js"></script>
<script src="/js/user/Address.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
</script>
<title>배송 관련 테스트 폼</title>
</head>
<body>
<div style="text-align: center;">
	<div id="green-delivery" style="width: 700px; display: inline-block;">
		<div>
		<h2 style="text-align: center;">배송 관련 폼 테스트</h2>
		<form action="/address/insert" name="addressForm" enctype="multipart/form-data" method="post" onsubmit="return validate()">
			<table>	
				<input type="hidden" name="user_id" value="${ssKey.id}">	
				<tr>
					<th>별칭</th>
					<td>
					<input type="text" name="name" class="addressChk" title="별칭">
					</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td style="display: flex;">
						<input type="text" name="zipcode" class="addressChk" readonly="readonly"
							id="sample6_postcode" placeholder="우편번호를 검색하세요." title="우편번호">
						<button type="button" onclick="zipCheck()"
							style="background-color: white; border: 1px solid #ced4da; width: 150px;">우편번호 찾기</button>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="address" class="addressChk" readonly="readonly"
							id="sample6_address" placeholder="주소" title="주소">
						<input type="text" name="address2"
							id="sample6_detailAddress" class="addressChk" placeholder="상세주소" title="상세주소">
						<input type="hidden"
							id="sample6_extraAddress" title="참고항목">
					</td>
				</tr>
				<tr>
					<th>배송옵션</th>
					<td>
						<select name="request_option" class="addressChk" title="배송옵션" style="float: left;">
							<option selected="selected" title="배송옵션">선택</option>
							<option value="문 앞">문 앞</option>
							<option value="직접 받고 부재 시 문 앞">직접 받고 부재 시 문 앞</option>
							<option value="경비실">경비실</option>
							<option value="택배함">택배함</option>
							<option value="기타사항">기타사항</option>
						</select>
						<br>
						<textarea rows="5" cols="8" name="request_text" style="resize: none;"
							placeholder="기타 사항 및 공동현관 출입번호를 입력해주세요."></textarea>
					</td>
				</tr>
				</tr>
			</table>
			</div>
			<div style="text-align: center;">
				<div style="display: inline-block;">
					<button type="reset" style=" border: 1px solid #eaeaea; background-color: white;
						text-align: center; font-size: 20px; margin: 0 30px 30px 0;">다시 쓰기</button>
					<button type="submit" style=" border: 1px solid #eaeaea; background-color: white;
						text-align: center; font-size: 20px; margin-top: 30px;">주소 등록</button>
				</div>
			</div>
		</form>
	</div>
	</div>
</body>

</html>