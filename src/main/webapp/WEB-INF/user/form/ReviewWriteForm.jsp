<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성하기</title>
<link rel="stylesheet" href="/css/QnaWriteForm.css" />
<link rel="stylesheet" href="/css/user/Review.css" />
<script type="text/javascript">

</script>
</head>
<body>
<div style="text-align: center;">
	<div style="width: 800px; display: inline-block;">
	<form action="/review/insert" id="ajaxForm" enctype="multipart/form-data" method="post">
<%-- 		<input type="text" name="id" value="${review.id}"> --%>
		<table>
			<thead>
				<tr>
					<th colspan="2">리뷰 작성</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="col1">별점</td>
					<td class="col2">
<%-- 						<input type="text" name="star" value="${ReviewDTO.star}"> --%>
						<div class="mb-3" name="myform" id="myform" method="post">
							<fieldset id='star-rating' class='rating'>
								<span class="text-bold">별점을 선택해주세요</span>
								<input type="radio" name="star" value="5" id="rate1"><label
									for="rate1">★</label>
								<input type="radio" name="star" value="4" id="rate2"><label
									for="rate2">★</label>
								<input type="radio" name="star" value="3" id="rate3"><label
									for="rate3">★</label>
								<input type="radio" name="star" value="2" id="rate4"><label
									for="rate4">★</label>
								<input type="radio" name="star" value="1" id="rate5"><label
									for="rate5">★</label>
							</fieldset>
						</div>
					</td>
				</tr>
				<tr>
					<td class="col1">제목</td>
					<td class="col2">
						<input type="text" name="title" value="${ReviewDTO.title}">
					</td>
				</tr>
<!-- 				<tr> -->
<!-- 					<td class="col1">작성자</td> -->
<!-- 					<td class="col2"> -->
						<input type="hidden" name="user_id" value="${ssKey.id}">
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
						<textarea title="공지내용" rows="10" cols="50" name="content" style="resize: none;"></textarea>
					</td>
				</tr>
				<tr>
					<td class="col1">이미지</td>
					<td class="col2">
						<input type="file" name="fileList" multiple="multiple">
						<small style="display: flex; padding-top: 10px;">* 여러개 첨부 가능</small>
						<input type="hidden" name="sale_id" value="${sale_id}">
						<input type="hidden" id="url" value="/imgur/upload">
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3">
						<button type="submit" id="imgur_push">리뷰 작성</button>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	</div>
</div>
</body>
</html>