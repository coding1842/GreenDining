/**
 * 
 */
$().ready(function(){
	var idchk=1;	
 var pcheck = true;	//두개가 다르면 true,같으면 false
 function validate(){
		var flen = $("form[name=deliveryForm1] .add").length;
		for(var i=0; i<flen; i++){
			if($('.add').eq(i).val()=="" ||
		       $('.add').eq(i).val()==null ||
		       $('.add').eq(i).val().trim()==""){
			  alert($('.add').eq(i).attr('title')+'은/는 필수입력');
			  $('.add').eq(i).focus();
			  return false;
			}
		 }
		return true;
	}
	
	$('#addSubmit').on("click", function(){
				$('delivery').submit();
		});
})