$(function () {
  checkOrderTotal();

  $("#orderRequest").click(function (e) {
    requestPay();
  });

  $("#normal_payment #category_group .checkbox").click(function (e) {
    $("#category_group .checkbox-input").each(function () {
      $(this).prop("checked", false);
    });
    $(this).find(".checkbox-input").prop("checked", true);
  });

  $(".payment_radio_group .inputGroup").click(function (e) {
    if ($("input.radio_simple").prop("checked")) {
      $("#simple_payment").attr("style", "display:block");
      $("#normal_payment").attr("style", "display:none");
    } else if ($("input.radio_normal").prop("checked")) {
      $("#normal_payment").attr("style", "display:block");
      $("#simple_payment").attr("style", "display:none");
    }
  });

  $("button#order_cancel").click(function (e) {
    if (confirm("주문을 취소하시겠습니까?")) {
      var form = $("form#orderCancelForm").get(0);
      var formData = new FormData(form);
      $.ajax({
        type: "post",
        url: "/payment/cancel",
        data: formData,
        dataType: "text",
        processData: false, // FormData 객체를 직렬화하지 않음
        contentType: false, // 요청 본문의 타입을 'multipart/form-data'로 자동 설정
        success: function (resp) {
          window.location.href = resp;
        },
      });
    } else {
      return false;
    }
  });
});

function checkOrderTotal() {
  var total_price = 0;
  var discount_price = 0;
  var total_payment_price = 0;

  $(".hidden_info").each(function () {
    var before_price = parseInt($(this).find(".before_price").val());
    var quantity = parseInt($(this).find(".quantity").val());

    total_price += before_price * quantity;

    var after_price = parseInt($(this).find(".after_price").val());

    discount_price += (before_price - after_price) * quantity;

    total_payment_price += after_price * quantity;
  });

  total_payment_price += 3000;
  $("#payForm input[name=amount]").val(total_payment_price);
  $("#payment_info #total_price").text(total_price.toLocaleString("en-US") + "원");
  $("#payment_info #discount_price").text("-" + discount_price.toLocaleString("en-US") + "원");
  $("#payment_info #total_payment_price").text(total_payment_price.toLocaleString("en-US") + "원");
}

function requestPay() {
  var checked_val = $(".checkbox-input:checked").val();
  var paymentForm = $("#" + checked_val).get(0);

  KCP_Pay_Execute(paymentForm);
}

function requestOrder() {
  var form = $("form#orderForm").get(0);
  var formData = new FormData(form);
  var address_id = $("input[name='address_id'").val();
  formData.append("address_id", address_id);

  $.ajax({
    type: "POST",
    url: "/order/request",
    data: formData,
    dataType: "json",
    processData: false, // FormData 객체를 직렬화하지 않음
    contentType: false, // 요청 본문의 타입을 'multipart/form-data'로 자동 설정
    success: function (resp) {
      // alert("주문 완료");
      //   location.href = resp;
    },
    error: function (xhr, status, error) {
      // 에러 처리
      if (xhr.status === 401) {
        alert("로그인 후 이용해 주시길 바랍니다.");
        // location.href = xhr.responseText;
      }
    },
  });
}
