<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <script src="/jquery/jquery-3.7.0.min.js"></script>
    <script src="/js/smartstore/view/SaleItemDetail.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
     <script type="text/javascript" src="https://testpay.kcp.co.kr/plugin/payplus_web.jsp"></script>
     <!-- <script type="text/javascript" src="https://pay.kcp.co.kr/plugin/payplus_web.jsp"></script> -->
    <meta charset="UTF-8" />
    <title>주문/결제폼</title>
      <style>
        .checkbox-tile
        {
          width: 145px !important;
        }
      </style>
      <script>
        function requestOrder() {
        var form = $("form#orderForm").get(0);
        var formData = new FormData(form);
        var address_id = $("input[name='address_id'").val();
        formData.append("address_id", address_id);

        $.ajax({
          type: "POST",
          url: "/order/request",
          data: formData,
          dataType: "json",
          processData: false, // FormData 객체를 직렬화하지 않음
          contentType: false, // 요청 본문의 타입을 'multipart/form-data'로 자동 설정
          success: function (resp) {
            // alert("주문 완료");
            //   location.href = resp;
          },
          error: function (xhr, status, error) {
            // 에러 처리
            if (xhr.status === 401) {
              alert("로그인 후 이용해 주시길 바랍니다.");
              // location.href = xhr.responseText;
            }
          },
        });
      }
                /****************************************************************/
        /* m_Completepayment 설명 */
        /****************************************************************/
        /* 인증완료시 재귀 함수 */
        /* 해당 함수명은 절대 변경하면 안됩니다. */
        /* 해당 함수의 위치는 payplus.js 보다먼저 선언되어여 합니다. */
        /* Web 방식의 경우 리턴 값이 form 으로 넘어옴 */
        /****************************************************************/
        function m_Completepayment(FormOrJson, closeEvent) {
          var checked_val = $(".checkbox-input:checked").val();
          var paymentForm = $("#" + checked_val).get(0);
          
          var frm = paymentForm;
          /********************************************************************/
          /* FormOrJson은 가맹점 임의 활용 금지 */
          /* frm 값에 FormOrJson 값이 설정 됨 frm 값으로 활용 하셔야 됩니다. */
          /********************************************************************/
          GetField(frm, FormOrJson);
          console.log(frm);

          if (frm.res_cd.value == "0000") {
           
            /*
              [가맹점 리턴값 처리 영역] 
              인증이 완료되면 frm에 인증값이 들어갑니다. 해당 데이터를 가지고
              승인요청을 진행 해주시면 됩니다.
              */

            //폼 id = kcp_order_info
            // /authPay로 서브밋하기
            requestOrder();

            var form = paymentForm;
            
            form.submit();

            closeEvent();
          } else {
            /*
              (인증실패) 인증 실패 처리 진행
              */
            alert("[" + frm.res_cd.value + "] " + frm.res_msg.value);

            closeEvent();
          }
        }
      </script>
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
                <th style="border: solid 1px #ddd" class="w-100px text-center">이름</th>
                <td>${user.name}</td>
              </tr>
              <tr>
                <th style="border: solid 1px #ddd" class="w-100px text-center">이메일</th>
                <td>${user.email}</td>
              </tr>
              <tr>
                <th style="border: solid 1px #ddd" class="w-100px text-center">휴대폰 번호</th>
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
            <button type="button" id="address_change_btn" style="margin-bottom: 4px">배송지변경</button>
          </div>
          <form action="" method="post">
            <input type="hidden" id="address_id" name="address_id" value="${addressList[0].id}" />
            <table style="border: solid 1px #eeeeee">
              <tr>
                <th style="border: solid 1px #ddd" class="w-100px text-center">이름</th>
                <td id="address_name">${addressList[0].name}</td>
              </tr>
              <tr>
                <th style="border: solid 1px #ddd" class="w-100px text-center">배송 주소</th>
                <td id="address_address">${addressList[0].address} , ${addressList[0].address2} [${addressList[0].zipcode}]</td>
              </tr>
              <tr>
                <th style="border: solid 1px #ddd" class="w-100px text-center">연락처</th>
                <td id="address_phone">${addressList[0].phone}</td>
              </tr>
              <tr>
                <th style="border: solid 1px #ddd" class="w-100px text-center">배송 요청사항</th>
                <td id="address_request">
                  <c:choose>
                    <c:when test="${empty addressList[0].request_text}">
                      ${addressList[0].request_option}
                    </c:when>
                    <c:otherwise>
                      ${addressList[0].request_option} / ${addressList[0].request_text}
                    </c:otherwise>
                  </c:choose>
                </td>
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
          
            <table class="m-0 w-100">
                <tr class="h-50px">
                  <th style="border: solid 1px #ddd" class="w-100px text-center">총상품가격</th>
                  <td style="border: solid 1px #ddd" class="ps-3" id="total_price">&nbsp;원</td>
                </tr>
                <tr class="h-50px">
                  <th style="border: solid 1px #ddd" class="w-100px text-center">즉시할인</th>
                  <td style="border: solid 1px #ddd" class="ps-3" id="discount_price"></td>
                </tr>
                <tr class="h-50px">
                  <th style="border: solid 1px #ddd" class="w-100px text-center">배송비</th>
                  <td style="border: solid 1px #ddd" class="ps-3">3,000&nbsp;원</td>
                </tr>
                <tr class="h-50px">
                  <th style="border: solid 1px #ddd" class="w-100px text-center">총결제금액</th>
                  <td style="border: solid 1px #ddd" class="fs-15px ps-3" id="total_payment_price"></td>
                </tr>
              <tr>
                <th style="border: solid 1px #ddd" class="w-100px text-center">결제방법</th>
                <td style="border: solid 1px #ddd">
                    <section id="payment_method">
                    <div class="payment_radio_group">
                      <div class="inputGroup">
                        <input id="radio1" name="radio" class="radio_simple" type="radio" checked/>
                        <label for="radio1">간편 카드 결제(보안상 잠금)</label>
                      </div>
                    </div>
                       <div id="simple_payment">
                        <form id="payForm" name="payForm" action="/payment/cardPay">
                          <div class="w-100">
                            <table class="w-100">
                              <tbody>
                              <tr>
                                <th class="ps-4 w-200px">카드번호:</th>
                                <td> <input type="text" id="" name="cardNo" placeholder="카드번호 (-) 제외 11~20자리"/></td>
                              </tr>
                              <tr>
                                <th class="ps-4 w-200px">유효기간(월):</th>
                                <td> <input type="text" id="" name="expireMonth" placeholder="카드 유효기간 (월)"/></td>
                              </tr>
                              <tr>
                                <th class="ps-4 w-200px">유효기간(년):</th>
                                <td> <input type="text" id="" name="expireYear" placeholder="카드 유효기간 (년)" /></td>
                              </tr>
                              <tr>
                                <th class="ps-4 w-200px">생년월일:</th>
                                <td> <input type="text" id="" name="birthday" placeholder="생년월일 6자리"/></td>
                              </tr>
                              <tr>
                                <th class="ps-4 w-200px">비밀번호 앞 2자리:</th>
                                <td> <input type="text" id="" name="cardPw" placeholder="카드 비밀번호 앞 2자리" /></td>
                              </tr>
                              </tbody>
                              <input type="hidden" name="amount" value="">
                              <input type="hidden" name="itemName" value="${cartDTOList[0].name} 외 ${fn:length(cartDTOList) - 1}건">
                            </table>
                          </div>
                          <div class="clearfix"></div>
                        </form>
                      </div>
                          <hr>
                    <div class="payment_radio_group">
                      <div class="inputGroup">
                        <input id="radio2" name="radio" class="radio_normal" type="radio"/>
                        <label for="radio2">일반 결제</label>
                      </div>
                     </div>
                     
                      <div id="normal_payment" style="display:none;">
                        <section id="category_group">
                          <fieldset class="checkbox-group">
                            <div class="checkbox">
                              <label class="checkbox-wrapper">
                                <input type="checkbox" class="checkbox-input" value="kcp_auth_order_info" checked />
                                <span class="checkbox-tile w-150px">
                                  <span class="checkbox-icon">
                                    <span class="material-symbols-outlined fs-1">credit_card</span>
                                  </span>
                                  <span class="checkbox-label">인증 결제 (종합)</span>
                                </span>
                              </label>
                            </div>
                            <div class="checkbox">
                              <label class="checkbox-wrapper">
                                <input type="checkbox" class="checkbox-input" value="kcp_kakao_order_info" />
                                <span class="checkbox-tile w-150px">
                                  <img src="/image/payment_icon_yellow_small.png" class="pb-4 w-50 h-50" alt=""> 
                                  <span class="checkbox-label">카카오페이</span>
                                </span>
                              </label>
                            </div>
                            <div class="checkbox">
                              <label class="checkbox-wrapper">
                                <input type="checkbox" class="checkbox-input" value="kcp_naver_card_order_info" />
                                <span class="checkbox-tile w-150px">
                                  <img src="/image/naver_payment.jpg" class="pb-4 w-50 h-50" alt=""> 
                                  <span class="checkbox-label">네이버페이 (카드)</span>
                                </span>
                              </label>
                            </div>
                            <div class="checkbox">
                              <label class="checkbox-wrapper">
                                <input type="checkbox" class="checkbox-input" value="kcp_naver_point_order_info"/>
                                <span class="checkbox-tile w-150px">
                                  <img src="/image/naver_payment.jpg" class="pb-4 w-50 h-50" alt=""> 
                                  <span class="checkbox-label">네이버페이 (포인트)</span>
                                </span>
                              </label>
                            </div>
                          </fieldset>
                        </section>
                       
                        <div id="auth_payment">
                          <form name="kcp_auth_order_info" id="kcp_auth_order_info" action="/payment/authPay" method="post" accept-charset="euc-kr" >
                            <input type="hidden" name="ordr_idxx" value="${authOrderResult.ordr_idxx }" />
                            <input type="hidden" name="good_name" value="${authOrderResult.good_name }" />
                            <input type="hidden" name="good_mny" value="${authOrderResult.good_mny }" />
                            <input type="hidden" name="buyr_name" value="${authOrderResult.buyr_name }" />
                            <input type="hidden" name="site_cd" value="${authOrderResult.site_cd }" />
                            <!-- 고정값 -->
                            <input type="hidden" name="req_tx" value="pay" /> <input type="hidden" name="pay_method" value="100000000000" />
                            <input type="hidden" name="site_name" value="payup" />
                            <!--
                              ※ 필 수
                              필수 항목 : 표준웹에서 값을 설정하는 부분으로 반드시 포함되어야 합니다
                              값을 설정하지 마십시오
                            -->
                            <input type="hidden" name="res_cd" value="" /> <input type="hidden" name="res_msg" value="" /> <input type="hidden" name="enc_info" value="" />
                            <input type="hidden" name="enc_data" value="" /> <input type="hidden" name="ret_pay_method" value="" />
                            <input type="hidden" name="tran_cd" value="" /> <input type="hidden" name="use_pay_method" value="" />
                            <input type="hidden" name="buyr_mail" value="" /> <input type="hidden" name="ordr_chk" value="" />
                            <!-- 2012년 8월 18일 전자상거래법 개정 관련 설정 부분 -->
                            <!-- 제공 기간 설정 0:일회성 1:기간설정(ex 1:2012010120120131) -->
                            <input type="hidden" name="good_expr" value="0" />
                            <!-- 표준웹 설정 정보입니다(변경 불가) -->
                            <input type="hidden" name="module_type" value="01" />
                            <!-- 필수 항목 : 결제 금액/화폐단위 -->
                            <input type="hidden" name="currency" value="WON" />
                          </form>
                        </div>
                        <div id="kakao_payment">
                          <form name="kcp_kakao_order_info" id="kcp_kakao_order_info" action="/payment/kakaoPay" method="post" accept-charset="euc-kr">
                            <input type="hidden" name="ordr_idxx" value="${kakaoOrderResult.ordr_idxx }" />
                            <input type="hidden" name="good_name" value="${kakaoOrderResult.good_name }" />
                            <input type="hidden" name="good_mny" value="${kakaoOrderResult.good_mny }" />
                            <input type="hidden" name="buyr_name" value="${kakaoOrderResult.buyr_name }" />
                            <input type="hidden" name="site_cd" value="${kakaoOrderResult.site_cd }" />
                            <!-- 고정값 -->
                            <input type="hidden" name="req_tx" value="pay" />
                            <input type="hidden" name="pay_method" value="100000000000" />
                            <input type="hidden" name="currency" value="410" />
                            <input type="hidden" name="kakaopay_direct" value="Y" />
                            <input type="hidden" name="module_type" value="01" />
                            <input type="hidden" name="ordr_chk" value="" />
                            <!--
                      ※ 필 수
                      필수 항목 : 표준웹에서 값을 설정하는 부분으로 반드시 포함되어야 합니다
                      값을 설정하지 마십시오
                      -->
                            <input type="hidden" name="res_cd" value="" />
                            <input type="hidden" name="res_msg" value="" />
                            <input type="hidden" name="enc_info" value="" />
                            <input type="hidden" name="enc_data" value="" />
                            <input type="hidden" name="ret_pay_method" value="" />
                            <input type="hidden" name="tran_cd" value="" />
                            <input type="hidden" name="use_pay_method" value="" />
                            <input type="hidden" name="card_pay_method" value="" />
                          </form>
                        </div>
                        <div id="naver_card_payment">
                          <form name="kcp_naver_card_order_info" id="kcp_naver_card_order_info" action="/payment/naverPay" method="post" accept-charset="euc-kr">
                            <input type="hidden" name="ordr_idxx" value="${naverOrderResult.ordr_idxx }" />
                            <input type="hidden" name="good_name" value="${naverOrderResult.good_name }" />
                            <input type="hidden" name="good_mny" value="${naverOrderResult.good_mny }" />
                            <input type="hidden" name="buyr_name" value="${naverOrderResult.buyr_name }" />
                            <input type="hidden" name="site_cd" value="${naverOrderResult.site_cd }" />

                            <!-- 고정값 -->
                            <input type="hidden" name="req_tx" value="pay" />
                            <input type="hidden" name="pay_method" value="100000000000" />
                            <input type="hidden" name="currency" value="410" />
                            <input type="hidden" name="module_type" value="01" />
                            <input type="hidden" name="naverpay_direct" value="Y" />
                            <input type="hidden" name="ordr_chk" value="" />

                            <!-- 네이버페이 포인트 결제 시 사용 -->
                            <input type="hidden" name="naverpay_point_direct" value="N" />
                            <!--    
                            ※ 필 수
                            필수 항목 : 표준웹에서 값을 설정하는 부분으로 반드시 포함되어야 합니다
                            값을 설정하지 마십시오
                            -->
                            <input type="hidden" name="res_cd" value="" />
                            <input type="hidden" name="res_msg" value="" />
                            <input type="hidden" name="enc_info" value="" />
                            <input type="hidden" name="enc_data" value="" />
                            <input type="hidden" name="ret_pay_method" value="" />
                            <input type="hidden" name="tran_cd" value="" />
                            <input type="hidden" name="use_pay_method" value="" />
                            <input type="hidden" name="card_pay_method" value="" />
                          </form>
                        </div>
                        <div id="naver_point_payment">
                          <form name="kcp_naver_point_order_info" id="kcp_naver_point_order_info" action="/payment/naverPay" method="post" accept-charset="euc-kr">
                            <input type="hidden" name="ordr_idxx" value="${naverOrderResult.ordr_idxx }" />
                            <input type="hidden" name="good_name" value="${naverOrderResult.good_name }" />
                            <input type="hidden" name="good_mny" value="${naverOrderResult.good_mny }" />
                            <input type="hidden" name="buyr_name" value="${naverOrderResult.buyr_name }" />
                            <input type="hidden" name="site_cd" value="${naverOrderResult.site_cd }" />

                            <!-- 고정값 -->
                            <input type="hidden" name="req_tx" value="pay" />
                            <input type="hidden" name="pay_method" value="100000000000" />
                            <input type="hidden" name="currency" value="410" />
                            <input type="hidden" name="module_type" value="01" />
                            <input type="hidden" name="naverpay_direct" value="Y" />
                            <input type="hidden" name="ordr_chk" value="" />

                            <!-- 네이버페이 포인트 결제 시 사용 -->
                            <input type="hidden" name="naverpay_point_direct" value="Y" />
                            <!--    
                            ※ 필 수
                            필수 항목 : 표준웹에서 값을 설정하는 부분으로 반드시 포함되어야 합니다
                            값을 설정하지 마십시오
                            -->
                            <input type="hidden" name="res_cd" value="" />
                            <input type="hidden" name="res_msg" value="" />
                            <input type="hidden" name="enc_info" value="" />
                            <input type="hidden" name="enc_data" value="" />
                            <input type="hidden" name="ret_pay_method" value="" />
                            <input type="hidden" name="tran_cd" value="" />
                            <input type="hidden" name="use_pay_method" value="" />
                            <input type="hidden" name="card_pay_method" value="" />
                          </form>
                        </div>
                        </div>
                    </section>
                </td>
              </tr>
            </table>
            <br /><br />
            <div class="d-grid gap-2 col-6 mx-auto">
              <button class="btn btn-primary" id="orderRequest" type="button" style="height: 65px">
                결제하기
              </button>
            </div>
          </form>
        </div>
        <br />
      </form>
    </section>
  </body>
  
</html>
