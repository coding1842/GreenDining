$(function () {
  $("#btnradio1").click(function (e) {
    $("#user_find").attr("style", "display:block");
    $("#business_find").attr("style", "display:none");
  });

  $("#btnradio2").click(function (e) {
    $("#user_find").attr("style", "display:none");
    $("#business_find").attr("style", "display:block");
  });

  $("#modify-check-ok").click(function (e) {
    modifyCheck();
  });
  $("#modify-check-no").click(function (e) {
    window.location.href = "/user/my-page";
  });
});

function modifyCheck() {
  var form = $("#modify-check-form").get(0);
  var formData = new FormData(form);

  $.ajax({
    type: "POST",
    url: "/auth/password-check",
    data: formData,
    dataType: "json",
    processData: false, // FormData 객체를 직렬화하지 않음
    contentType: false, // 요청 본문의 타입을 'multipart/form-data'로 자동 설정
    success: function (response) {
      window.location.href = "/user/my-page/modify-form";
    },
    error: function (error, two, three) {
      alert("비밀번호가 틀립니다.");
      console.log(Object.keys(error));
    },
  });
}
