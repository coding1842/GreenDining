//const { reload } = require("browser-sync");

/**
 * 
 */

function validate(){
		var flen = $("form[name=addressForm] .addressChk").length;
		for(var i=0; i<flen; i++){
			if($('.addressChk').eq(i).val()=="" ||
		       $('.addressChk').eq(i).val()==null ||
		       $('.addressChk').eq(i).val().trim()=="" ||
			   $('.addressChk').eq(i).is('select') && $('.addressChk').eq(i).val() == "선택"){
			  alert($('.addressChk').eq(i).attr('title')+'을/를 입력해주세요.');
			  $('.addressChk').eq(i).focus();
			  return false;
			}
		 }
}


function controlAddress(ele,type){
		
	var data = $(ele).closest("form")[0];
	var formdata = new FormData(data);
	
//	alert(formdata.get("id"));
	var url = "";
	if(type == "update")
	{
		if(confirm("정말 수정 하시겠습니까?"))
		{
			url = "/user/updateAddress";
		}
		else
		{
			return false;
		}
		
	}
	else if(type == "delete")
	{
		if(confirm("정말 삭제 하시겠습니까?"))
		{
			url = "/user/deleteAddress";
		}
		else
		{
			return false;
		}
	}
	
	$.ajax({
		url: url,
		type: "POST",
		data: formdata,
		processData: false,
    	contentType: false,  
		success: function(data){
//		    window.location.href = "/user/address/list";
//			alert('배송 정보가 성공적으로 수정되었습니다.');
			alert(data);
			location.reload();
		},
		error: function(jqXHR, textStatus, errorThrown){
		    console.log('Error: ' + errorThrown);
		    alert(textStatus);
//			window.location.href = "/user/address/list";
//			alert('배송 정보 수정에 실패했습니다. 다시 시도해주세요.');
			location.reload();
		}
	});
}











