var index = 1;

$(document).ready(function () {
  $("#add_product").click(function () {
    var newField = $(".saleProductDTO:first").clone(true); // 첫 번째 .saleProductDTO 요소를 복사합니다.

    // 복사된 요소의 각 입력 필드의 name 속성을 변경합니다.
    newField.find("select#product_id").attr("name", "saleProductDTOList[" + index + "].product_id");
    newField.find("select#sale_type").attr("name", "saleProductDTOList[" + index + "].sale_type");

    newField.find("input").each(function (i) {
      var inputName = $(this)
        .attr("name")
        .replace("[0]", "[" + index + "]");
      $(this).attr("name", inputName);
    });

    newField.find("input").val("");
    $("#product_container").append(newField); // 복사된 요소를 #product_container에 추가합니다.
    index++;
  });

  $("#remove_product").click(function () {
    if ($(".saleProductDTO").length > 1) {
      // 초기 요소는 삭제되지 않도록 합니다.
      $(".saleProductDTO:last").remove(); // 가장 최근에 생성된 .saleProductDTO 요소를 삭제합니다.
      index--;
    }
  });
});
