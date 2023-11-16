<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/smartstore/DeliveryList.css" />
<link rel="stylesheet" href="/css/user/MyPage.css" />
<div id="delivery_box">
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
  <div id="delivery_main_box">
    <div id="delivery_top">
		<p style="font-size: 30px;">배송관리</p>
		<div id="deliveryT_it_box">
			<div id="deliveryT_it">
				<div class="or_guide_2">
						<div class="or_guide_img">
							<i class="fa-solid fa-money-bill-1-wave" style="color: #8a8a8a;"></i>
							<p style="margin: 0;">결제완료</p>
							<p style="font-size: 20px;">0</p>
						</div>
					<div class="or_guide_right">
						<i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>					
					</div>
					<div class="or_guide_img">
						<i class="fa-solid fa-box-open" style="color: #8a8a8a;"></i>
						<p style="margin: 0;">상품준비중</p>
						<p style="font-size: 20px;">3</p>
					</div>
					<div class="or_guide_right">
						<i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>					
					</div>
					<div class="or_guide_img">
						<i class="fa-solid fa-gift" style="color: #8a8a8a;"></i>
						<p style="margin: 0;">배송시작</p>
						<p style="font-size: 20px;">1</p>
					</div>
					<div class="or_guide_right">
						<i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>					
					</div>
					<div class="or_guide_img">
						<i class="fa-solid fa-truck" style="color: #8a8a8a;"></i>
						<p style="margin: 0;">배송중</p>
						<p style="font-size: 20px;">0</p>
					</div>
					<div class="or_guide_right">
						<i class="fa-solid fa-chevron-right" style="color: #8a8a8a;"></i>					
					</div>
					<div class="or_guide_img">
						<i class="fa-solid fa-truck-ramp-box" style="color: #8a8a8a;"></i>
						<p style="margin: 0;">배송완료</p>
						<p style="font-size: 20px;">2</p>
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
		      <th scope="col" id="col6">주문<br>취소/반품</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row" rowspan="3" id="conter_check"><input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="..."></th>
		      <td style="text-align: center;"><a href="#">20012</a></td>
		      <td style="text-align: center;">aaa</td>
		      <td style="text-align: center;">010-1234-5678</td>
		      <td style="text-align: center;">상품준비중</td>
		      <td rowspan="3" id="conter_check">없음</td>
		    </tr>
		    <tr>
		      <td>상품명</td>
		      <td colspan="3">삼겹살 3kg</td>
		    </tr>
		    <tr>
		      <td>배송지</td>
		      <td colspan="3">광주 광산구 2순환로 2474</td>
		    </tr>
		  </tbody>
		  
		  <tbody>
		    <tr>
		      <th scope="row" rowspan="3" id="conter_check"><input class="form-check-input" type="checkbox" id="checkboxNoLabel" value="" aria-label="..."></th>
		      <td style="text-align: center;"><a href="#">20012</a></td>
		      <td style="text-align: center;">aaa</td>
		      <td style="text-align: center;">010-1234-5678</td>
		      <td style="text-align: center;">상품준비중</td>
		      <td rowspan="3" id="conter_check">없음</td>
		    </tr>
		    <tr>
		      <td>상품명</td>
		      <td colspan="3">삼겹살 3kg</td>
		    </tr>
		    <tr>
		      <td>배송지</td>
		      <td colspan="3">광주 광산구 2순환로 2474</td>
		    </tr>
		  </tbody>
		</table>
		<div id="del_btn">
			<input type="button" value="삭제">
		</div>
	</div>
</div>
  </div>
</div>
	