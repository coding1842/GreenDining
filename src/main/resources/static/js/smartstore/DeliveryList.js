/**
 * 
 */
$(document).ready(function() {
    $("select[name^='status']").each(function() {
        var status = $(this).data('status');
        $(this).val(status);
    });
	

$(".selectBtn").click(function(){
    var dataArr = [];
    var checkbox = $("input[name=ck]:checked");
    checkbox.each(function(i) {
        var tr = $(this).parent().parent();
        var order_id = tr.find("td a").text(); // 주문 번호를 가져옵니다.
        var status = tr.find('select[name=status' + order_id + ']').val(); // 상태를 가져옵니다.
        dataArr.push({ 
            "id": order_id,
            "status": status
        });
    });
    $.ajax({
        type:'post',
        data: JSON.stringify(dataArr),
        contentType: 'application/json',
        url:'/merchant/my-page/delivery/list/update',
       complete: function() {
        clearCheckbox(); // 체크박스를 초기화합니다.
        location.reload(); // 페이지를 새로고침합니다.
    }
    });
});

$(".deleteBtn").click(function(){
    var dataArr = [];
    var checkbox = $("input[name=ck]:checked");
    checkbox.each(function(i) {
        var tr = $(this).parent().parent();
        var order_id = tr.find("td a").text(); // 주문 번호를 가져옵니다.
        var order = {id: order_id}; // 주문 번호를 포함하는 객체를 만듭니다.
        dataArr.push(order); // 객체를 배열에 넣습니다.
    });
	    $.ajax({
	    type:'post', 
	    data: JSON.stringify(dataArr),
	    contentType: 'application/json',
	    url:'/merchant/my-page/delivery/list/delete',
	   complete: function() {
            clearCheckbox(); // 체크박스를 초기화합니다.
            location.reload(); // 페이지를 새로고침합니다.
        }
	});
});

function clearCheckbox() {
    $("input[name=ck]").prop("checked", false);
}
				
		})