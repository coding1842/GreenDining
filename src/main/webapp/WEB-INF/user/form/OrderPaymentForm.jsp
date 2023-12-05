<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <script src="/jquery/jquery-3.7.0.min.js"></script>
    <script src="/js/smartstore/view/SaleItemDetail.js"></script>
    <script src="/js/user/OrderPaymentForm.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <meta charset="UTF-8" />
    <title>주문/결제폼</title>
  </head>
  <body>
    <section class="w-800px fs-12px" id="orderPaymentForm">
      <h2 style="border-bottom: solid 2px black; padding-bottom: 8px">주문/결제</h2>
      <form action="/order/add" method="post">
        <!-- 구매자정보 -->
        <div>
          <br />
          <h5>구매자정보</h5>
          <form action="" method="get">
            <table>
              <tr>
                <th style="border: solid 1px #ddd">이름</th>
                <td>${user.name}</td>
              </tr>
              <tr>
                <th style="border: solid 1px #ddd">이메일</th>
                <td>${user.email}</td>
              </tr>
              <tr>
                <th style="border: solid 1px #ddd">휴대폰 번호</th>
                <td>
                  <input type="text" value="${user.phone}" class="w-150px h-30px" />
                  <button class="h-30px w-40px">수정</button>
                  <span>쿠폰/티켓정보는 구매한 분의 번호로 전송됩니다.</span>
                </td>
              </tr>
            </table>
          </form>
        </div>
        <br />
        <!-- 받는사람정보 -->
        <div>
          <div style="display: flex; padding-bottom: 10px; gap: 30px">
            <h5 style="margin: 0">받는사람정보</h5>
            <button type="button" onclick="" style="margin-bottom: 4px">배송지변경</button>
          </div>
          <form action="" method="post">
            <input type="hidden" name="address_id" value="${addressList[0].id}" />
            <table style="border: solid 1px #eeeeee">
              <tr>
                <th style="border: solid 1px #ddd">이름</th>
                <td>${addressList[0].name}</td>
              </tr>
              <tr>
                <th style="border: solid 1px #ddd">배송 주소</th>
                <td>${addressList[0].address} , ${addressList[0].address2}</td>
              </tr>
              <tr>
                <th style="border: solid 1px #ddd">연락처</th>
                <td>${addressList[0].phone}</td>
              </tr>
              <tr>
                <th style="border: solid 1px #ddd">배송 요청사항</th>
                <td>${addressList[0].request_option}</td>
              </tr>
            </table>
          </form>
        </div>
        <div id="delivery_list" class="w-100 mt-3">
          <h5>배송 1건 중 ${fn:length(cartDTOList)}</h5>
          <form action="" id="orderForm" >
          <div id="delivery_container" class="border rounded-3">
            <div id="delivery_time" class="p-3 rounded-top-3 h-40px" style="color:rgb(0, 137, 30); background-color: rgb(244, 244, 244);">
              <p class="m-0"><b>내일(토) 11/25 새벽 7시 전</b> 도착 보장 </p>
            </div>
            <div id="delivery_info" class="p-3">
              <c:forEach var="cart" items="${cartDTOList}" varStatus="i">
                <c:if test="${i.index >= 1}">
                <hr>
                </c:if>
                <div class="item_info fs-14px d-flex">
                  <p class="w-300px text-start m-0">${cart.name}</p>
                  <span class="fs-12px">수량 ${cart.quantity}개</span>
                </div>
                <div class="hidden_info">
                  <input type="hidden" class="before_price" name="orderItemDTOList[${i.index}].before_price" value="${cart.before_price}">
                  <input type="hidden" class="after_price" name="orderItemDTOList[${i.index}].after_price" value="${cart.after_price}">
                  <input type="hidden" class="store_name" name="orderItemDTOList[${i.index}].store_name" value="${cart.store_name}">
                  <input type="hidden" class="sale_id" name="orderItemDTOList[${i.index}].sale_id" value="${cart.sale_id}">
                  <input type="hidden" class="product_id" name="orderItemDTOList[${i.index}].product_id" value="${cart.product_id}">
                  <input type="hidden" class="quantity" name="orderItemDTOList[${i.index}].quantity" value="${cart.quantity}">
                </div>
              </c:forEach>
            </div>
          </div>
          </form>
        </div>
        <!-- 결제정보 -->
        <div id="payment_info">
          <br />
          <h5>결제정보</h5>
          <form action="" method="post">
            <table>
                <tr>
                  <th style="border: solid 1px #ddd">총상품가격</th>
                  <td id="total_price">&nbsp;원</td>
                </tr>
                <tr>
                  <th style="border: solid 1px #ddd">즉시할인</th>
                  <td id="discount_price"></td>
                </tr>
                <tr>
                  <th style="border: solid 1px #ddd">배송비</th>
                  <td>3,000&nbsp;원</td>
                </tr>
                <tr>
                  <th style="border: solid 1px #ddd">총결제금액</th>
                  <td class="fs-15px" id="total_payment_price"></td>
                </tr>
              <tr>
                <th style="border: solid 1px #ddd">결제방법</th>
                <td>
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" name="payRadio" type="radio" id="inlineCheckbox1" value="option1" checked />
                    <label class="form-check-label" for="inlineCheckbox1" id="btnradio1">포인트머니</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" name="payRadio" type="radio" id="inlineCheckbox2" value="option2" />
                    <label class="form-check-label" for="inlineCheckbox2" id="btnradio2">신용/체크카드</label>
                  </div>
                  <div class="form-check form-check-inline">
                    <input class="form-check-input" name="payRadio" type="radio" id="inlineCheckbox3" value="option3" />
                    <label class="form-check-label" for="inlineCheckbox3" id="btnradio3">무통장입금(가상계좌)</label>
                  </div>
                  <br /><br />
                  <!-- 포인트머니 -->
                  <div id="1">
                    <h5>포인트머니</h5>
                    <p>보유 포인트머니 : *&nbsp;원</p>
                    <div class="input-group has-validation">
                      <span class="input-group-text">사용</span>
                      <div class="form-floating is-invalid">
                        <input type="text" class="form-control is-invalid" id="floatingInputGroup2" placeholder="Username" required />
                        <label for="floatingInputGroup2">0원</label>
                      </div>
                      <div class="invalid-feedback">사용할 포인트머니를 입력하세요</div>
                    </div>
                  </div>
                  <!-- 신용/체크카드 -->
                  <div id="2" style="display: none">
                    <h5>신용/체크카드</h5>
                    <div>
                      <ul>
                        <li>카드선택</li>
                        <li>할부기간</li>
                      </ul>
                      
                    </div>
                  </div>
                  <!-- 무통장입금 -->
                  <div id="3" style="display: none">
                    <h5>무통장입금</h5>
                    <select class="form-select" aria-label="Default select example">
                      <option selected>은행선택</option>
                      <option value="1">농협</option>
                      <option value="2">국민은행</option>
                      <option value="4">신한은행</option>
                      <option value="5">우리은행</option>
                      <option value="6">기업은행</option>
                      <option value="7">하나은행</option>
                      <option value="8">대구은행</option>
                      <option value="9">부산은행</option>
                    </select>
                    <br />
                    <h5>환불방법</h5>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked />
                      <label class="form-check-label" for="flexRadioDefault1"> 본인계좌환불 </label>
                      <div class="input-group has-validation">
                        <span class="input-group-text">환불계좌입력</span>
                        <div class="form-floating is-invalid">
                          <input type="text" class="form-control is-invalid" id="floatingInputGroup2" placeholder="Username" required />
                          <label for="floatingInputGroup2">'-'를 제외하고 입력하세요</label>
                        </div>
                        <div class="invalid-feedback">계좌번호를 확인하고 기입해주세요</div>
                      </div>
                    </div>
                    <br />
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" />
                      <label class="form-check-label" for="flexRadioDefault2"> 환불정산액 적립 </label>
                    </div>
                  </div>
                </td>
              </tr>
            </table>
            <br /><br />
<!--             <div class="d-grid gap-2 col-6 mx-auto"> -->
<!--               <button class="btn btn-primary" id="orderRequest"  type="button" style="height: 65px"> -->
<!--                 결제하기 -->
<!--               </button> -->
<!--             </div> -->
          </form>
         <form id="payForm" name="payForm" action="/payment/pay" >
						<div class="container">
						    <table class="table table-hover table table-striped">
						        <tr>
						            <td>카드번호: <input type="text" id="" name="cardNo"></td>
						        </tr>
						        <tr>
						            <td>유효기간(월): <input type="text" id="" name="expireMonth"></td>
						        </tr>
						        <tr>
						            <td>유효기간(년): <input type="text" id="" name="expireYear"></td>
						        </tr>
						        <tr>
						            <td>생일: <input type="text" id="" name="birthday"></td>
						        </tr>
						        <tr>
						            <td>비밀번호 앞 2자리: <input type="text" id="" name="cardPw"></td>
						        </tr>
						        
						        <tr>
						        	<td><input type="submit" value="결제하기"></td>
						        </tr>
						    </table>
						</div>
					 </form>
        </div>
        <br />
      </form>
    </section>
  </body>
</html>