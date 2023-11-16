new Vue({
  el: '#searchF',
  data: {
    items: [],
    filters: {
      delivery: [],
      keep: [],
      brand: [],
      weight: []
    },
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


//new Vue({
//  el: '#searchF',
//  data: {
//    items: []
//  },
//  created: function () {
//    $.ajax({
//      url: '/rest/sale/list',
//      method: 'GET',
//      success: function (data) {
//        this.items = data;
//      }.bind(this),
//      error: function (error) {
//        console.log(error);
//      }
//    });
//  },
//    filters: {
//      delivery: [],
//      keep: [],
//      brand: [],
//      weight: []
//    },
//  computed: {
//  filteredItems: function() {
//    return this.items.filter(item => {
//      return (this.filters.delivery.length === 0 || this.filters.delivery.includes(item.delivery)) &&
//             (this.filters.keep.length === 0 || this.filters.keep.includes(item.keep)) &&
//             (this.filters.brand.length === 0 || this.filters.brand.includes(item.brand)) &&
//             (this.filters.weight.length === 0 || this.filters.weight.includes(item.weight));
//    });
//  }
//},
//methods: {
//  resetFilters: function() {
//    this.filters.delivery = [];
//    this.filters.keep = [];
//    this.filters.brand = [];
//    this.filters.weight = [];
//  }
//}
//});



//new Vue({
//  el: '#searchF',
//  data: {
//	 items: [
//	{
//		id:1, 
//		name: '산지직송 13brix 프리미엄 유라조생 감귤 5kg 3kg', 
//		discount: '50%', 
//		price: '12,800',
//		seller: '제주도 홍길동',
//		delivery: '오늘출발', 
//		keep: '냉동',
//		brand: '풀무원',
//		weight: '3~5kg',
//		imageUrl1: 'https://images.pexels.com/photos/3804878/pexels-photo-3804878.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
//    	imageUrl2: 'https://images.pexels.com/photos/1482101/pexels-photo-1482101.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
//    	
//	},
//	{
//		id:2, 
//		name: '[농장직송]귤대장 강농부의 명품 타이벡 감귤 3kg', 
//		discount: '7%', 
//		price: '14,800',
//		seller: '제주도 강씨',
//		delivery: '무료배송', 
//		keep: '실온',
//		brand: '그리닝 스텐다드',
//		weight: '1~3kg',
//		imageUrl1: 'https://images.pexels.com/photos/3804878/pexels-photo-3804878.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
//    	imageUrl2: 'https://images.pexels.com/photos/1482101/pexels-photo-1482101.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
//	},
//	{
//		id:3, 
//		name: '(국무총리상 수상)부사 장수 사과 가정용 선물세트 5kg', 
//		discount: '26%', 
//		price: '40,900',
//		seller: '제주도 강씨',
//		delivery: '오늘출발', 
//		keep: '냉장',
//		brand: '안성 인삼조합',
//		weight: '5~10kg',
//		imageUrl1: 'https://images.pexels.com/photos/3804878/pexels-photo-3804878.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
//    	imageUrl2: 'https://images.pexels.com/photos/1482101/pexels-photo-1482101.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
//	},
//],
//    filters: {
//      delivery: [],
//      keep: [],
//      brand: [],
//      weight: []
//    }
//  },
//  computed: {
//  filteredItems: function() {
//    return this.items.filter(item => {
//      return (this.filters.delivery.length === 0 || this.filters.delivery.includes(item.delivery)) &&
//             (this.filters.keep.length === 0 || this.filters.keep.includes(item.keep)) &&
//             (this.filters.brand.length === 0 || this.filters.brand.includes(item.brand)) &&
//             (this.filters.weight.length === 0 || this.filters.weight.includes(item.weight));
//    });
//  }
//},
//methods: {
//  resetFilters: function() {
//    this.filters.delivery = [];
//    this.filters.keep = [];
//    this.filters.brand = [];
//    this.filters.weight = [];
//  }
//}
//});








