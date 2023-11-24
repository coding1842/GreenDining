$(document).ready(function()
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
	
	/** 종합정보 섹션 정보삽입 */
	setTotalInfo();
	
	/* 체크박스 전체선택 */
$("#all_check_input").on("click", function(){
	//체크박스 체크or해제
	if($("#all_check_input").prop("checked")){
		$(".individual_cart_checkbox").attr("checked", true);
	}else{
		$(".individual_cart_checkbox").removeAttr("checked");
	}
	setTotalInfo($(".cart_info"));
	
});	
});

/*체크여부에 따른 종합 정보 변화*/
$(".individual_cart_checkbox").on("change", function(){
	
	setTotalInfo($(".cart_info"));
});



function setTotalInfo() {
  let product_price = 0; //상품금액
  let product_discount = 0; //할인금액
  let order_price = 0; //주문금액

  $(".cart_info").each(function(index, element) {
	if($(element).find(".individual_cart_checkbox").is(":checked") === true){
	    product_price += parseInt($(element).find(".individual_product_price").val());
	    product_discount += parseInt($(element).find(".individual_product_discount").val());
	    order_price += parseInt($(element).find(".individual_order_price").val());
	}
  });

  //최종가격
  order_price = product_price - product_discount;

  //값 삽입
  console.log(product_price);
  console.log(product_discount);
  console.log(order_price);
  $(".product_price_span").text(product_price.toLocaleString());
  $(".product_discount_span").text(product_discount.toLocaleString());
  $(".order_price_span").text(order_price.toLocaleString());

  $(".individual_cart_checkbox").on("change", function() {
    setTotalInfo();
  });
}