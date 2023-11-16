<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/jquery/jquery-3.7.0.min.js"></script>
<script src="/js/zipCheck.js"></script>
<script src="/js/user/Address.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>배송 관련 테스트 폼</title>
</head>
<body>
<div style="text-align: center;">
	<div id="green-delivery" style="width: 700px; display: inline-block;">
		<h2 style="text-align: center;">배송 관련 폼 테스트</h2>
		
		<c:choose>
			<c:when test="${fn:length(addressDTOList) > 0}">
			
				<c:forEach var="address" items="${addressDTOList}" varStatus="index" >
				<form action="" name="addressForm" method="post">
					<table style="margin-bottom: 30px;">	
						<input type="hidden" name="user_id" value="${ssKey.id}">
						<input type="hidden" name="id" value="${address.id}">
						<tr>
							<th>별칭</th>
							<td>
							<input type="text" name="name" value="${address.name}">
							</td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td style="display: flex;">
								<input type="text" name="zipcode"  value="${address.zipcode}" readonly="readonly"
									id="sample6_postcode" placeholder="우편번호를 검색하세요." title="우편번호">
								<button type="button" onclick="zipCheck()"
									style="background-color: white; border: 1px solid #ced4da; width: 150px;">우편번호 찾기</button>
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="text" name="address" value="${address.address}" readonly="readonly"
									id="sample6_address" placeholder="주소" title="주소">
								<input type="text" name="address2" value="${address.address2}"
									id="sample6_detailAddress" placeholder="상세주소" title="상세주소">
								<input type="hidden"
									id="sample6_extraAddress" title="참고항목">
							</td>
						</tr>
						<tr>
							<th>배송옵션</th>
							<td>
								<select name="request_option" value="${address.request_option}" style="float: left;">
									<option value="문 앞" <c:if test="${address.request_option eq '문 앞'}">selected</c:if>>문 앞</option>
									<option value="직접 받고 부재 시 문 앞" <c:if test="${address.request_option eq '직접 받고 부재 시 문 앞'}">selected</c:if>>직접 받고 부재 시 문 앞</option>
									<option value="경비실" <c:if test="${address.request_option eq '경비실'}">selected</c:if>>경비실</option>
									<option value="택배함" <c:if test="${address.request_option eq '택배함'}">selected</c:if>>택배함</option>
									<option value="기타사항" <c:if test="${address.request_option eq '기타사항'}">selected</c:if>>기타사항</option>
								</select>
								<br>
								<textarea rows="5" cols="8" name="request_text" value="${address.request_text}" style="resize: none;"
									placeholder="기타 사항 및 공동현관 출입번호를 입력해주세요.">${address.request_text}</textarea>
							</td>
						</tr>
					</table>
					<div style="text-align: center;">
						<div style="display: inline-block;">
							<button onclick="controlAddress(this,'update')" id="updateAddress"
									type="button" style="border: 1px solid #eaeaea;
									background-color: white; width: 150px; font-size: 20px; margin-bottom: 20px;">주소 수정하기</button>
							<button onclick="controlAddress(this,'delete')" id="deleteAddress"
							type="button" style="border: 1px solid #eaeaea;
							background-color: white; width: 150px; font-size: 20px; margin-bottom: 20px;">주소 삭제하기</button>
						</div>
					</div>
					</form>
					
					<hr style="margin-bottom: 30px" />
				</c:forEach>
			</c:when>
			<c:when test="${fn:length(addressDTOList)==0}">
				<p style="text-align: center; padding-top: 30px;">등록된 주소정보가 없습니다.</p>
			</c:when>
		</c:choose>
		<div style="text-align: center;">
		<div style="display: inline-block;">
				<button onclick="location.href='/user/address'" type="button" style="border: 1px solid #eaeaea;
						background-color: white; width: 150px; font-size: 20px; margin-top: 20px;">주소 등록하기</button>
		</div>
		</div>
	</div>
</div>
</body>
</html>