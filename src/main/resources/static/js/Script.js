// import $ from 'jquery';
// // import Swiper JS
// import Swiper from 'swiper';
// // import Swiper styles
// import 'swiper/css';

$(function () {
  // ! Aside 우측 박스 열었다 닫았다
  $("#open_switch").click(function (e) {
    $("#close_box").toggleClass("visually-hidden");
    $("#open_box").toggleClass("visually-hidden");
  });

  $("#close_switch").click(function (e) {
    $("#close_box").toggleClass("visually-hidden");
    $("#open_box").toggleClass("visually-hidden");
  });

  // ! 카테고리 박스 온오프 관련
  $("#category_button").hover(
    function () {
      $("#category_box").removeClass("visually-hidden");
      $("#category_box_inside").addClass("visually-hidden");
      $("#category_box_inside_last").addClass("visually-hidden");
    },
    function () {
      $("#category_box").addClass("visually-hidden");
    }
  );
  // ! 카테고리 박스 1차-2차 내부 온오프
  $("#category_box_outside a").mouseover(function () {
    $("#category_box_inside").removeClass("visually-hidden");
    $("#category_box_inside_last").addClass("visually-hidden");
    $("#category_box_inside div").addClass("visually-hidden");
    var insideId = $(this).data("inside");
    $("#" + insideId).toggleClass("visually-hidden");
  });
  // ! 카테고리 박스 2차-3차 내부 온오프
  $("#category_box_inside a").mouseover(function () {
    $("#category_box_inside_last").removeClass("visually-hidden");
    $("#category_box_inside_last div").addClass("visually-hidden");
    var insideId = $(this).data("inside");
    $("#" + insideId).toggleClass("visually-hidden");
  });

  $("#category_box_inside_last").mouseleave(function () {
    $("#category_box_inside_last").addClass("visually-hidden");
  });

  const swiper = new Swiper(".mainSwiper", {
    slidesPerView: 1, // 한 화면에 보이는 슬라이드 개수
    spaceBetween: 50, // 슬라이드 사이의 간격 (px)
    speed: 600,
    parallax: true,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    loop: true,
    autoplay: {
      delay: 4000,
      disableOnInteraction: false,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
  });

  const swiper2 = new Swiper(".bestSwiper", {
    slidesPerView: 5, // 한 화면에 보이는 슬라이드 개수
    spaceBetween: 30, // 슬라이드 사이의 간격 (px)
    speed: 600,
    slidesPerGroup: 5,

    navigation: {
      nextEl: ".swiper-button-next_2",
      prevEl: ".swiper-button-prev_2",
    },
  });

  swiper.update();
  swiper2.update();
});

// =======================================

function scrollToTop() {
  $("html, body").animate({scrollTop: 300}, "fast");
}

function checkedCategory(ele, category) {
  $(".checkbox-input").prop("checked", false);
  $(ele).prop("checked", true);
}


function uploadImageTest() {
  var bodyData = new FormData();
  var imageFileList = $("#upload_image").get(0).files;
  var CLIENT_ID = "898c7032bf09d08";
  for (var i = 0; i < files.length; i++) {
    var file = imageFileList[i];
    bodyData.append("image", file);

    fetch("https://api.imgur.com/3/image", {
      method: "POST",
      headers: {
        Authorization: "Client-ID " + CLIENT_ID,
        Accept: "application/json",
      },
      body: bodyData,
    });
  }
}


//============================사업자 마이페이지 드롭다운 버튼
const dropdownElementList = document.querySelectorAll('.dropdown-toggle')
const dropdownList = [...dropdownElementList].map(dropdownToggleEl => new bootstrap.Dropdown(dropdownToggleEl))

