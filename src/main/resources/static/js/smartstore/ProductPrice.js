$().ready(function(){
  var plen = $('.price11').length;
 	for(var i=0; i<plen; i++){
	 var p=$('.price11').eq(i).text();
	 var to_p = 
	     p.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,",");
	 $('.price11').eq(i).text(to_p);
   }
   


  });
  
  