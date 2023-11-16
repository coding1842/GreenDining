function imgurProcess() {
  // 선행 조건
  // form#ajaxForm 이어야 한다
  // name이 fileList인 input:file이 존재해야한다.
  var imageData = new FormData();
  var formUrl = $("form#ajaxForm").attr("action");
  var files = $("input[type=file][name=fileList]")[0].files;
  for (var i = 0; i < files.length; i++) {
    imageData.append("fileList", files[i]);
  }

  var form = $("form#ajaxForm").get(0);
  var formData = new FormData(form);
  var imgurUrl = $("#url").val();

  // 파일 정보가 있으면 업로드 합니다
  if (imageData.get("fileList") != undefined) {
    $.ajax({
      type: "post",
      url: imgurUrl,
      data: imageData,
      dataType: "json",
      processData: false, // FormData 객체를 직렬화하지 않음
      contentType: false, // 요청 본문의 타입을 'multipart/form-data'로 자동 설정
      success: function (response) {
        formData.append("image_group_id", response.image_group_id);
        $.ajax({
          type: "post",
          url: formUrl,
          data: formData,
          processData: false, // FormData 객체를 직렬화하지 않음
          contentType: false, // 요청 본문의 타입을 'multipart/form-data'로 자동 설정
          dataType: "json",
        });
      },
      error: function (jqXHR, textStatus, errorThrown) {
        alert("ERROR : ", textStatus, errorThrown);
      },
    });
  }
  // 없으면 데이터만 전달
  else {
    $.ajax({
      type: "post",
      url: formUrl,
      data: formData,
      processData: false, // FormData 객체를 직렬화하지 않음
      contentType: false, // 요청 본문의 타입을 'multipart/form-data'로 자동 설정
      dataType: "json",
    });
  }
}

$(function () {
  $("#imgur_push").click(function (e) {
    imgurProcess();
  });
});

function serialize() {
  var data = $("form").serialize();
  var url = $("form").attr("action");
  $.ajax({
    type: "post",
    url: url,
    data: data,
    success: function (response) {},
  });
}
