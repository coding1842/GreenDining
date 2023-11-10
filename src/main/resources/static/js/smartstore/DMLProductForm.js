/**
 *
 */
$(function(){
	$("#sale-discount-yes").click(function(e){
		$("#sale-discount-text").attr("style", "display:block");
		$("#sale-discount-total").attr("style", "display:block");
	});

	$("#sale-discount-none").click(function(e) {
		$("#sale-discount-text").attr("style", "display:none;");
		$("#sale-discount-total").attr("style", "display:none;");
	});

//	$("#product_tax").click(function(e){
//		$("#product_a").attr("style", "display:block;");
//		$("#product_b").attr("style", "display:none;");
//		$("#product_c").attr("style", "display:none;");
//	});
//	$("#product_zero").click(function(e){
//		$("#product_a").attr("style", "display:none;");
//		$("#product_b").attr("style", "display:block;");
//		$("#product_c").attr("style", "display:none;");
//	});
//	$("#product_exemption").click(function(e){
//		$("#product_a").attr("style", "display:none;");
//		$("#product_b").attr("style", "display:none;");
//		$("#product_c").attr("style", "display:block;");
//	});
});