<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>스마트 스토어 상품 등록</title>
  </head>
  <!-- 사업자로 로그인 된상태임 -->
  <body>
    <div id="product_all">
      <a href="#" id="product_top">상품등록</a>
      <div id="product_box">
        <form action="/product/write" method="post" id="ajaxForm" enctype="multipart/form-data" autocomplete="off">
          <table id="product_table">
            <tr>
              <th>상품명</th>
              <td>
                <input class="chk1" type="text" name="name" title="상품명" placeholder="상품명 입력" />
              </td>
            </tr>

            <tr>
              <th>판매가</th>
              <td><input class="chk1" type="text" name="price" title="상품가격" placeholder="숫자만 입력" />&nbsp;원</td>
            </tr>
            <tr>
              <th>무게</th>
              <td>
                <input type="text" name="weight" title="무게" placeholder="숫자만 입력" />&nbsp;kg
                <br />
                <small>*(순수 상품무게만 포함입니다.)</small>
              </td>
            </tr>
            <tr>
              <th>재고수량</th>
              <td><input class="chk1" type="text" name="stock" title="재고수량" placeholder="숫자만 입력" />&nbsp;개</td>
            </tr>
            <tr>
              <!-- 메인페이지에서 제일먼저 보이는 사진 한장 -->
              <th>상품 대표 이미지</th>
              <td>
                <input class="chk1" type="file" name="fileList" title="대표 이미지" />
                <br />
                <small>*(하나만 선택 가능합니다.)</small>
              </td>
            </tr>
            <tr>
              <th>상품 타입</th>
              <td>
                <select name="status" id="product_status">
                  <option value="PREPARE">준비중</option>
                  <option value="SALE">판매중</option>
                  <option value="CLOSE">판매종료</option>
                </select>
              </td>
            </tr>
            <tr>
              <th class="product_puch_space"></th>
              <td class="product_puch_space">
                <button type="reset" id="product_reset">다시쓰기</button>
                <input class="submit1" type="button" id="imgur_push" value="상품 등록하기" />
                <input type="hidden" name="merchant_id" value="${merchant_id}" />
                <input type="hidden" id="url" value="/imgur/upload" />
              </td>
            </tr>
          </table>
        </form>
      </div>
    </div>
  </body>
</html>
