<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

table{
	margin: 0 auto;
	width: 600px;
	border: solid 1px black;
	border-collapse: collapse;
}
tr{
	border: solid 1px black;
}
th{
	width: 200px;
}
td{
	width: 400px;
	text-align: center;
	border: solid 1px black;
}
</style>
<script src="../jquery/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$().ready(function(){
			var f = $('form[name=form1]');
		$('#reply').on("click",function(){
			f.attr('action', 'writeForm');
			f.submit();
		});
		$('#update').on("click",function(){
			if(checkPw()){
				f.attr('action', 'updateForm');
				f.submit();
			}else{
				alert("비밀번호가 맞지 않습니다.");
				return false;
			}
		});
		$('#delete').on("click",function(){
			if(checkPw()){
				if(confirm("정말 삭제하시겠습니까?")){
					
				f.attr('action', 'deleteAction');
				f.submit();
				}else {return false
				}
			}else{
				alert("비밀번호가 맞지 않습니다.");
				return false;
			}
		});
	});
	//chk에 대해서 점검
	function checkPw(){
		
		var upw = prompt("비밀번호를 입력하시오");
		var spw = $('input[name=passwd]').val();
		if(upw==spw) return true;
		else return false;
	}
	
</script>
</head>
<body>
<h2 style="text-align: center;">질문 내용</h2>
<br><br>
<form action="" method="post" name="form1" method="post">
<table>
	<tbody>
	<tr>
		<th>제목</th>
		<td>
			<input type="text" size = "52" readonly="readonly" name="subject" value="${qna.title}">
			
		</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>
			<input type="text" size = "52" name="writer" readonly="readonly" value="${qna.user_id}">
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea rows="20" cols="50" name="content" style="resize: none" readonly="readonly" style="resize: none">${qna.content}</textarea>
		</td>
	</tr>
	<tr>
		<th>이미지</th>
		<td>
			<input type="image" size = "52" name="image" readonly="readonly" value="${qna.image_group_id}">
		</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>
			<input type="text" size = "52"  disabled="disabled" value="${qna.created_at}">
		</td>
	</tr>
	</tbody>
	<tfoot>
		<tr style="text-align: center">
			<td colspan="2">
				<input type="button" value="글수정" id="update">
				&nbsp;&nbsp;&nbsp;
				<input type="button" value="글삭제" id="delete">
				&nbsp;&nbsp;&nbsp;
				<input type="button" value="답글" id="reply">
				&nbsp;&nbsp;&nbsp;
				<input type="button" value="글목록" onclick="location.href = 'boardList?curPage=${pdto.curPage}'">
			</td>
		</tr>
	</tfoot>
</table>
	<input type="hidden" name="bno" value="">
	<input type="hidden" name="bref" value="">
	<input type="hidden" name="bstep" value="">
	<input type="hidden" name="blevel" value="">
</form>
</body>
</html>