<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%>

<!DOCTYPE html>
<html lang="ko">
  <body>
    <form id="payForm" name="payForm" action="/payment/checkout">
      <div class="container">
        <table class="table table-hover table table-striped">
          <tr>
            <td>카드번호: <input type="text" id="" name="cardNo" /></td>
          </tr>
          <tr>
            <td>유효기간(월): <input type="text" id="" name="expireMonth" /></td>
          </tr>
          <tr>
            <td>유효기간(년): <input type="text" id="" name="expireYear" /></td>
          </tr>
          <tr>
            <td>비밀번호 앞 2자리: <input type="text" id="" name="cardPw" /></td>
          </tr>
          <tr>
            <td>금액: <input type="text" id="" name="amount" /></td>
          </tr>
          <tr>
            <td><input type="submit" value="결제하기" /></td>
          </tr>
        </table>
      </div>
    </form>
  </body>
</html>
