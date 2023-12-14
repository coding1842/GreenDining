<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="/js/smartstore/ProductForm.js"></script>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>스마트 스토어 상품 수정</title>
  </head>
  <!-- 사업자로 로그인 된상태임 -->
  <body>
    <div id="product_all">
      <a href="#" id="product_top">상품수정</a>
      <div id="product_box">
        <form id="ajaxForm" action="/product/write/${product.id}" method="post" enctype="multipart/form-data" autocomplete="off">
          <table id="product_table">
            <tr>
              <th>상품명</th>
              <td>
                <input class="chk1" type="text" name="name" title="상품명" placeholder="상품명 입력" value="${product.name}" />
              </td>
            </tr>

            <tr>
              <th>판매가</th>
              <td><input class="chk1" type="text" name="price" title="상품가격" placeholder="숫자만 입력" value="${product.price}" />&nbsp;원</td>
            </tr>
            <tr>
              <th>무게</th>
              <td>
                <input type="text" name="weight" title="무게" placeholder="숫자만 입력" value="${product.weight}" />&nbsp;g
                <br />
                <small>*(순수 상품무게만 포함입니다.)</small>
              </td>
            </tr>
            <tr>
              <th>재고수량</th>
              <td><input class="chk1" type="text" name="stock" title="재고수량" placeholder="숫자만 입력" value="${product.stock}" />&nbsp;개</td>
            </tr>
            <tr>
              <th>상품 타입</th>
              <td>
                <select name="status" id="product_status" value="${product.status}">
                  <option value="PREPARE" ${product.status == 'PREPARE' ? 'selected' : ''}>준비중</option>
                  <option value="READY" ${product.status == 'READY' ? 'selected' : ''}>판매중</option>
                  <option value="CLOSE" ${product.status == 'CLOSE' ? 'selected' : ''}>판매종료</option>
                </select>
              </td>
            </tr>
            <tr>
              <th>상품 설명 이미지</th>
              <td>
                <input type="file" name="fileList" />
                <br />
                <small>*(장바구니 또는 주문목록에서 보여질 사진 등록(1장).)</small>
              </td>
            </tr>
            <tr>
              <th class="product_puch_space"></th>
              <td class="product_puch_space">
                <button type="reset" id="product_reset">다시쓰기</button>
                <input class="submit1" type="button" id="imgur_push" value="상품 수정하기" />
                <input type="hidden" name="merchant_id" value="${ssKey.id}" />
                <input type="hidden" name="image_group_id" value="${product.image_group_id}" />
                <input type="hidden" id="url" value="/imgur/update/${product.image_group_id}" />
              </td>
            </tr>
          </table>
        </form>
      </div>
    </div>
  </body>
</html>
