<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/css/smartstore/productList.css" />
<link rel="stylesheet" href="/css/user/MyPage.css" />
 <script src="/js/smartstore/ProductPrice.js"></script>
<body>
<div id="pList_box">
<div class="merchant_page_box">
  <div class="merchant_aside_box">
    <div id="mer_aside"> 
<ul class="list-group list-group-flush" id="aside_list_sort"> 
	<li class="list-group-item">
		<div class="dropdown">
		  <button>상품관리</button>
			  <div class="dropdown-options">
			    <a href="/merchant/my-page/product/list">상품 리스트</a><br>
			    <a href="/product/write">상품 등록</a><br>
			  </div>
		 </div>
    </li>
	<li class="list-group-item">
		<div class="dropdown">
		  <button>판매글</button>
		  	<div class="dropdown-options">
			    <a href="/merchant/my-page/item/list">판매글 리스트</a><br>
			    <a href="/item/write">판매글 등록</a><br>
		 	</div>
		</div>
    </li>
	<li class="list-group-item">
		<div class="dropdown">
		  <button>주문/배송</button>
		  	<div class="dropdown-options">
			    <a href="/merchant/my-page/delivery/list">배송 관리</a><br>
			    <a href="#">주문 조회</a><br>
		 	</div>
		</div>
    </li>
	<li class="list-group-item">
		<div class="dropdown">
		  <button>판매자 정보</button>
			  <div class="dropdown-options">
			    <a href="#">계정 정보</a><br>
			    <a href="#">비밀번호 변겅</a><br>
			  </div>
	    </div>
    </li>
	<li class="list-group-item">
		<div class="dropdown">
		  <button>공지사항</button>
			  <div class="dropdown-options">
			    <a href="#">공지사항 리스트</a><br>
			    <a href="#">공지사항 등록</a><br>
			  </div>
	    </div>
	</li>
</ul>
    
    </div>
  </div>
  <div id="productPage_main_box">
   	<div>
		<p style="text-align: center; font-size: 30px;">상품 목록</p>
		
	</div>
<table class="table table-hover" id="pList_table">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">상품 이름</th>
      <th scope="col">무게</th>
      <th scope="col">상품 가격</th>
      <th scope="col">재고 수량</th>
      <th scope="col">수정/삭제</th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
  <c:choose>
  	<c:when test="${fn:length(productPage.content)>0 }">
        <c:forEach var="product" items="${productPage.content}">
            <tr>
           <form id="dProductForm${product.id}" method="post" action="/product/delete/${product.id}">
              <th scope="row">${product.id}</th>
              <td><a href="#">${product.name}</a></td>
              <td>${product.weight}&nbsp;g</td>
              <td class="price11">${product.price}&nbsp;원</td>
              <td>${product.stock}&nbsp;개</td>
              <td id="del_btn">
              	<input id="updataForm" onclick="location.href='/product/write/${product.id}'" type="button" value="수정">&nbsp;
<!--               	<input id="deleteBtn" type="button" value="삭제"> -->
				<input id="deleteBtn${product.id}" type="button" value="삭제">
              </td>
            </form>
            </tr>
        </c:forEach>
        <div class="pagination">
		  <div class="size-selector">
		    <select id="size" onchange="changeSize()">
		      <option value="5">5</option>
		      <option value="10">10</option>
		      <option value="20">20</option>
		    </select>
		  </div>
		  <c:if test="${productPage.first == false}">
<%-- 		    <a href="?page=0&size=${size}"><<</a> --%>
<%-- 		    <a href="?page=${productPage.number - 1}&size=${size}"><</a> --%>
		    	<a href="javascript:changePage(0)"><<</a>
				<a href="javascript:changePage(${productPage.number - 1})"><</a>
		  </c:if>
		  <c:forEach begin="0" end="${productPage.totalPages -1}" step="1" var="page">
		    <c:choose>
		      <c:when test="${page == productPage.number}">
		        <span class="current">${page + 1}</span>
		      </c:when>
		      <c:otherwise>
		        <a href="?page=${page}&size=${size}">${page + 1}</a>
		      </c:otherwise>
		    </c:choose>
		  </c:forEach>
		  <c:if test="${productPage.last == false}">
<%-- 		    <a href="?page=${productPage.number + 1}&size=${size}">></a> --%>
<%-- 		    <a href="?page=${productPage.totalPages - 1}&size=${size}">>></a> --%>
		  		<a href="javascript:changePage(${productPage.number + 1})">></a>
				<a href="javascript:changePage(${productPage.totalPages - 1})">>></a>
		  </c:if>
		</div>
    </c:when>
    <c:when test="${fn:length(productPage.content)==0}">
    	<tr style="text-align:center; height: 30px;">
			<th colspan="6">등록된 상품이 없습니다.</th></tr>
    </c:when>
  </c:choose>
  
  </tbody>
</table>
	<div id="addProductBtn">
		<input type="button" onclick="location.href='/product/write'" value="상품 등록">
	</div>
	</div>
	  </div>
	</div>
</body>
<script>
window.onload = function() {
    // URL에서 'size' 파라미터를 가져옵니다.
    var urlParams = new URLSearchParams(window.location.search);
    var size = urlParams.get('size');

    // 'size' 파라미터를 select box의 선택 값으로 설정합니다.
    var selectBox = document.getElementById('size');
    selectBox.value = size;
};

</script>
<script>
var currentPage = ${productPage.number};  // 현재 페이지 번호 초기화
var currentSize = ${size};  // 현재 페이지 사이즈 초기화

window.onload = function() {
  document.getElementById("size").value = currentSize;  // 페이지 로드 시 선택된 사이즈로 설정
};

function changeSize() {
  currentSize = document.getElementById("size").value;  // 페이지 사이즈 변경 시 사이즈 업데이트
  window.location.href = "?page=0"  + "&size=" + currentSize;
}

function changePage(page) {
  currentPage = page;  // 페이지 이동할 때마다 페이지 번호 업데이트
  window.location.href = "?page=" + currentPage + "&size=" + currentSize;
}

$("[id^='deleteBtn']").click(function() {
    var con = confirm("정말로 삭제하시겠습니까?");
    if (con) {
        var id = this.id.replace("deleteBtn", "");
        $("#dProductForm" + id).submit();
    }
});
</script>
	
