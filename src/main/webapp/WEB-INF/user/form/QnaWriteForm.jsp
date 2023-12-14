<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 작성하기</title>
<link rel="stylesheet" href="/css/QnaWriteForm.css" />
</head>
<body>
<div style="text-align: center;">
	<div style="width: 800px; display: inline-block;">
	<form action="/user/qna/insert" id="ajaxForm" enctype="multipart/form-data" method="post">
		<table>
			<thead>
				<tr>
					<th colspan="2">질문 작성</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="col1">제목</td>
					<td class="col2">
						<input type="text" name="title">
						<input type="hidden" name="user_id" value="${sskey.id}">
						
					</td>
				</tr>
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
						<input type="button" id="imgur_push" value="질문 등록">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	</div>
</div>
</body>
</html>