/**
 *
 */
$(function(){
	$("#discount_setting").click(function(e){
		$("#discount_rate").attr("style", "display:block");
		$("#discount_total").attr("style", "display:block");
	});

	$("#notdiscount_setting").click(function(e) {
		$("#discount_rate").attr("style", "display:none;");
		$("#discount_total").attr("style", "display:none;");
	});

	$("#product_tax").click(function(e){
		$("#product_a").attr("style", "display:block;");
		$("#product_b").attr("style", "display:none;");
		$("#product_c").attr("style", "display:none;");
	});
	$("#product_zero").click(function(e){
		$("#product_a").attr("style", "display:none;");
		$("#product_b").attr("style", "display:block;");
		$("#product_c").attr("style", "display:none;");
	});
	$("#product_exemption").click(function(e){
		$("#product_a").attr("style", "display:none;");
		$("#product_b").attr("style", "display:none;");
		$("#product_c").attr("style", "display:block;");
	});
});

$().ready(function(){
	$('.submit1').on('click', function(){			
		var flen = $("form[name=pForm] .chk1").length;
		for(var i=0; i < flen; i++){
			if( $('.chk1').eq(i).val()=="" || 
					$('.chk1').eq(i).val()== null ||
					$('.chk1').eq(i).val().trim()==""){
				alert($('.chk1').eq(i).attr('title')+ '를 입력하시오');
				$('.chk1').eq(i).focus();
				return false;
			}
		}
			$("form[name=pForm]").submit();
		});
});
