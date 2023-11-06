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