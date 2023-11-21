$().ready(function()
{
<<<<<<< main
   $(".update_cart").click(function()
   {
      if(confirm("수량 수정하시겠습니까?"))
      {
      var form = $(this).closest("form");    
      form.attr("action","/cart/list/update");
      
      form.submit();
      }
   })
   
   $(".delete_cart").click(function()
   {
      if(confirm("장바구니에서 삭제하시겠습니까?"))
      {
      var form = $(this).closest("form");    
      form.attr("action","/cart/list/delete");
      
      form.submit();
      }
   })
})



=======
	$(".update_cart").click(function()
	{
		if(confirm("수량 수정하시겠습니까?"))
		{
		var form = $(this).closest("form");	 
		form.attr("action","/cart/list/update");
		
		form.submit();
		}
	})
	
	$(".delete_cart").click(function()
	{
		if(confirm("장바구니에서 삭제하시겠습니까?"))
		{
		var form = $(this).closest("form");	 
		form.attr("action","/cart/list/delete");
		
		form.submit();
		}
	})
})
>>>>>>> #62 - 장바구니 수정,삭제 기능구현 완료
///**
// * 
// */
//$().ready(function(){
//  var plen = $('.price').length;
//    for(var i=0; i<plen; i++){
//    var p=$('.price').eq(i).text();
//    var to_p = 
//        p.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g,",");
//    $('.price').eq(i).text(to_p);
//   }
////   $('.inprice').on('change',function(){
////     var p1=$(input[name=price]).val()
////   })
<<<<<<< main
// 
//  
=======
//   
>>>>>>> #62 - 장바구니 수정,삭제 기능구현 완료
//   $('.cartAdd').on('click', function(){
//      var q = $('input[name=quantity]').val();
//      var s = $('input[name=stock]').val();
//      if(!$.isNumeric(q)) {
//         alert('숫자를 입력하시오')
//         $('input[name=quantity]').focus()
//         return false
//         }
//         
<<<<<<< main
//         
=======
>>>>>>> #62 - 장바구니 수정,삭제 기능구현 완료
//      if(q>s){   //if(parseInt(p)>parseInt(s)) 안되면 이걸로
//         alert('재고가 부족합니다.')
//         return false;
//         }
//      $('form[name=productForm]').submit();
//   });
//   //배송관련 상태
//   $('.productUp').on('click', function(){
//      $('form[name=productForm]').attr('action','productUpForm');
//      $('form[name=productForm]').submit();
//   });
//   
//   $('.productDel').on('click', function(){
//      pno = $('input[name=p_no]').val();
//      alert(pno)
//      $.ajax({
//         async:true,
//         type:'post',
//         data:{
//            "p_no":pno
//         },
//         url: 'orderCntOfProduct', 
//         dataType:"json",
//         success : function(cnt){
//            if(cnt>0){
//               alert('주문내역이 존재합니다.\n 삭제 불가');
//               return flase;
//            }else{
//               alert(cnt);
//               r = confirm('삭제하시겠습니까?');
//               if(r){
//                  $('form[name=productForm]').attr('action', 'productDel');
//                  $('form[name=productForm]').submit();
//               }else{
//                  return false;
//               }
//            }
//         }
//      });
//      
//   });
//      $("select[name='state']").change(function(){
//         var tr = $(this).parent().parent();
//         var td = tr.children();
//         tr.find(td).find("input[name=ck]").prop("checked", true);
//      });
//      
//      $(".selectBtn").click(function(){
//         var tdArr =new Array();
//         //체크된 체크박스 값을 가져온다
//         var checkbox = $("input[name=ck]:checked");
//         checkbox.each(function(i){
//         var tr = checkbox.parent().parent().eq(i);
//         var td = tr.children();
//         var pno = tr.find(td).find("input[name=p_no]").val();
//         var ono = tr.find(td).find("input[name=o_no]").val();
//         var memid = tr.find(td).find('input[name=mem_id').val();
//         var state = tr.find(td).find('select[name=state]').val();
//            tdArr.push("o_no:"+ono);   
//            tdArr.push("p_no:"+pno);   
//            tdArr.push("mem_id:"+memid);   
//            tdArr.push("state:"+state);   
//         });
//         $.ajax({ async:false,
//            type:'post',
//            data:{tdArr},
//            url:'/orderMgtProc',
//            success:setInterval()
//         })
//         function setInterval(){
//            var tr = $("select[name='state']").parent().parent();
//                  var td = tr.children();
//                  tr.find(td).find("input[name=ck]").prop("checked", false);
//         }
//      });
//})
//    
//    function cartUpdate(f, obj){
//       var url1;
//        var quantity = $(obj).closest('tr').find('input[name=quantity]').val();
//        var pno = $(obj).closest('tr').find('input[name=p_no]').val(); 
//        var stock = $(obj).closest('tr').find('input[name=stock]').val(); //$(obj).closest('tr').find('input[name=stock]').val(); 안될때
//      if(f=='D'){
//         //삭제
//         url1='cartProc?flag=delete';
//         $(obj).closest('tr').remove();
//      }else if(f=='U'){
//         if(parseInt(quantity)>parseInt(stock)){
//            alert('재고가 부족합니다.')
//            return false;
//         }
//         //수정
//         url1='cartProc?flag=update';
//      }
//      $.ajax({
//         async:true,
//         type:'post',
//         data:{"quantity":quantity,
//               "p_no":pno
//               },
//         url: url1,
//         dataType:"json",
//         success : function() {
////            alert('장바구니 수정');
//           }
//      });
//  }
//  function orderDetail(obj){
//     var ono = $(obj).closest('tr').find('input[name=o_no]').val(); 
//     var pno = $(obj).closest('tr').find('input[name=p_no]').val(); 
//     var memId = $(obj).closest('tr').find('input[name=mem_id]').val(); 
//     $('form[name=orform] input[name=o_no]').val(ono); 
//     $('form[name=orform] input[name=p_no]').val(pno); 
//     $('form[name=orform] input[name=mem_id]').val(memId); 
//     $('form[name=orform]').submit();
//  }
  
  
  
  // ------------------------------------

<<<<<<< main
=======

>>>>>>> #62 - 장바구니 수정,삭제 기능구현 완료
