<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정하기</title>
<link rel="stylesheet" href="/css/QnaWriteForm.css" />
<link rel="stylesheet" href="/css/user/Review.css" />
<script src="/js/imgur/ImgurManagement.js"></script>
<script>
	var reviewStar = ${review.star};

    window.onload = function() {
        var starInputs = document.getElementsByName("star");
        for(var i = 0; i < starInputs.length; i++) {
            if(starInputs[i].value == reviewStar) {
                starInputs[i].checked = true;
            }
        }
    }
</script>
</head>
<body>
<div style="text-align: center;">
	<div style="width: 800px; display: inline-block;">
	<form action="/review/update" id="ajaxForm" enctype="multipart/form-data" method="post">
		<table>
			<thead>
				<tr>
					<th colspan="2">리뷰 수정</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="col1">리뷰 번호</td>
					<td class="col2">
						<input type="text" name="id" value="${review.id}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td class="col1">별점</td>
					<td class="col2">
<%-- 						<input type="text" name="star" value="${review.star}"> --%>
						<div class="mb-3" name="myform" id="myform" method="post">
							<fieldset id='star-rating' class='rating'>
								<span class="text-bold">별점을 선택해주세요</span>
								<input type="radio" name="star" value="5" id="rate1" class="rate_radio">
								<label for="rate1">★</label>
								
								<input type="radio" name="star" value="4" id="rate2" class="rate_radio">
								<label for="rate2">★</label>
								
								<input type="radio" name="star" value="3" id="rate3" class="rate_radio">
								<label for="rate3">★</label>
								
								<input type="radio" name="star" value="2" id="rate4" class="rate_radio">
								<label for="rate4">★</label>
								
								<input type="radio" name="star" value="1" id="rate5" class="rate_radio">
								<label for="rate5">★</label>
							</fieldset>
						</div>
					</td>
				</tr>
				<tr>
					<td class="col1">제목</td>
					<td class="col2">
						<input type="text" name="title" value="${review.title}">
<%-- 						<input type="text" name="title" value="${reviewDTO.title}"> --%>
					</td> 
				</tr>
<!-- 				<tr> -->
<!-- 					<td class="col1">작성자</td> -->
<!-- 					<td class="col2"> -->
						<input type="hidden" name="user_id" value="${ssKey.id}">
						<input type="hidden" name="test_user_id" value="${user_id}">
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<%-- 					<input type="hidden" name="product_id" value="${product_id}"> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<%-- 					<input type="hidden" name="order_id" value="${order_id}"> --%>
<!-- 				</tr> -->
				<tr>
					<td class="col1">내용</td>
					<td class="col2">
						<textarea title="공지내용" rows="10" cols="50" name="content" style="resize: none;">${review.content}</textarea>
					</td>
				</tr>
				<tr>
					<td class="col1">이미지</td>
					<td class="col2">
						<input type="file" name="fileList" multiple="multiple" value="${review.image_group_id}">
						<small style="display: flex; padding-top: 10px;">* 여러개 첨부 가능</small>
						<input type="hidden" name="sale_id" value="${review.sale_id}">
						<input type="hidden" id="url" value="/imgur/upload">
					</td>
				</tr>
				<tr>
					<td class="col1">작성일</td>
					<td class="col2">
						<p>${review.created_at}</p>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3">
						<button type="submit" id="imgur_push">리뷰 수정</button>
					</td>
				</tr>
			</tfoot>
		</table>

	</form>
	</div>
</div>
</body>
</html>
