/**
 * 
 */
$(function(){
	$("#product_return_choice1").click(function(e){
		$("#product_return_check").attr("style", "display:block;");
		$("#product_return_problem").attr("style", "display:none;");
		$("#product_return_solution").attr("style", "display:none;");
	});
	$("#product_return_choice2").click(function(e){
		$("#product_return_check").attr("style", "display:none;");
		$("#product_return_problem").attr("style", "display:block;");
		$("#product_return_solution").attr("style", "display:none;");
	});
	$("#product_return_choice3").click(function(e){
		$("#product_return_check").attr("style", "display:none;");
		$("#product_return_problem").attr("style", "display:none;");
		$("#product_return_solution").attr("style", "display:block;");
	});
});

