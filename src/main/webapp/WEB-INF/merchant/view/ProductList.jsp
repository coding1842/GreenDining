<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/css/smartstore/ProductList.css" />
<link rel="stylesheet" href="/css/user/MyPage.css" />
<div id="pList_box">
<div class="merchant_page_box">
  <div class="merchant_aside_box">
    <div id="mer_aside"> 
<ul class="list-group list-group-flush" id="aside_list_sort"> 
	<li class="list-group-item">
		<div class="dropdown">
		  <button>상품관리</button>
			  <div class="dropdown-options">
			    <a href="merchant/my-page/product/list">상품 리스트</a><br>
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
  <div id="productList_main_box">
   	<div>
		<p style="text-align: center; font-size: 30px;">상품 목록</p>
		
	</div>
<table class="table table-hover" id="pList_table">
  <thead>
    <tr>
      <th scope="col">선택</th>
      <th scope="col">번호</th>
      <th scope="col">상품 이름</th>
      <th scope="col">무게</th>
      <th scope="col">상품 가격</th>
      <th scope="col">재고 수량</th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
  <c:choose>
  	<c:when test="${fn:length(productList)>0 }">
        <c:forEach var="product" items="${productList}">
            <tr>
              <th scope="row"><input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="..."></th>
              <td>${product.id}</td>
              <td>${product.name}</td>
              <td>${product.weight}</td>
              <td>${product.price}</td>
              <td>${product.stock}</td>
            </tr>
        </c:forEach>
    </c:when>
    <c:when test="${fn:length(productList)==0}">
    	<tr style="text-align:center; height: 30px;">
			<th colspan="6">등록된 상품이 없습니다.</th></tr>
    </c:when>
  </c:choose>
  
  </tbody>
</table>
		<div id="del_btn">
			<input type="button" value="삭제">
		</div>
</div>
  </div>
</div>
	
