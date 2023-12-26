var idCheck = false;
var passwordCheck = false; // 비밀번호 확인이 맞는지
var passwordCheck2 = false; // 비밀번호 유효성이 맞는지
var emailCheck = false;
var nameCheck = false;
var phoneCheck = false;

$(function () {
  // * 변경 버튼 처리
  $("#id_change").click(function (e) {
    if ($(this).html() == "아이디 변경") {
      $(this).html("아이디 변경 취소");
      buttonOn(this);
    } else {
      $(this).html("아이디 변경");
      buttonOff(this);
    }
  });
  $("#email_change").click(function (e) {
    if ($(this).html() == "이메일 변경") {
      $(this).html("이메일 변경 취소");
      buttonOn(this);
    } else {
      $(this).html("이메일 변경");
      buttonOff(this);
    }
  });
  $("#name_change").click(function (e) {
    if ($(this).html() == "개명하셨다면? 이름 변경") {
      $(this).html("이름 변경 취소");
      buttonOn(this);
    } else {
      $(this).html("개명하셨다면? 이름 변경");
      buttonOff(this);
    }
  });
  $("#phone_change").click(function (e) {
    if ($(this).html() == "휴대폰 변경") {
      $(this).html("휴대폰 변경 취소");
      buttonOn(this);
    } else {
      $(this).html("휴대폰 변경");
      buttonOff(this);
    }
  });

  // * 변경 요청 버튼 처리

  // * 회원 탈퇴 처리 (버튼)
  $("#delete_user").click(function (e) {
    if (confirm("정말로 탈퇴하시겠습니까?")) {
      authFormSubmit(this);
    }
  });

  // 개인정보 변경 요청 처리 - 아이디
  $("#id-change-submit").click(function (e) {
    if (idCheck) {
      authFormSubmit(this);
    } else {
      alert("입력하신 아이디가 이미 존재하거나 형식에 맞지 않습니다.");
    }
  });
  // 개인정보 변경 요청 처리 - 이메일
  $("#email-change-submit").click(function (e) {
    if (emailCheck) {
      authFormSubmit(this);
    } else {
      alert("입력하신 이메일이 형식에 맞지 않습니다.");
    }
  });
  $("#name-change-submit").click(function (e) {
    if (nameCheck) {
      authFormSubmit(this);
    } else {
      alert("입력하신 이름이 형식에 맞지 않습니다(2글자 이상)");
    }
  });
  $("#phone-change-submit").click(function (e) {
    if (phoneCheck) {
      authFormSubmit(this);
    } else {
      alert("입력하신 휴대폰번호가 이미 존재하거나 형식에 맞지 않습니다.");
    }
  });
  $("#password-change-submit").click(function (e) {
    if (passwordCheck && passwordCheck2) {
      authFormSubmit(this);
    } else {
      alert("비밀번호가 같지 않거나 형식에 맞지 않습니다");
    }
  });

  // ? ID 체크
  $("#idCheck").on("propertychange change input paste", function () {
    idCheck = false;
    var regex = /^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{6,15}$/;
    var str = $("#idCheck").val();
    if (regex.test(str)) {
      textPrimary("#id_text");
      $.ajax({
        async: true,
        type: "post",
        url: "/auth/id-check",
        data: {id: $("#idCheck").val()},
        dataType: "json",
        success: function (data) {
          if (data.cnt > 0) {
            //이미 존재하는 아이디
            $("font[id=warning]").text("");
            $("font[id=warning]").attr("color", "red");
            $("font[id=warning]").text("이미 존재하는 아이디 입니다.");
            $("#idCheck").focus();
            idCheck = false;
          } else {
            //사용가능한 아이디
            $("font[id=warning]").text("");
            $("font[id=warning]").attr("color", "blue");
            $("font[id=warning]").text("사용가능한 아이디 입니다.");
            $("#idCheck").focus();
            idCheck = true;
          }
        },
      });
    } else {
      textDanger("#id_text");
      $("font[id=warning]").text("");
    }
  });
  $("#name_check").on("propertychange change input paste", function () {
    if ($(this).val().length >= 2) {
      nameCheck = true;
    } else {
      nameCheck = false;
    }
  });

  // ? 이메일 체크
  $("#email_chk").on("propertychange change input paste", function () {
    var str = $("#email_chk").val();
    var atPos = str.indexOf("@");
    var atLastPos = str.lastIndexOf("@");
    var dotPos = str.indexOf(".");
    var spacePos = str.indexOf(" ");
    var commaPos = str.indexOf(",");
    var eMailSize = str.length;

    if (!(atPos > 1 && atPos == atLastPos && dotPos > 3 && spacePos == -1 && commaPos == -1 && atPos + 1 < dotPos && dotPos + 1 < eMailSize)) {
      textDanger("#email_text");
      emailCheck = false;
    } else {
      textPrimary("#email_text");
      emailCheck = true;
    }
  });
  // ? 휴대폰 체크
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
          if (data.cnt > 0) {
            //이미 존재하는 아이디
            $("font[id=phone_font]").text("");
            $("font[id=phone_font]").attr("color", "red");
            $("font[id=phone_font]").text("이미 사용중인 번호 입니다.");
            phoneCheck = false;
          } else {
            //사용가능한 아이디
            $("font[id=phone_font]").text("");
            $("font[id=phone_font]").attr("color", "blue");
            $("font[id=phone_font]").text("사용가능한 번호 입니다.");
            phoneCheck = true;
          }
        },
      });
    } else {
      textDanger("#phone_text");
      phoneCheck = false;
    }
  });

  // ? 패스워드 체크
  $("#new_password, #re_password").keyup(function () {
    var password = $("#new_password").val();
    var email = $("#hidden_email").val().split("@")[0];
    validatePassword(password, email);
    if ($("#new_password").val() != $("#re_password").val()) {
      textDanger("#password_text_04");
      passwordCheck = false;
    } else if ($("#re_password").val() == "") {
      textDanger("#password_text_04");
      passwordCheck = false;
    } else {
      textPrimary("#password_text_04");
      passwordCheck = true;
    }
  });
});

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

function buttonOn(ele) {
  $(ele).removeClass("btn-light");
  $(ele).addClass("btn-dark");
  $(ele).next("form").removeClass("visually-hidden");
}

function buttonOff(ele) {
  $(ele).addClass("btn-light");
  $(ele).removeClass("btn-dark");
  $(ele).next("form").addClass("visually-hidden");
}

// 비밀번호 유효성 검사
function validatePassword(password, email) {
  var lengthCheck = false;
  var combinationCheck = false;
  var sameCheck = false;
  var emailCheck = false;

  // 1. 비밀번호 길이 체크 (8~20자)
  if (password.length < 8 || password.length > 20) {
    textDanger("#password_text_01");
    lengthCheck = false;
  } else {
    lengthCheck = true;
    // 2. 영문/숫자/특수문자 중 2가지 이상 조합 확인
    var check = 0;
    if (/[A-Za-z]/.test(password)) check++; // 영문 포함 체크
    if (/[0-9]/.test(password)) check++; // 숫자 포함 체크
    if (/[\!\@\#\$\%\^\&\*\(\)\_\+\[\]\{\}\;\:\/\?\.\,\>\<\~\`\|\-]/.test(password)) check++; // 특수문자 포함 체크

    if (check < 2) {
      combinationCheck = false;
      textDanger("#password_text_01");
    } else {
      combinationCheck = true;
      textPrimary("#password_text_01");
    }
  }

  // 3. 3개 이상 연속되거나 동일한 문자/숫자 제외
  for (var i = 0; i < password.length - 2; i++) {
    var char = password[i];
    if (char === password[i + 1] && char === password[i + 2]) {
      sameCheck = false;
      textDanger("#password_text_02");
    } else {
      sameCheck = true;
      textPrimary("#password_text_02");
    }
  }

  // 4. 아이디(이메일) 제외
  if (password.includes(email)) {
    emailCheck = false;
    textDanger("#password_text_03");
  } else {
    emailCheck = true;
    textPrimary("#password_text_03");
  }

  // 비밀번호 유효성 체크 승인
  if (lengthCheck && combinationCheck && sameCheck && emailCheck) {
    passwordCheck2 = true;
  } else {
    passwordCheck2 = false;
  }
}

function authFormSubmit(ele) {
  var form = $(ele).parent("form").get(0);
  var url = $(ele).parent("form").attr("action");
  var formData = new FormData(form);
  console.log(form + url + formData);

  $.ajax({
    type: "POST",
    url: url,
    data: formData,
    dataType: "json",
    processData: false,
    contentType: false,
    success: function (response) {
      alert(response.msg);
      if (response.url != null) {
        location.href = response.url;
      } else {
        location.reload();
      }
    },
    error: function (xhr, status, error) {
      // UNAUTHORIZED
      if (xhr.status == 401) {
        alert("로그인 이후 이용 바랍니다.");
        window.location.href = "/auth/login";
      }
      // BAD_REQUEST
      else if (xhr.status == 400) {
        alert("현재 비밀번호가 맞지 않습니다. 다시 입력하십시오");
      }
    },
  });
}
