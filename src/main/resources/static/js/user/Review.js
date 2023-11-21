//const { reload } = require("browser-sync");

/**
 * 
 */

function controlReview(ele,type){
		
	var data = $(ele).closest("form")[0];
	var formdata = new FormData(data);
	
	var url = "";
	if(type == "update")
	{
		if(confirm("정말 수정 하시겠습니까?"))
		{
			url = "/user/updateReview";
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
			url = "/user/deleteReview";
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
			alert(data);
			location.reload();
		},
		error: function(jqXHR, textStatus, errorThrown){
		    console.log('Error: ' + errorThrown);
		    alert(textStatus);
			location.reload();
		}
	});
}










