<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/css/user/MyPage.css" />

<title>mypage</title>
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
  <div class="merchant_main_box">
    <div class="merchant_box">
      <div id="merchant_box_left">
        <div class="product_title">
          <h2>상품을 등록하고 <br />판매를 시작하세요</h2>
          <p>고객들이 상품을 기다리고 있습니다.</p>
          <p>지금 바로 상품을 등록, 판매해 보세요</p>
        </div>
        <div class="product_btn">
          <button onclick="location.href='/product/write'">상품 등록하기</button>
        </div>
      </div>
      <div id="merchant_box_right1">
        <div class="sales_box">
         <div id="sales_title_box">
         		<h4>판매/배송<a href=""><i class="fa-solid fa-angle-right" style="color: #878787;"></i></a> </h4>
         		<p id="latest_time_font">최근 11:22 &nbsp;<i class="fa-solid fa-rotate-left" style="color: #9a9a9a;"></i></p>
         </div>
         <p id="latest_time_font">최근 14일 기준</p>
         <div id="sales_middle_box">
	         <div id="sales_box1">
	         	<p style="font-size: 18px; font-weight: 600;">${completedPaymentOrders}</p>
	         	<p>결제완료</p>
	         </div>
	         <i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>
	         <div id="sales_box1">
	         	<p style="font-size: 18px; font-weight: 600;">${preparingOrders}</p>
	         	<p>상품준비중</p>
	         </div>
	         <i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>
	         <div id="sales_box1">
	         	<p style="font-size: 18px; font-weight: 600;">${deliveryStartedOrders}</p>
	         	<p>배송시작</p>
	         </div>
	         <i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>
	         <div id="sales_box1">
	         	<p style="font-size: 18px; font-weight: 600;">${deliveringOrders}</p>
	         	<p>배송중</p>
	         </div>
	         <i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>
	         <div id="sales_box1">
	         	<p style="font-size: 18px; font-weight: 600;">${deliveredOrders}</p>
	         	<p>배송완료</p>
	         </div>
         </div>
        </div>
        
        <div id="merchant_box_right2">
	        <div id="marchant_small_box1">
	        	<div id="small_box_title">
	        	 	<div>
	        	 		<h6>취소/반품/교환</h6>
	        	 		<p id="latest_time_font">최근 30일 기준</p>
	        	 	</div>
	        	 	<p id="latest_time_font">최근 11:12 &nbsp;<i class="fa-solid fa-rotate-left" style="color: #9a9a9a;"></i></p>
	        	</div>
	        	<div>
	        	<div id="exchange_it">
	        		<span>교환 요청수</span>
	        		<span>7&nbsp;<a href=""><i class="fa-solid fa-angle-right" style="color: #878787;"></i></a></span> 
	        	</div>
	        	<div id="exchange_it">
	        		<span>취소/반품수</span>
	        		<span>7&nbsp;<a href=""><i class="fa-solid fa-angle-right" style="color: #878787;"></i></a></span> 
	        	</div>
	        	<div id="exchange_it">
	        		<span>출고중지 요청</span>
	        		<span>7&nbsp;<a href=""><i class="fa-solid fa-angle-right" style="color: #878787;"></i></a></span> 
	        	</div>
	        	</div>
	        </div>
	        <div id="marchant_small_box2">
	        	<div id="small_box_title">
	        	 	<div id="">
	        	 		<h6>미답변문의</h6>
	        	 		<p id="latest_time_font">최근 30일 기준</p>
	        	 	</div>
	        	 	<p id="latest_time_font">최근 11:12 &nbsp;<i class="fa-solid fa-rotate-left" style="color: #9a9a9a;"></i></p>
	        	</div>
	        	<div>
	        	<div id="exchange_it">
	        		<span>고객센터 문의수</span>
	        		<span>7&nbsp;<a href=""><i class="fa-solid fa-angle-right" style="color: #878787;"></i></a></span> 
	        	</div>
	        	<div id="exchange_it">
	        		<span>고객 문의수</span>
	        		<span>7&nbsp;<a href=""><i class="fa-solid fa-angle-right" style="color: #878787;"></i></a></span> 
	        	</div>
	        	</div>
	        </div>
	    </div>
      </div>
    </div>
  </div>
</div>
