<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<link rel="stylesheet" href="/css/smartstore/DeliveryList.css" />
<link rel="stylesheet" href="/css/user/MyPage.css" />
<script src="/js/smartstore/DeliveryList.js"></script>
<div id="delivery_box">
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
			    <a href="/product/write/{product-id}">상품 수정</a><br>
			  </div>
		 </div>
    </li>
	<li class="list-group-item">
		<div class="dropdown">
		  <button>판매글</button>
		  	<div class="dropdown-options">
			    <a href="/merchant/my-page/item/list">판매글 리스트</a><br>
			    <a href="#">판매글 등록</a><br>
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
  <div id="delivery_main_box">
    <div id="delivery_top">
		<p style="font-size: 30px;">배송관리</p>
		<div id="deliveryT_it_box">
			<div id="deliveryT_it">
				<div class="or_guide_2">
						<div class="or_guide_img">
							<i class="fa-solid fa-money-bill-1-wave" style="color: #8a8a8a;"></i>
							<p style="margin: 0;">결제완료</p>
							<p style="font-size: 20px;">${completedPaymentOrders}</p>
						</div>
					<div class="or_guide_right">
						<i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>					
					</div>
					<div class="or_guide_img">
						<i class="fa-solid fa-box-open" style="color: #8a8a8a;"></i>
						<p style="margin: 0;">상품준비중</p>
						<p style="font-size: 20px;">${preparingOrders}</p>
					</div>
					<div class="or_guide_right">
						<i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>					
					</div>
					<div class="or_guide_img">
						<i class="fa-solid fa-gift" style="color: #8a8a8a;"></i>
						<p style="margin: 0;">배송시작</p>
						<p style="font-size: 20px;">${deliveryStartedOrders}</p>
					</div>
					<div class="or_guide_right">
						<i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>					
					</div>
					<div class="or_guide_img">
						<i class="fa-solid fa-truck" style="color: #8a8a8a;"></i>
						<p style="margin: 0;">배송중</p>
						<p style="font-size: 20px;">${deliveringOrders}</p>
					</div>
					<div class="or_guide_right">
						<i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>					
					</div>
					<div class="or_guide_img">
						<i class="fa-solid fa-truck-ramp-box" style="color: #8a8a8a;"></i>
						<p style="margin: 0;">배송완료</p>
						<p style="font-size: 20px;">${deliveredOrders}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="my_order_box">		
		<table class="table table-bordered" id="delivery_table">
		  <thead>
		    <tr>
		      <th scope="col" id="col1">선택</th>
		      <th scope="col" id="col2">주문 번호</th>
		      <th scope="col" id="col3">수취인</th>
		      <th scope="col" id="col4">수취인 연락처</th>
		      <th scope="col" id="col5">진행상태</th>
		    </tr>
		  </thead>
		  <c:choose>
			<c:when test="${fn:length(ordersPage.content)>0 }">
				<c:forEach var="order" items="${ordersPage.content}" varStatus="i">
            		<c:set var="address" value="${addressDTOList[i.index]}" />
            		<c:set var="orderitemList" value="${orderItemDTOList_[i.index]}" />
		  <tbody>
		    <tr>
		      <th scope="row" rowspan="3" id="conter_check"><input class="form-check-input" type="checkbox" name="ck" id="checkboxNoLabel" value="${i.index}" readonly="readonly" aria-label="..."></th>
		      <td style="text-align: center;"><a href="#">${order.id}</a></td>
		      <td style="text-align: center;">${address.name}</td>
		      <td style="text-align: center;">${address.phone}</td>
		      <td style="text-align: center;">
				<select name="status${order.id}" id="order_status" data-status="${order.status}">
	                 <option value="결제완료">결제완료</option>
	                 <option value="상품준비중">상품준비중</option>
	                 <option value="배송시작">배송시작</option>
	                 <option value="배송중">배송중</option>
	                 <option value="배송완료">배송완료</option>
	                 <option value="취소완료">취소완료</option>
	                 <option value="반품완료">반품완료</option>
	            </select>
			  </td>
		    </tr>
		    <tr>
		      <td>상품명</td>
		     
		      <td colspan="3">
		      <c:forEach var="orderitem" items="${orderitemList}" varStatus="i">
		      	${orderitem.name}, ${orderitem.quantity}개 ,
		      </c:forEach>
		      </td>
		    </tr>
		    <tr>
		      <td>배송지</td>
		      <td colspan="3">${address.address} ${address.address2} ${address.zipcode}</td>
		    </tr>
		  </tbody>
		  		</c:forEach>
		  			<div class="pagination">
					  <div class="size-selector">
					    <select id="size" onchange="changeSize()">
					      <option value="5">5</option>
					      <option value="10">10</option>
					      <option value="20">20</option>
					    </select>
					  </div>
					  <c:if test="${ordersPage.first == false}">
			<%-- 		    <a href="?page=0&size=${size}"><<</a> --%>
			<%-- 		    <a href="?page=${productPage.number - 1}&size=${size}"><</a> --%>
					    	<a href="javascript:changePage(0)"><<</a>
							<a href="javascript:changePage(${ordersPage.number - 1})"><</a>
					  </c:if>
					  <c:forEach begin="0" end="${ordersPage.totalPages -1}" step="1" var="page">
					    <c:choose>
					      <c:when test="${page == ordersPage.number}">
					        <span class="current">${page + 1}</span>
					      </c:when>
					      <c:otherwise>
					        <a href="?page=${page}&size=${size}">${page + 1}</a>
					      </c:otherwise>
					    </c:choose>
					  </c:forEach>
					  <c:if test="${ordersPage.last == false}">
			<%-- 		    <a href="?page=${productPage.number + 1}&size=${size}">></a> --%>
			<%-- 		    <a href="?page=${productPage.totalPages - 1}&size=${size}">>></a> --%>
					  		<a href="javascript:changePage(${ordersPage.number + 1})">></a>
							<a href="javascript:changePage(${ordersPage.totalPages - 1})">>></a>
					  </c:if>
					</div>
		  </c:when>
		  <c:when test="${fn:length(ordersPage.content)==0}">
			<tbody>
				<tr style="text-align:center; height: 30px;">
					<th colspan="5">등록된 상품이 없습니다.</th></tr>
			</tbody>
		  </c:when>
		 </c:choose>
		  
		</table>
		<div id="del_btn">
			<input name="s" type ="button" class="selectBtn" value="상태수정">
			<input type="button" class="deleteBtn" value="삭제">
		</div>
	</div>
</div>
  </div>
</div>
	
	
<script>
window.onload = function() {
    // URL에서 'size' 파라미터를 가져옵니다.
    var urlParams = new URLSearchParams(window.location.search);
    var size = urlParams.get('size');

    // 'size' 파라미터를 select box의 선택 값으로 설정합니다.
    var selectBox = document.getElementById('size');
    selectBox.value = size;
};
function changeSize() {
  var size = document.getElementById("size").value;
  window.location.href = "?page=0&size=" + size;
}
</script>
<script>
var currentPage = ${ordersPage.number};  // 현재 페이지 번호 초기화
var currentSize = ${size};  // 현재 페이지 사이즈 초기화

window.onload = function() {
  document.getElementById("size").value = currentSize;  // 페이지 로드 시 선택된 사이즈로 설정
};

function changeSize() {
  currentSize = document.getElementById("size").value;  // 페이지 사이즈 변경 시 사이즈 업데이트
  window.location.href = "?page=" + currentPage + "&size=" + currentSize;
}

function changePage(page) {
  currentPage = page;  // 페이지 이동할 때마다 페이지 번호 업데이트
  window.location.href = "?page=" + currentPage + "&size=" + currentSize;
}

});
</script>