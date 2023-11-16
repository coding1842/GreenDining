<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>상품 판매 등록</title>
  </head>
  <body>
    <div id="sale-wrap">
      <h2 style="text-align: center; padding: 10px 0">상품 판매글 등록</h2>
      <form action="/item/write/${sale.id}" method="post" id="ajaxForm" enctype="multipart/form-data" autocomplete="off">
        <table>
          <tr>
            <th>판매글 제목</th>
            <td>
              <input type="text" name="title" id="" value="${sale.title}" />
            </td>
          </tr>
          <tr>
            <th>판매글 상세 설명</th>
            <td>
              <textarea rows="5" cols="30" name="content" value="${sale.content}" placeholder="상품설명을 작성해주세요."></textarea>
            </td>
          </tr>
          <tr>
            <th>카테고리 코드 유형</th>
            <td>
              <select name="category_code" value="${sale.category_code}">
                <option selected="selected">선택</option>
                <option value="10000">과일/견과</option>
                <option value="20000">채소</option>
                <option value="30000">쌀/잡곡</option>
                <option value="40000">축산물</option>
                <option value="50000">수산물</option>
                <option value="60000">가공식품</option>
              </select>
            </td>
          </tr>
          <tr>
            <th>지역 코드 유형</th>
            <td>
              <select name="region_code" value="${sale.region_code}">
                <option selected="selected">선택</option>
                <option value="1000">수도권</option>
                <option value="2000">강원도</option>
                <option value="3000">충청도</option>
                <option value="4000">경상도</option>
                <option value="5000">전라도</option>
                <option value="6000">제주도</option>
              </select>
            </td>
          </tr>

          <tr>
            <th>상태</th>
            <td class="sale_flex">
              <label class="sale-type-label"><input type="radio" name="status" /><span>판매 대기</span></label>
              <label class="sale-type-label"><input type="radio" name="status" /><span>판매중</span></label>
              <label class="sale-type-label"><input type="radio" name="status" /><span>판매 종료</span></label>
            </td>
          </tr>
          <tr>
            <th>할인</th>
            <td>
              <div class="sale_flex">
                <input type="radio" id="sale-discount-yes" class="discount-public" name="sale-discount" />
                <label for="sale-discount-yes" class="discount-public"><span>설정함</span></label>
                <input type="radio" id="sale-discount-none" class="discount-public" name="sale-discount" checked="checked" />
                <label for="sale-discount-none" class="discount-public"><span>설정안함</span></label>
              </div>
              <div id="sale-discount-text" style="display: none">
                <br />
                <input type="text" placeholder="숫자만 입력" name="discount" value="${sale.discount}" class="sale-discount-text" />&nbsp;%
              </div>
              <div id="sale-discount-total" style="display: none">
                <br />
                <input type="text" placeholder="총 금액" class="sale-discount-text" />&nbsp;원(총 금액)
              </div>
            </td>
          </tr>
          <tr>
            <th>판매 시작시간</th>
            <td>
              <input type="datetime-local" name="started_at" value="${sale.started_at}" class="datetime" />
            </td>
          </tr>
          <tr>
            <th>판매 종료시간</th>
            <td>
              <input type="datetime-local" name="ended_at" value="${sale.ended_at}" class="datetime" />
            </td>
          </tr>
          <tr>
            <th>상품 설명 이미지</th>
            <td>
              <input type="file" name="fileList" multiple />
              <br />
              <small>*(여러개 선택 가능합니다.)</small>
            </td>
          </tr>
        </table>
        <div class="sale_flex" id="submit-data-div">
          <button type="reset" id="sale_reset">다시쓰기</button>
          <input class="submit-data" type="button" id="imgur_push" value="상품 등록하기" />
          <input type="hidden" name="merchant_id" value="${ssKey.id}" />
          <input type="hidden" name="image_group_id" value="${sale.image_group_id}" />
          <input type="hidden" id="url" value="/imgur/update" />
        </div>
      </form>
    </div>
  </body>
</html>
