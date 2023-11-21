$(function () {
  var categoryList = $("section#category_group .checkbox-input");

  categoryList.each(function (index, element) {
    if ($(element).val() == $("input[name=category_code]").val()) {
      $(element).prop("checked", true);
    }
    if ($(element).val() == $("input[name=region_code]").val()) {
      $(element).prop("checked", true);
    }
  });

  $("#search_form #search_input").keyup(function (e) {
    if (e.key === "Enter") {
      $("#search_form").submit(function (e) {});
    }
  });
});


new Vue({
  el: '#searchF',
  data: {
    items: []
  },
  created: function () {
    $.ajax({
      url: '/rest/sale/list',
      method: 'GET',
      success: function (data) {
        this.items = data;
      }.bind(this),
      error: function (error) {
        console.log(error);
      }
    });
  },
    filters: {
      delivery: [],
      keep: [],
      brand: [],
      weight: []
    },
  computed: {
  filteredItems: function() {
    return this.items.filter(item => {
      return (this.filters.delivery.length === 0 || this.filters.delivery.includes(item.delivery)) &&
             (this.filters.keep.length === 0 || this.filters.keep.includes(item.keep)) &&
             (this.filters.brand.length === 0 || this.filters.brand.includes(item.brand)) &&
             (this.filters.weight.length === 0 || this.filters.weight.includes(item.weight));
    });
  }
},
methods: {
  resetFilters: function() {
    this.filters.delivery = [];
    this.filters.keep = [];
    this.filters.brand = [];
    this.filters.weight = [];
  }
}
});







//$("input[type='checkbox']").change(filter);
//
//function filter() {
//  // 선택된 체크박스의 값을 배열로 저장
//  let selectedOptions = $("input[type='checkbox']:checked").map(function() {
//    return $(this).parent().text().trim();
//  }).get();
//
//  // 각 상품에 대해
//  $(".product").each(function() {
//    let product = $(this);
//    let productOptions = product.data('options').split(','); // 상품의 옵션을 배열로 저장
//
//    // 선택된 체크박스의 모든 값이 상품의 옵션에 포함되어 있는지 확인
//    let matchesAll = selectedOptions.every(function(option) {
//      return productOptions.includes(option);
//    });
//
//    // 모든 값이 포함되어 있다면 상품을 표시, 그렇지 않다면 상품을 숨김
//    if (matchesAll) {
//      product.show();
//    } else {
//      product.hide();
//    }
//  });
//}




//export default function FilterPage(props) {
//  const filterData = [
//    { key: "0", value: "오늘출발", checked: false },
//    { key: "1", value: "무료배송", checked: false },
//    { key: "2", value: "냉동", checked: false },
//    { key: "3", value: "냉장", checked: false },
//    { key: "4", value: "실온", checked: false },
//    { key: "5", value: "풀무원", checked: false },
//    { key: "6", value: "그리닝 스텐다드", checked: false },
//    { key: "7", value: "안성 인삼조합", checked: false },
//    { key: "8", value: "500g 이하", checked: false },
//    { key: "9", value: "500g ~1kg", checked: false },
//    { key: "10", value: "1~3kg", checked: false },
//    { key: "11", value: "3~5kg", checked: false },
//    { key: "12", value: "5~10kg", checked: false },
//    { key: "13", value: "10kg 이상", checked: false },
//
//  ];
//
//  const onChangeFilter = (checked, item) => {
//    if (checked) {
//      props.setMoodHashTag([...props.moodHashTag, item]);
//    } else if (!checked) {
//      props.setMoodHashTag(props.moodHashTag.filter((el) => el !== item));
//    }
//  };
//
//  return (
//    <div id="filter" className="position-relative d-flex flex-column float-start w-200px border border-1">
//      {filterData.map((el) => (
//        <label className="checkbox" key={el.key}>
//          <input
//            type="checkbox"
//            name="s_addr"
//            value={el.value}
//            onChange={(e) => {
//              onChangeFilter(e.target.checked, e.target.value);
//            }}
//            checked={props.moodHashTag.includes(el.value)}
//          />
//          {el.value}
//        </label>
//      ))}
//    </div>
//  );
//}


