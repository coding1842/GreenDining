//const { reload } = require("browser-sync");

/**
 *
 */
//address
function validate() {
  var flen = $("form[name=addressForm] .addressChk").length;
  for (var i = 0; i < flen; i++) {
    if (
      $(".addressChk").eq(i).val() == "" ||
      $(".addressChk").eq(i).val() == null ||
      $(".addressChk").eq(i).val().trim() == "" ||
      ($(".addressChk").eq(i).is("select") && $(".addressChk").eq(i).val() == "선택")
    ) {
      alert($(".addressChk").eq(i).attr("title") + "을/를 입력해주세요.");
      $(".addressChk").eq(i).focus();
      return false;
    }
  }
}

//address
function controlAddress(ele, type) {
  var data = $(ele).closest("form")[0];
  var formdata = new FormData(data);

  //	alert(formdata.get("id"));
  var url = "";
  if (type == "update") {
    if (confirm("정말 수정 하시겠습니까?")) {
      url = "/address/update";
    } else {
      return false;
    }
  } else if (type == "delete") {
    if (confirm("정말 삭제 하시겠습니까?")) {
      url = "/address/delete";
    } else {
      return false;
    }
  }

  $.ajax({
    url: url,
    type: "POST",
    data: formdata,
    processData: false,
    contentType: false,
    success: function (data) {
      //		    window.location.href = "/user/address/list";
      //			alert('배송 정보가 성공적으로 수정되었습니다.');
      alert(data);
      location.reload();
    },
    error: function (jqXHR, textStatus, errorThrown) {
      console.log("Error: " + errorThrown);
      alert(textStatus);
      //			window.location.href = "/user/address/list";
      //			alert('배송 정보 수정에 실패했습니다. 다시 시도해주세요.');
      location.reload();
    },
  });
}

// 배송지 관리 팝업창 관련
$(function () {
  $("#address_update_btn").click(function (e) {
    $("#addressForm").attr("action", "/address/popup/update");
    $("#addressForm").submit();
  });
  $("#address_delete_btn").click(function (e) {
    if (confirm("정말 해당 배송지를 삭제하시겠습니까?")) {
      $("#addressForm").attr("action", "/address/popup/delete");
      $("#addressForm").submit();
    }
  });
  $("#address_insert_btn").click(function (e) {
    $("#addressForm").attr("action", "/address/popup/insert");
    $("#addressForm").submit();
  });

  $(".address_select_btn").click(function (e) {
    let address_popup_id = $(this).siblings(".address_popup_id").val();
    let address_popup_name = $(this).siblings(".address_popup_name").val();
    let address_popup_address = $(this).siblings(".address_popup_address").val();
    let address_popup_address2 = $(this).siblings(".address_popup_address2").val();
    let address_popup_zipcode = $(this).siblings(".address_popup_zipcode").val();
    let address_popup_phone = $(this).siblings(".address_popup_phone").val();
    let address_popup_request_option = $(this).siblings(".address_popup_request_option").val();
    let address_popup_request_text = $(this).siblings(".address_popup_request_text").val();

    $("#address_id", opener.document).val(address_popup_id);
    $("#address_name", opener.document).html(address_popup_name);
    $("#address_address", opener.document).html(address_popup_address + " , " + address_popup_address2 + " [" + address_popup_zipcode + "]");
    $("#address_phone", opener.document).html(address_popup_phone);
    $("#address_request", opener.document).html(
      address_popup_request_text == "" ? address_popup_request_option : address_popup_request_option + " / " + address_popup_request_text
    );
    window.close();
  });
});
