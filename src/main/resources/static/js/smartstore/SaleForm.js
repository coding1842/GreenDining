$(document).ready(function () {
  $("#add_product").click(function () {
    var newField = $(".saleProductDTO:first").clone(true); // 첫 번째 .saleProductDTO 요소를 복사합니다.
    var length = $(".saleProductDTO").length;
    // 복사된 요소의 각 입력 필드의 name 속성을 변경합니다.
    newField.find("select.product_id").attr("name", "saleProductDTOList[" + length + "].product_id");
    newField.find("select.sale_type").attr("name", "saleProductDTOList[" + length + "].sale_type");

    newField.find("input").each(function (i) {
      var inputName = $(this)
        .attr("name")
        .replace("[0]", "[" + length + "]");
      $(this).attr("name", inputName);
    });

    newField.find("input").val("");
    $("#product_container").append(newField); // 복사된 요소를 #product_container에 추가합니다.
  });

  $("#remove_product").click(function () {
    if ($(".saleProductDTO").length > 1) {
      $(this).parent(".saleProductDTO").remove();
      indexOranize();
    } else {
      alert("판매할 상품은 1개이상 존재해야 합니다.");
    }
  });
});

function indexOranize() {
  $("#product_container .saleProductDTO").each(function (i) {
    $(this)
      .find("select.product_id")
      .attr("name", "saleProductDTOList[" + i + "].product_id");

    $(this)
      .find("select.sale_type")
      .attr("name", "saleProductDTOList[" + i + "].sale_type");

    $(this)
      .find("input.saleProduct_name")
      .attr("name", "saleProductDTOList[" + i + "].name");
  });
}
