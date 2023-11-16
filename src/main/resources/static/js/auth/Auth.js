$(function () {
  
   $("#btnradio1").click(function (e) { 
  	$("#user_find").attr("style","display:block");  
    $("#business_find").attr("style","display:none");
  });
  
  $("#btnradio2").click(function (e) { 
  	$("#user_find").attr("style","display:none");  
    $("#business_find").attr("style","display:block");
  });
  
  
});