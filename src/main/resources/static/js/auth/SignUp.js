/**
 * 쇼핑몰의 공통스크립트
 */

$().ready(function () {
  var idchk = 1;
  var pcheck = true; //두개가 다르면 true, 같으면 false
  var phoneCheck = true;
  // 가입 요청시 유효성 검사
  $("#submit11").on("click", function () {
    if (validate()) {
      if (idchk == 1) {
        alert("아이디 중복\n다시 입력해주세요");
        $("#idchk").focus();
        return false;
      }
      if (pcheck) {
        alert("패스워드가 다릅니다.");
        return false;
      }
      if (phoneCheck) {
        alert("해당 휴대폰 번호로 이미 가입된 계정이 있습니다.");
        return false;
      }
    }
    $(".checkbox_group input").each(function (idx, ele) {
      if (!$(ele).is(":checked")) {
        alert("이용약관을 체크해주세요.");
        $(ele).focus();
        return false;
      }
    });
    $("form").submit();
  });

  // 아이디 유효성,중복 체크
  $("#idchk").on("propertychange change input paste", function () {
    var regex = /^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{6,15}$/;
    var str = $("#idchk").val();
    if (regex.test(str)) {
      textPrimary("#id_text");
      $.ajax({
        async: true,
        type: "post",
        url: "/auth/id-check",
        data: {ID: $("#idchk").val()},
        dataType: "json",
        success: function (data) {
          if (data > 0) {
            //이미 존재하는 아이디
            $("font[id=warning]").text("");
            $("font[id=warning]").attr("color", "red");
            $("font[id=warning]").text("이미 존재하는 아이디 입니다.");
            $("#idchk").focus();
            idchk = 1;
          } else {
            //사용가능한 아이디
            $("font[id=warning]").text("");
            $("font[id=warning]").attr("color", "blue");
            $("font[id=warning]").text("사용가능한 아이디 입니다.");
            $("#idchk").focus();
            idchk = 0;
          }
        },
      });
    } else {
      textDanger("#id_text");
      $("font[id=warning]").text("");
    }
  });

  $("#user_email").on("propertychange change input paste", function () {
    var str = $("form[name='form1'] input#user_email").val();
    var atPos = str.indexOf("@");
    var atLastPos = str.lastIndexOf("@");
    var dotPos = str.indexOf(".");
    var spacePos = str.indexOf(" ");
    var commaPos = str.indexOf(",");
    var eMailSize = str.length;

    if (!(atPos > 1 && atPos == atLastPos && dotPos > 3 && spacePos == -1 && commaPos == -1 && atPos + 1 < dotPos && dotPos + 1 < eMailSize)) {
      textDanger("#email_text");
    } else {
      textPrimary("#email_text");
    }
  });

  $("#name_check").on("propertychange change input paste", function () {
    if ($(this).val().length >= 2) {
      textPrimary("#name_text");
    } else {
      textDanger("#name_text");
    }
  });

  $("#phone_check").on("propertychange change input paste", function () {
    if ($(this).val().length == 11) {
      textPrimary("#phone_text");

      $.ajax({
        async: true,
        type: "post",
        url: "/auth/phone-check",
        data: {phone: $("#phone_check").val()},
        dataType: "json",
        success: function (data) {
          if (data > 0) {
            //이미 존재하는 아이디
            $("font[id=phone_font]").text("");
            $("font[id=phone_font]").attr("color", "red");
            $("font[id=phone_font]").text("이미 사용중인 번호 입니다.");
            phoneCheck = true;
          } else {
            //사용가능한 아이디
            $("font[id=phone_font]").text("");
            $("font[id=phone_font]").attr("color", "blue");
            $("font[id=phone_font]").text("사용가능한 번호 입니다.");
            phoneCheck = false;
          }
        },
      });
    } else {
      textDanger("#phone_text");
    }
  });

  // 패스워드 유효성,중복 체크
  $("#check1, #check2").keyup(function () {
    var password = $("#check1").val();
    var email = $("#user_email").val().split("@")[0];
    validatePassword(password, email);
    $("font[id=check]").text("");
    if ($("#check1").val() != $("#check2").val()) {
      textDanger("#password_text_04");
      pcheck = true;
    } else if ($("#check2").val() == "") {
      textDanger("#password_text_04");
      pcheck = true;
    } else {
      textPrimary("#password_text_04");
      pcheck = false;
    }
  });
  $(".aclick").on("click", function () {
    var on_off = $("input[name=Keyonoff]").val();
    if (on_off == "off") {
      alert("로그인이 필요합니다.");
      location.href = "/login";
    } else if (on_off == "on") {
      location.href = "/productList";
    }
  });

  $("#check_all").click(function (e) {
    var checked = $("#check_all").is(":checked");

    if (checked) {
      $(".checkbox_group input").prop("checked", true);
    } else {
      $(".checkbox_group input").prop("checked", false);
    }
  });

  $(".checkbox_group input")
    .not("#check_all")
    .click(function (e) {
      $("#check_all").prop("checked", false);
    });

  $("#business_name_check").on("propertychange input paste change", function () {
    if ($(this).val().length >= 2) {
      textPrimary("#business_name_text");
    } else {
      textDanger("#business_name_text");
    }
  });
  $("#business_number_check").on("propertychange input paste change", function () {
    if ($(this).val().length == 10) {
      textPrimary("#business_number_text");
    } else {
      textDanger("#business_number_text");
    }
  });
});

// READY OUT

// 회원가입 하는데 입력한 정보가 다 입력 됬는지 유효성 검사 이메일 주소 형식 확인 chk에 대해서 점검
function validate() {
  var flen = $("form[name=form1] .chk").length;
  for (var i = 0; i < flen; i++) {
    if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null || $(".chk").eq(i).val().trim() == "") {
      alert($(".chk").eq(i).attr("title") + "은/는 필수입력");
      $(".chk").eq(i).focus();
      return false;
    }
  }

  return true;
}

function shopDetail(no) {
  alert(no);
  $("#no").val(no);
  document.detail.submit();
}

// 비밀번호 유효성 검사
function validatePassword(password, email) {
  // 1. 비밀번호 길이 체크 (8~20자)
  if (password.length < 8 || password.length > 20) {
    textDanger("#password_text_01");
  } else {
    // 2. 영문/숫자/특수문자 중 2가지 이상 조합 확인
    var check = 0;
    if (/[A-Za-z]/.test(password)) check++; // 영문 포함 체크
    if (/[0-9]/.test(password)) check++; // 숫자 포함 체크
    if (/[\!\@\#\$\%\^\&\*\(\)\_\+\[\]\{\}\;\:\/\?\.\,\>\<\~\`\|\-]/.test(password)) check++; // 특수문자 포함 체크

    if (check < 2) {
      textDanger("#password_text_01");
    } else {
      textPrimary("#password_text_01");
    }
  }

  // 3. 3개 이상 연속되거나 동일한 문자/숫자 제외
  for (var i = 0; i < password.length - 2; i++) {
    var char = password[i];
    textPrimary("#password_text_02");
    if (char === password[i + 1] && char === password[i + 2]) {
      textDanger("#password_text_02");
    }
  }

  // 4. 아이디(이메일) 제외
  if (password.includes(email)) {
    textDanger("#password_text_03");
  } else {
    textPrimary("#password_text_03");
  }
}

function textPrimary(id) {
  $(id).removeClass("text-danger");
  $(id).addClass("text-primary");
  $(id).find("span").html("done");
}

function textDanger(id) {
  $(id).addClass("text-danger");
  $(id).removeClass("text-primary");
  $(id).find("span").html("close");
}
