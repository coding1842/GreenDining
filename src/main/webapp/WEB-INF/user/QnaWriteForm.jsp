<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 작성하기</title>
<link rel="stylesheet" href="/css/QnaWriteForm.css" />
</head>
<body>
<form action="" name="topForm1" method="post">
	<table>
		<thead>
			<tr>
				<th colspan="2">Q&A 작성</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="col1">제목</td>
				<td class="col2">
					<input type="text" name="subject" class="chk1" readonly="readonly" value="${notice.subject}">
				</td>
			</tr>
			<tr>
				<td class="col1">작성자</td>
				<td class="col2">
					<input type="text" name="writer" id="check1"  value="${notice.writer}">
				</td>
			</tr>
			<tr>
				<td class="col1">비밀번호</td>
				<td class="col2">
					<input type="text" name="writer" id="check1"  value="${notice.writer}">
				</td>
			</tr>			
			<tr>
				<td class="col1">내용</td>
				<td class="col2">
					<textarea readonly="readonly" title="공지내용" rows="10" cols="70" name="content" style="resize: none;">${notice.content}</textarea>
				</td>
			</tr>
			<tr>
				<td class="col1">작성일자</td>
				<td class="col2">
					<input type="text" name="regdate" readonly="readonly" value="${notice.regdate}" >
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3">
					<button type="button" onclick="location.href='/detail'">작성하기</button>
				</td>
			</tr>
		</tfoot>
	</table>
</form>
</body>
</html>