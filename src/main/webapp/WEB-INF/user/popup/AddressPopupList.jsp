<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous" />
    <link rel="stylesheet" href="/dist/bundle/bundle.css" />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/dist/bundle/bundle.js"></script>
    <title>배송지 선택</title>
  </head>
  <body class="bg-white">
    <div style="text-align: center">
      <div id="" style="width: 490px; display: inline-block">
        <div style="width: 490px; height: 40px" class="position-relative z-3 overflow-hidden bg-white">
          <div class="position-fixed border-bottom border-1 border-secondary bg-white" style="width: 490px; height: 40px">
            <h6 class="fw-bold pt-2">배송지 선택</h6>
          </div>
        </div>

        <c:choose>
          <c:when test="${fn:length(addressDTOList) > 0}">
            <c:forEach var="address" items="${addressDTOList}" varStatus="index">
              <div class="address_out_box border-1 border-secondary text-start" style="border-style: solid">
                <div class="address_in_box p-3 position-relative">
                  <div class="fw-bold mb-2">${address.name}</div>
                  <div>${address.address} , ${address.address2}</div>
                  <div>${address.phone}</div>
                  <div class="mb-2">
                    ${address.request_option}
                    <c:if test="${address.request_text != null}"> / ${address.request_text}</c:if>
                  </div>
                  <a href="/address/popup/update/${address.id}">
                    <button type="button" class="w-70px border-1 border-secondary text-primary bg-white" style="height: 35px">수정</button>
                  </a>
                  <input type="hidden" class="address_popup_id" name="" value="${address.id}">
                  <input type="hidden" class="address_popup_name" name="" value="${address.name}">
                  <input type="hidden" class="address_popup_address" name="" value="${address.address}">
                  <input type="hidden" class="address_popup_address2" name="" value="${address.address2}">
                  <input type="hidden" class="address_popup_phone" name="" value="${address.phone}">
                  <input type="hidden" class="address_popup_request_option" name="" value="${address.request_option}">
                  <input type="hidden" class="address_popup_request_text" name="" value="${address.request_text}">
                  <input type="hidden" class="address_popup_zipcode" value="${address.zipcode}" name="">
                  <button type="button" class="address_select_btn w-70px border-0 text-white bg-primary float-end" style="height: 35px">
                    선택
                  </button>
                </div>
              </div>
            </c:forEach>
          </c:when>
          <c:when test="${fn:length(addressDTOList)==0}">
            <p style="text-align: center; padding-top: 30px">등록된 주소정보가 없습니다.</p>
          </c:when>
        </c:choose>
        <div style="text-align: center" class="mt-3 h-40px">
          <div style="display: inline-block" class="w-100">
            <button onclick="location.href='/address/popup/form'" class="bg-white w-100 h-50px border-1 position-relative" type="button">
              <span class="text-primary fw-bold h-100 d-inline-block position-absolute top-0 start-50 translate-middle-x" style="line-height: 50px"
                >배송지 추가</span
              >
            </button>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
