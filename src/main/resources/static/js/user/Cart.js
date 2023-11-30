$(document).ready(function () {
  $(".update_cart").click(function () {
    if (confirm("수량 수정하시겠습니까?")) {
      var form = $(this).closest("form");
      form.attr("action", "/cart/list/update");

      form.submit();
    }
  });

  $(".delete_cart").click(function () {
    if (confirm("장바구니에 서 삭제하시겠습니까?")) {
      var form = $(this).closest("form");
      form.attr("action", "/cart/list/delete");

      form.submit();
    }
  });

  /** 종합정보 섹션 정보삽입 */
  setTotalInfo();

  /* 체크박스 전체선택 */
  $("#all_check_input").on("click", function () {
    //체크박스 체크or해제
    if ($("#all_check_input").prop("checked")) {
      $(".individual_cart_checkbox").attr("checked", true);
    } else {
      $(".individual_cart_checkbox").removeAttr("checked");
    }
    setTotalInfo($(".cart_info"));
  });

  $("#cartOrder").click(function (e) {
    cartProcess();
  });
});

/*체크여부에 따른 종합 정보 변화*/
$(".individual_cart_checkbox").on("change", function () {
  setTotalInfo($(".cart_info"));
});

function setTotalInfo() {
  let product_price = 0; //상품금액
  let product_discount = 0; //할인금액
  let order_price = 0; //주문금액

  $(".cart_info").each(function (index, element) {
    if ($(element).find(".individual_cart_checkbox").is(":checked") === true) {
      product_price += parseInt($(element).find(".individual_product_price").val());
      product_discount += parseInt($(element).find(".individual_product_discount").val());
      order_price += parseInt($(element).find(".individual_order_price").val());
    }
  });

  //최종가격
  order_price = product_price - product_discount;

  //값 삽입

  $(".product_price_span").text(product_price.toLocaleString());
  $(".product_discount_span").text(product_discount.toLocaleString());
  $(".order_price_span").text(order_price.toLocaleString());

  $(".individual_cart_checkbox").on("change", function () {
    setTotalInfo();
  });
}

function cartProcess() {
  var cartDTOList = []; // CartDTO 객체를 저장할 배열

  $(".my_cart_top").each(function () {
    var cartDTO = {};
    cartDTO.product_id = $(this).find("input[name='product_id']").val();
    cartDTO.sale_id = $(this).find("input[name='sale_id']").val();
    cartDTO.store_name = $(this).find("input[name='store_name']").val();
    cartDTO.quantity = $(this).find("input[name='quantity']").val();
    cartDTO.name = $(this).find("input[name='name']").val();
    cartDTO.before_price = parseInt($(this).find("input[name='process_before_price']").val());
    cartDTO.after_price = parseInt($(this).find("input[name='process_after_price']").val());
    cartDTOList.push(cartDTO);
  });

  $.ajax({
    type: "POST",
    url: "/order/process",
    data: JSON.stringify(cartDTOList),
    contentType: "application/json",
    success: function (response) {
      window.location.href = response;
    },
    error: function (xhr, status, error) {
      if (xhr.status === 401) {
        alert("로그인 후 이용해 주시길 바랍니다.");
        window.location.href = xhr.responseText;
      }
    },
  });
}
