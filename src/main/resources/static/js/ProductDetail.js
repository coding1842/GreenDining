$(function () {
   $("#btnradio1").click(function (e) { 
     $("#1").attr("style","display:block");  
    $("#2").attr("style","display:none");
     $("#3").attr("style","display:none");  
    $("#4").attr("style","display:none");
  });
  
   $("#btnradio2").click(function (e) { 
     $("#2").attr("style","display:block");  
    $("#1").attr("style","display:none");
     $("#3").attr("style","display:none");  
    $("#4").attr("style","display:none");
  });
  
   $("#btnradio3").click(function (e) { 
     $("#3").attr("style","display:block");  
    $("#2").attr("style","display:none");
     $("#1").attr("style","display:none");  
    $("#4").attr("style","display:none");
  });
  
   $("#btnradio4").click(function (e) { 
     $("#4").attr("style","display:block");  
    $("#2").attr("style","display:none");
     $("#3").attr("style","display:none");  
    $("#1").attr("style","display:none");
  });
  
  
  
});