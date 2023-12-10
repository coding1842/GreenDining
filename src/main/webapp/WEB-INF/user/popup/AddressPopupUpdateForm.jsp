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
    <script src="/js/zipCheck.js"></script>
    <script src="/dist/bundle/bundle.js"></script>
    <title>배송지 수정</title>
  </head>
  <body class="bg-white">
    <div style="text-align: center">
      <div id="" style="width: 490px; display: inline-block">
        <div style="width: 490px; height: 40px" class="position-relative z-3 overflow-hidden bg-white">
          <div class="position-fixed border-bottom border-1 border-secondary bg-white" style="width: 490px; height: 40px">
            <h6 class="fw-bold pt-2">배송지 수정</h6>
          </div>
        </div>
        <form action="" id="addressForm" method="post">
          <div class="address_out_box text-start">
            <div class="address_in_box p-3 position-relative">
              <div id="icon_name_input" class="h-50px">
                <div id="icon_name_box" class="float-start bg-white border-1 w-50px h-50px m-0 position-relative" style="border-style: solid">
                  <span class="material-symbols-outlined fs-1 text-secondary d-inline-block position-absolute top-50 start-50 translate-middle">
                    account_box
                  </span>
                </div>
                <div class="fw-bold mb-2 float-start border-0 border-white h-100" style="width: calc(100% - 50px)">
                  <input placeholder="받는 사람" type="text" name="name" class="w-100 h-100" value="${address.name}" />
                </div>
              </div>
              <div id="icon_address_input" class="h-50px">
                <div id="icon_address_box" class="float-start bg-white border-1 w-50px h-100px m-0 position-relative" style="border-style: solid">
                  <span class="material-symbols-outlined fs-1 text-secondary d-inline-block position-absolute top-50 start-50 translate-middle">
                    pin_drop
                  </span>
                </div>
                <div class="fw-bold mb-2 float-start border-0 border-white h-100" style="width: calc(100% - 50px)">
                  <input
                    type="text"
                    placeholder="우편번호 찾기"
                    id="sample6_address"
                    onclick="zipCheck()"
                    readly
                    name="address"
                    class="w-100 h-100"
                    value="${address.address}" />
                  <input type="text" id="sample6_detailAddress" name="address2" class="w-100 h-100" value="${address.address2}" />
                  <input type="hidden" name="zipcode" id="sample6_postcode" />
                  <input type="hidden" id="sample6_extraAddress" title="참고항목" />
                </div>
              </div>
              <div class="clearfix"></div>
              <div id="icon_phone_input" class="h-50px mt-2">
                <div id="icon_phone_box" class="float-start bg-white border-1 w-50px h-50px m-0 position-relative" style="border-style: solid">
                  <span class="material-symbols-outlined fs-1 text-secondary d-inline-block position-absolute top-50 start-50 translate-middle">
                    phone
                  </span>
                </div>
                <div class="fw-bold mb-2 float-start border-0 border-white h-100" style="width: calc(100% - 50px)">
                  <input type="tel" placeholder="휴대폰 번호" name="phone" class="w-100 h-100" value="${address.phone}" />
                </div>
              </div>
              <div id="icon_request_input" class="h-100px">
                <div id="icon_request_box" class="float-start bg-white border-1 w-50px h-100px m-0 position-relative" style="border-style: solid">
                  <span class="material-symbols-outlined fs-1 text-secondary d-inline-block position-absolute top-50 start-50 translate-middle">
                    message
                  </span>
                </div>
                <div class="fw-bold mb-2 float-start border-0 border-white h-50" style="width: calc(100% - 50px)">
                  <input
                    type="text"
                    placeholder="배송 요청 사항를 입력하세요."
                    name="request_option"
                    class="w-100 h-100"
                    value="${address.request_option}" />
                  <input
                    type="text"
                    name="request_text"
                    placeholder="기타 요청 사항를 입력하세요."
                    class="w-100 h-100"
                    value="${address.request_text}" />
                </div>
              </div>
              <div id="address_btn_group" class="mt-5 w-100">
                <button type="button" id="address_update_btn" class="w-100 bg-primary text-white h-40px">저장</button>
                <button type="button" id="address_delete_btn" class="w-100 mt-3 bg-white text-danger h-40px">삭제</button>
                <input type="hidden" name="id" value="${address.id}" />
                <input type="hidden" name="user_id" value="${address.user_id}" />
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>
