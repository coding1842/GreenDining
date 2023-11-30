<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%>

<!DOCTYPE html>
<html lang="ko">
  <body>
    <div class="container">
      <h3>결제완료</h3>
      ${resultMap}
      <h5>응답 코드 : ${resultMap.responseCode}</h5>
      <h5>응답 메시지: ${resultMap.responseMsg}</h5>
      <h5>거래번호 : ${resultMap.transactionId}</h5>
      <h5>승인일시 : ${resultMap.authDateTime}</h5>
      <h5>승인번호 : ${resultMap.authNumber}</h5>
      <h5>주문번호 : ${resultMap.orderNumber}</h5>
      <h5>결제금액 : ${resultMap.amount}</h5>
      <h5>카드사명 : ${resultMap.cardName}</h5>
      <h5>카카오 알림 결과 코드 : ${resultMap.kakaoResultCode}</h5>
      <h5>무이자 할부 적용 여부 : ${resultMap.noinf}</h5>

      <!-- 복합과세 결제만 전달 -->
      <!-- <h5>과세금액 : ${resultMap.taxAmount}</h5>
      <h5>부가세 : ${resultMap.varAmount}</h5>
      <h5>면세금액 : ${resultMap.freeAmount}</h5> -->
    </div>
  </body>
</html>
