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

// =======================================

const swiper = new Swiper(".swiper", {
  // Optional parameters
  direction: "horizontal",
  loop: true,

  // If we need pagination
  pagination: {
    el: ".swiper-pagination",
  },

  // Navigation arrows
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },

  // And if we need scrollbar
  scrollbar: {
    el: ".swiper-scrollbar",
    enabled: false,
  },
});

swiper.update();

function scrollToTop() {
  $("html, body").animate({scrollTop: 0}, "fast");
}
