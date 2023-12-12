$().ready(function(){
	
	$('#update').on('click', function(){
		$("form[name=form1]").attr('action', "/qna/qnaUpForm")
		$("form[name=form1]").submit();
	});
	$('.noticeDel').on('click', function(){
		$("form[name=form1]").attr('action', "/qnaProc?flag=delete")
		$("form[name=form1]").submit();
	});
});