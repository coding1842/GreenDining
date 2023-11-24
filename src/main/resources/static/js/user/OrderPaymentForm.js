$(function () {
  checkOrderTotal();
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

    total_payment_price += after_price;
  });

  total_payment_price += 2500;
  $("#payment_info #total_price").text(total_price.toLocaleString("en-US") + "원");
  $("#payment_info #discount_price").text(discount_price.toLocaleString("en-US") + "원");
  $("#payment_info #total_payment_price").text(total_payment_price.toLocaleString("en-US") + "원");
}
