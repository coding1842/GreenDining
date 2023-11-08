$(function () {
  
   $("#btnradio1").click(function (e) { 
  	$("#user_find").attr("style","display:block");  
    $("#business_find").attr("style","display:none");
  });
  
  $("#btnradio2").click(function (e) { 
  	$("#user_find").attr("style","display:none");  
    $("#business_find").attr("style","display:block");
  });
  
  $("#btnradio11").click(function (e) { 
  	$("#my_order_box").attr("style","display:block");  
    $("#my_cart_box").attr("style","display:none");
    $("#business_find").attr("style","display:none");
    $("#business_find").attr("style","display:none");
  });
  $("#btnradio22").click(function (e) { 
  	$("#my_cart_box").attr("style","display:block");  
    $("#my_order_box").attr("style","display:none");
    $("#business_find").attr("style","display:none");
    $("#business_find").attr("style","display:none");
  });
});