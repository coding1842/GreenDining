$(function () {
  $("#btnradio1").click(function (e) {
    $("#1").attr("style", "display:block");
    $("#2").attr("style", "display:none");
    $("#3").attr("style", "display:none");
    $("#4").attr("style", "display:none");
  });

  $("#btnradio2").click(function (e) {
    $("#2").attr("style", "display:block");
    $("#1").attr("style", "display:none");
    $("#3").attr("style", "display:none");
    $("#4").attr("style", "display:none");
  });

  $("#btnradio3").click(function (e) {
    $("#3").attr("style", "display:block");
    $("#2").attr("style", "display:none");
    $("#1").attr("style", "display:none");
    $("#4").attr("style", "display:none");
  });

  $("#btnradio4").click(function (e) {
    $("#4").attr("style", "display:block");
    $("#2").attr("style", "display:none");
    $("#3").attr("style", "display:none");
    $("#1").attr("style", "display:none");
  });

  $(".checked_quantity").on("click", function () {
    var quantity = $(this).val();
    var after_price = $(this).next().find(".after_price").val();

    var total_price = quantity * after_price;

    $(this).next().find(".total_price").val(total_price);

    $(this)
      .next()
      .find(".total_price")
      .text(total_price.toLocaleString("en-US") + "원");

    checkTotal();
  });

  $("#sale_product_select .dropdown-item.main_type").click(function (e) {
    var product_id = $(this).find(".product_id").val();
    var duplication = false;
    // 이미 선택한 항목인지 확인
    $("#selected_sale_product #main_type .cartDTO .product_id").each(function () {
      if (product_id == $(this).val()) {
        alert("이미 선택한 항목입니다.");
        duplication = true;
        return false;
      }
    });
    if (duplication) {
      return;
    }

    var newField = $(this).clone(true);

    newField.removeClass().addClass("cartDTO w-100");
    newField.find(".checked_quantity").removeClass("visually-hidden");
    newField.find(".selected_price").removeClass("visually-hidden");
    newField.off("click");
    $("form#sale_product_form #main_type").append(newField);
    checkTotal();
  });

  $("#sale_product_select .dropdown-item.sub_type").click(function (e) {
    var product_id = $(this).find(".product_id").val();
    var duplication = false;
    // 이미 선택한 항목인지 확인
    $("#selected_sale_product #sub_type .cartDTO .product_id").each(function () {
      if (product_id == $(this).val()) {
        alert("이미 선택한 항목입니다.");
        duplication = true;
        return false;
      }
    });
    if (duplication) {
      return;
    }
    var newField = $(this).clone(true);

    newField.removeClass().addClass("cartDTO w-100");
    newField.find(".checked_quantity").removeClass("visually-hidden");
    newField.find(".selected_price").removeClass("visually-hidden");
    newField.off("click");
    $("form#sale_product_form #sub_type").append(newField);
    checkTotal();
  });

  $(".sale_product_delete").click(function (e) {
    $(this).closest(".cartDTO").remove();
    checkTotal();
  });

  $("#cart_add").click(function (e) {
    if ($("#selected_sale_product .cartDTO").length < 1) {
      alert("선택한 상품이 없습니다.");
      return false;
    }
    cartADD();
  });

  $("#buy_now").click(function (e) {
    if ($("#selected_sale_product .cartDTO").length < 1) {
      alert("선택한 상품이 없습니다.");
      return false;
    }
    orderProcess();
  });
});

function cartADD() {
  var cartDTOList = []; // CartDTO 객체를 저장할 배열

  $("#main_type .cartDTO").each(function () {
    var cartDTO = {};
    cartDTO.product_id = $(this).find("input[name='cartDTOList[].product_id']").val();
    cartDTO.sale_id = $(this).find("input[name='cartDTOList[].sale_id']").val();
    cartDTO.store_name = $(this).find("input[name='cartDTOList[].store_name']").val();
    cartDTO.quantity = $(this).find("input[name='cartDTOList[].quantity']").val();
    cartDTOList.push(cartDTO);
  });

  $("#sub_type .cartDTO").each(function () {
    var cartDTO = {};
    cartDTO.product_id = $(this).find("input[name='cartDTOList[].product_id']").val();
    cartDTO.sale_id = $(this).find("input[name='cartDTOList[].sale_id']").val();
    cartDTO.store_name = $(this).find("input[name='cartDTOList[].store_name']").val();
    cartDTO.quantity = $(this).find("input[name='cartDTOList[].quantity']").val();
    cartDTOList.push(cartDTO);
  });

  // 서버로 전송
  $.ajax({
    url: "/cart/add",
    type: "POST",
    data: JSON.stringify(cartDTOList),
    contentType: "application/json",
    success: function (data) {
      // 성공 처리
      if (confirm("장바구니로 이동하시겠습니까?")) {
        window.location.href = data;
      }
    },
    error: function (xhr, status, error) {
      // 에러 처리
      if (xhr.status === 401) {
        alert("로그인 후 이용해 주시길 바랍니다.");
        window.location.href = xhr.responseText;
      } else if (xhr.status === 400) {
        alert("이미 장바구니에 추가한 항목입니다.");
      }
    },
  });
}

function orderProcess() {
  var cartDTOList = []; // CartDTO 객체를 저장할 배열

  $("#main_type .cartDTO").each(function () {
    var cartDTO = {};
    cartDTO.product_id = $(this).find("input[name='cartDTOList[].product_id']").val();
    cartDTO.sale_id = $(this).find("input[name='cartDTOList[].sale_id']").val();
    cartDTO.store_name = $(this).find("input[name='cartDTOList[].store_name']").val();
    cartDTO.quantity = $(this).find("input[name='cartDTOList[].quantity']").val();
    cartDTO.name = $(this).find("input[name='cartDTOList[].name']").val();
    cartDTO.before_price = parseInt($(this).find("input[name='cartDTOList[].before_price']").val());
    cartDTO.after_price = parseInt($(this).find("input[name='cartDTOList[].after_price']").val());
    cartDTOList.push(cartDTO);
  });

  $("#sub_type .cartDTO").each(function () {
    var cartDTO = {};
    cartDTO.product_id = $(this).find("input[name='cartDTOList[].product_id']").val();
    cartDTO.sale_id = $(this).find("input[name='cartDTOList[].sale_id']").val();
    cartDTO.store_name = $(this).find("input[name='cartDTOList[].store_name']").val();
    cartDTO.quantity = $(this).find("input[name='cartDTOList[].quantity']").val();
    cartDTO.name = $(this).find("input[name='cartDTOList[].name']").val();
    cartDTO.before_price = parseInt($(this).find("input[name='cartDTOList[].before_price']").val());
    cartDTO.after_price = parseInt($(this).find("input[name='cartDTOList[].after_price']").val());
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

function checkTotal() {
  var total_count = 0;
  var total_price = 0;
  $("#selected_sale_product .checked_quantity").each(function () {
    total_count += parseInt($(this).val());
  });

  $("#selected_sale_product .total_price").each(function () {
    total_price += parseInt($(this).val());
  });

  $("#total_div .total_count").text("총 수량 " + total_count.toLocaleString("en-US") + " 개");
  $("#total_div .total_price").text(total_price.toLocaleString("en-US") + "원");
}
