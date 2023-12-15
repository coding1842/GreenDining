$(function () {
  /*  var categoryList = $("section#category_group .checkbox-input");

  categoryList.each(function (index, element) {
    if ($(element).val() == $("input[name=category_code]").val()) {
      $(element).prop("checked", true);
    }
    if ($(element).val() == $("input[name=region_code]").val()) {
      $(element).prop("checked", true);
    }
  }); */

  $("#search_form #search_input").keyup(function (e) {
    if (e.key === "Enter") {
      $("#search_form").submit(function (e) {});
    }
  });
});

function filterControl(name, value) {
  $("#search_form input[name=" + name + "]").val(value);
}
