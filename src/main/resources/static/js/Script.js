$(function () {
  $("#open_switch").click(function (e) {
    $("#close_box").toggleClass("visually-hidden");
    $("#open_box").toggleClass("visually-hidden");
  });

  $("#close_switch").click(function (e) {
    $("#close_box").toggleClass("visually-hidden");
    $("#open_box").toggleClass("visually-hidden");
  });
});

$(function () {
  $(selector).click(function (e) {
    e.preventDefault();
  });
});
// =======================================

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

function scrollToTop() {
  $("html, body").animate({scrollTop: 300}, "fast");
}

function checkedCategory(ele, category) {
  $(".checkbox-input").prop("checked", false);
  $(ele).prop("checked", true);
}
