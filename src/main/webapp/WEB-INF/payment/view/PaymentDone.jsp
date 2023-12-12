<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="" isErrorPage="false" import="java.util.Date" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>

<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
  crossorigin="anonymous" />
<script
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
  crossorigin="anonymous"></script>
<!DOCTYPE html>
<html lang="ko">
  <body class="">
    <div class="bg-secondary-subtle h-800px">
      <div class="mx-auto w-500px">
        <div id="payment_done_upper" class="text-center pt-3">
          <span class="material-symbols-outlined d-inline-block mx-auto fs-1"> task_alt </span>
          <p style="font-size: 20px">${ssKey.name}님, 주문하신 소중한 상품을 곧 보내 드릴게요!</p>
          <div class="payment_done_btn">
            <a href="/user/my-page/order/${order.id}" class="">
              <div class="rounded-3 border-1 border d-inline-block bg-white border-secondary p-3 px-4">주문내역 보기</div>
            </a>
            <a href="/">
              <div class="rounded-3 border-1 border d-inline-block p-3 px-4 text-white" style="background-color: rgb(0, 195, 20)">쇼핑 계속하기</div>
            </a>
          </div>
        </div>
        <div class="address_box mt-5 rounded-3 border-1 border d-inline-block p-3 px-4 bg-white w-500px position-relative">
          <span class="material-symbols-outlined fs-2"> package </span>
          <span class="ms-2 fs-5 position-absolute" style="top: 18px">${address.name}</span>
          <p class="mt-4 fw-bold">${address.name}, <span class="fw-bold">${address.phone}</span></p>
          <p class="mb-0">${address.address}, ${address.address2}</p>
          <p class="text-secondary mb-0">${address.request_option}</p>
        </div>
        <div class="payment_box mt-5 rounded-3 border-1 border d-inline-block p-3 px-4 bg-white w-500px position-relative">
          <p>
            총 결제 <span class="fw-bolder fs-5"><fmt:formatNumber value="${resultMap.amount}" pattern="#,##0" />원</span>
          </p>
          <hr />
          <p>
            <span class="float-start">${order.payment}</span>
            <span class="float-end"><fmt:formatNumber value="${resultMap.amount}" pattern="#,##0" />원</span>
          </p>
        </div>

        <!-- <h5>응답 코드 : ${resultMap.responseCode}</h5>
      <h5>응답 메시지: ${resultMap.responseMsg}</h5>
      <h5>거래번호 : ${resultMap.transactionId}</h5>
      <h5>승인일시 : ${resultMap.authDateTime}</h5>
      <h5>승인번호 : ${resultMap.authNumber}</h5>
      <h5>주문번호 : ${resultMap.orderNumber}</h5>
      <h5>결제금액 : ${resultMap.amount}</h5>
      <h5>카드사명 : ${resultMap.cardName}</h5>
      <h5>카카오 알림 결과 코드 : ${resultMap.kakaoResultCode}</h5>
      <h5>무이자 할부 적용 여부 : ${resultMap.noinf}</h5> -->

        <!-- 복합과세 결제만 전달 -->
        <!-- <h5>과세금액 : ${resultMap.taxAmount}</h5>
      <h5>부가세 : ${resultMap.varAmount}</h5>
      <h5>면세금액 : ${resultMap.freeAmount}</h5> -->
      </div>
    </div>
  </body>
</html>
