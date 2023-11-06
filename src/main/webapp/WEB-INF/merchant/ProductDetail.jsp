<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script><title>상품 디테일</title>
<script  src="/js/ProductDetail.js"></script>
</head>
<body>
	<!-- 상품이미지 -->
	<section id="detail_slider" class="w-50 h-500px d-block position-relative float-start">
		<div class="detail_img">
			<img alt="상품이미지" src=""
				 style="width: 500px; height: 500px;">
		</div>
	</section>
	<!-- 상품대표 설명 -->
	<section id="product_detail" class="w-50 float-end">
		<div class="product_info" style="border: solid 1px #dfdfdf;">
			<h3>상품명</h3>
			<div class="org_price">
				<del>70,000</del>
				<span>10%</span>
			</div>
			<div class="dis_price">
				<ins>63,000</ins>
			</div>
			
			<div style="border: solid 1px #dfdfdf;">
				<img alt="택배이미지" src="">
				<span>오늘출발 낮 12시 마감</span>
				<p>12시 이후 주문시 내일 발송</p>
			</div>
			<select>
				<option value="">배송방법 선택</option>
				<option value="택배">택배</option>
				<option value="퀵서비스">퀵서비스</option>
			</select>
			<div style="border: solid 1px #dfdfdf;">
				<p>택배배송  |  3,000원(주문시 결제) • 롯데택배</p>
				<p style="color: #A6A6A6">제주, 도서지역 추가 5,000원</p>
			</div>
			<div style="border: solid 1px #dfdfdf;">
				<p>• 상품선택</p>
				<select>
					<option value="">상품 선택</option>
					<option value="맛있는 장어구이 2마리">맛있는 장어구이 2마리(63,000원)</option>
					<option value="맛있는 장어구이 4마리">맛있는 장어구이 2마리(120,000원)</option>
				</select>
				<p>• 추가 상품</p>
				<select>
					<option value="">추가상품 선택</option>
					<option value="장어구이용 소스">장어구이용 소스(+600원)</option>
					<option value="곁들임 모듬 반찬">깻잎, 상추, 초생강, 마늘(+4,000원)</option>
				</select>
			</div>
			<div>
				<span>총 상품 금액</span>
				<span style="text-align: right;">총 수량 '기능'개</span>
				<span style="font-weight: bold; font">'기능'원</span>
			</div>
			<div>
				<a><img alt="구매하기" src=""></a>
					<div style="flex-wrap: nowrap;">
						<a><img alt="문의" src=""></a>
						<a><img alt="찜하기" src=""></a>
						<a><img alt="장바구니" src=""></a>
					</div>
			</div>
		</div>		
	</section>
	<div class="clear"></div>
	<!-- 상품 디테일 선택란 -->
	<section id="info" style="text-align: center;" >
			<div class="btn-group w-600px" role="group" aria-label="Basic radio toggle button group">
	 		    <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
				<label class="btn btn-outline-primary" for="btnradio1">상세정보</label>
				<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
				<label class="btn btn-outline-primary" for="btnradio2">리뷰</label>
				<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
				<label class="btn btn-outline-primary" for="btnradio3">Q&A</label>
				<input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off">
				<label class="btn btn-outline-primary" for="btnradio4">반품/교환정보</label>
			</div>
			<!-- 상세정보 -->
			<div class="fingForm" id="1">
				<h4 id="title" class="mt-5">상세정보</h4>
				<table class="product_info" style="text-align: center; display: inline;">
					<tr>
						<th>상품번호</th>
						<td>0</td>
						<th>상품상태</th>
						<td>신상품</td>
					</tr>
					<tr>
						<th>제조사</th>
						<td>인혁이네 공장</td>
						<th>브랜드</th>
						<td>인혁짱짱맨</td>
					</tr>
					<tr>
						<th>모델명</th>
						<td>맛도리 장어구이</td>
						<th>원산지</th>
						<td>노스코리아</td>
					</tr>
				</table> <br><br>
				<img alt="상품상세정보이미지 / 상세정보 펼처보기 기능넣기" src="">
			</div>
			
			<!-- 리뷰 -->
			<div class="fingForm" id="2" style="display: none;">
				<h4 id="title" class="mt-5">리뷰</h4>
				<p>상품을 구매하신 분들이 작성하신 리뷰입니다. 리뷰 작성시 포인트가 적립됩니다.</p>
				<p>전체리뷰 수 : '기능'개</p>
				<br><br>
				<hr>
				<div class="" id="review_list">
					<%-- <c:choose>
						<c:when test="">
							<c:forEach var="" items="${}"> --%>
									<div class="" id="review_form">
										<div id="review_top">
											<img id="user_profile" alt="유저프로필" src="">
											<span id="user_star"></span> <em>5</em>
											<div id="user_info">
												<span id="user_id">dlsgur8431</span>
												<span id="review_created"></span>
												<span id="product_name">맛있는 장어구이</span>
											</div>
											<div id="review_content" class="position-relative">
												<span class=" w-700px ms-5 start-50 translate-middle-x">
												Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas blandit nulla vitae est condimentum, et ullamcorper odio rutrum. Nullam vitae ornare nisl. Pellentesque urna ipsum, cursus quis vehicula eu, pretium nec lectus. Quisque tempus, nisl et semper euismod, enim orci accumsan felis, quis volutpat dui tortor sed sem. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In et nibh lobortis, suscipit ipsum vel, bibendum libero. Nulla vestibulum purus nisi, et hendrerit purus porttitor et. Fusce vitae vestibulum nibh. Vivamus ac lacinia massa. Proin sit amet augue sem. Quisque viverra ex a nulla venenatis, ut bibendum massa porta. Vivamus elementum arcu diam, quis eleifend odio luctus ac.
												Sed quis fermentum lorem. Maecenas sit amet neque non nibh rhoncus volutpat. Sed egestas magna blandit eros cursus, id porta risus viverra. Phasellus a urna est. Maecenas eget ultrices lectus, eget gravida lectus. Nulla tincidunt metus sit amet ante pellentesque, ut ullamcorper ex maximus. Maecenas lectus elit, blandit at arcu sed, pellentesque accumsan magna. Quisque congue felis eget ipsum dignissim, ut efficitur lectus vestibulum. Sed nec nisl venenatis, tincidunt purus ac, malesuada metus. Phasellus vestibulum sem in pellentesque posuere.
												Nullam quis mi dapibus elit blandit pharetra vitae eget dui. Morbi id dolor pulvinar, interdum sem non, fermentum enim. Maecenas ultricies, nisi blandit placerat congue, tortor arcu faucibus urna, at tempor dui massa a ex. Quisque ut faucibus magna. Morbi nisi arcu, aliquam et aliquet ac, dignissim sed nisl. In ullamcorper orci et nisl accumsan facilisis. Quisque hendrerit consequat tempor. Vestibulum viverra nulla sed purus porttitor auctor. Ut ac commodo metus. Morbi vestibulum lacus lacinia, consequat nisl id, mattis urna. Vestibulum tempor ex erat, pharetra convallis libero convallis id.
												Donec placerat sit amet nunc quis ornare. Maecenas mattis efficitur turpis quis sagittis. Nunc porttitor volutpat libero non mollis. Phasellus finibus justo non dui rhoncus commodo. Donec quis faucibus urna. Pellentesque et eleifend nisl. Aenean pretium libero ipsum, et lacinia diam tempus vel. Vivamus scelerisque turpis et libero porta ultrices. Aenean ut feugiat orci. Phasellus et felis a turpis rutrum cursus.
												In bibendum mi at viverra rutrum. Maecenas rutrum tellus dapibus nulla tempus ultricies. Morbi fringilla sapien quis viverra vestibulum. In nunc sem, tincidunt nec viverra non, tincidunt quis erat. Aenean semper pulvinar viverra. Pellentesque facilisis euismod massa. Ut tortor odio, bibendum quis ultricies quis, imperdiet non enim. Nunc orci urna, efficitur porttitor elit quis, imperdiet faucibus eros. Etiam placerat risus ligula. Vivamus ornare odio felis, eget suscipit eros lacinia vitae. Nullam mollis fringilla felis, non ornare risus interdum eu. Maecenas tristique eleifend orci eget ornare. Aliquam sed odio pulvinar, elementum sem vel, porttitor justo. Pellentesque molestie dolor posuere, molestie ipsum vitae, sollicitudin ex.
												</span>
												<img alt="상품리뷰이미지" src="">
											</div>
										</div>
									</div>
										<a href="javascript:;" id="load">더보기 펼치기기능</a>
							<%-- </c:forEach>
						</c:when>
					</c:choose> --%>
				</div>
			</div>
			
			<!-- Q&A -->
			<div class="fingForm" id="3" style="display: none;">
				<h4 id="title" class="mt-5">Q&A</h4>
				<p style="text-align: center; padding-right: 10px; font-size: 16px;">총 질문 수: &nbsp;개</p>
				<a href="/qnaWriteForm" style="border: solid 1px #dddddd; border-radius: 5px; background-color: skyblue; padding: 3px;">상품 Q&A 작성하기</a>
				<table class="noticelist" style="text-align: center; display: inline-block;">
					<tr style="height: 50px; width: 300px;" class="headcolor">
						<th>순서</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>등록일</th>
					</tr>
					<!-- Q&A 리스트 받아오기 -->
					<%-- <c:choose>
						<c:when test="${fn:length(nList)>0}">
							<c:forEach var="notice" items="${nList}">
								<tr>
									<td class="co1">${notice.rr}</td> 
									<input type="hidden" value="${notice.noti_no}">
									<td class="co2"><a href="/noticeDetail?noti_no=${notice.noti_no}">${notice.subject}</a></td>
									<td class="price">${notice.writer}</td>
									<td class="co4">${notice.readcount}</td>
									<td class="co5">${notice.regdate}</td>
									<td class="co5">${notice.vdate}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:when test="${fn:length(nList)==0}">
							<tr style="text-align:center; height: 30px;">
								<th colspan="5">공지사항이 없습니다.</th></tr>
						</c:when>
					</c:choose>
					<tr style="text-align:right;height: 50px;">
						<th colspan="6" style="text-align:right;border:1px solid #ffffff;"></th>
					</tr>
					<tfoot>
						<tr>
							<td colspan="6" style="text-align: center; border:1px solid #ffffff;">
								<c:if test="${pageDto.startPg>pBlock}">
									<a href="notice?curPage=${pageDto.startPg-pBlock}&curBlock=${pageDto.curBlock-1}">
									[이전]
									</a>
								</c:if>
								<c:forEach begin="${pageDto.startPg}" end="${pageDto.endPg}" var="p" step="1">
									<a href="notice?curPage=${p}&curBlock=${pageDto.curBlock}">
									<span><c:out value="${p}"></c:out></span>
									</a>&nbsp;&nbsp;
								</c:forEach>
									<c:if test="${pageDto.endPg<pageDto.pgCnt}">
									<a href="notice?curPage=${pageDto.startPg+pBlock}&curBlock=${pageDto.curBlock+1}">
									[다음]
									</a>
								</c:if>
							</td>
						</tr>
					</tfoot> --%>
				</table>	
			</div>
			<!-- 반품/교환 정보 -->
			<div class="fingForm" id="4" style="display: none;">
				<h4 id="title" class="mt-5">반품/교환 정보</h4>
				<table>
					<tr>
						<td colspan="2" style="text-align: center;">
					반품/교환 안내<br>반품 시 먼저 판매자와 연락하셔서 반품사유, 택배사, 배송비, 반품지 주소 등을 협의하신 후 반품상품을 발송해 주시기 바랍니다.
						</td>
					</tr>
					<tr>
						<th>판매자 지정택배사</th>
						<td>대현택배</td>						
					</tr>
					<tr>
						<th>보내실 곳</th>
						<td>대현이네집</td>						
					</tr>
					<tr>
						<th rowspan="2">반품/교환 사유에 따른 요청 가능 기간</th>
						<td>구매자 단순 변심은 상품 수령 후 7일 이내</td>						
					</tr>
						<tr><td>표시/광고와 상이, 계약 내용과 다르게 이행된 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내</td></tr>
						<tr>
							<th scope="row" rowspan="7">반품/교환 불가능 사유</th>
							<td>
								<ul>
									<li>
										<span>1. 반품요청기간이 지난 경우</span>
									</li>
									<li>
										<span>2. 구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우</span><br>
										<span class="text-black-50">(단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)</span>
									</li>
									<li>
										<span>3. 구매자의 책임있는 사유로 포장이 훼손되어 상품 가치가 현저히 상실된 경우</span><br>
										<span class="text-black-50">(예: 식품, 화장품, 향수류, 음반 등)</span>
									</li>
									<li>
										<span>4. 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</span><br>
										<span class="text-black-50">(라벨이 떨어진 의류 또는 태그가 떨어진 명품관 상품인 경우)</span>
									</li>
									<li>
										<span>5. 시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우</span>
									</li>
									<li>
										<span>6. 고객의 요청사항에 맞춰 제작에 들어가는 맞춤제작상품의 경우</span><br>
										<span class="text-black-50">(판매자에게 회복불가능한 손해가 예상되고, 그러한 예정으로 청약철회권 행사가 불가하다는 사실을 서면 동의 받은 경우)</span>
									</li>
									<li>
										<span>7. 복제가 가능한 상품 등의 포장을 훼손한 경우</span><br>
										<span class="text-black-50">(CD/DVD/GAME/도서의 경우 포장 개봉 시)</span>
									</li>
								</ul>
							</td>
						</tr>						
				</table>
			</div>	
	</section>
	<div class="clear"></div>
</body>
</html>