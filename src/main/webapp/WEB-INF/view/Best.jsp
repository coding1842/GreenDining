<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="" isErrorPage="false" import="java.util.Date" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <section class="container">
      <div class="row">
        <div class="col"></div>
        <div class="col">
          <section id="category_group">
            <h3 class="mb-5 fw-bold">카테고리</h3>
            <fieldset class="checkbox-group">
              <legend class="checkbox-group-legend">MD 추천</legend>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <span class="material-symbols-outlined fs-1"> apps </span>
                    </span>
                    <span class="checkbox-label">전체</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" checked />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon"> <i class="fa-solid fa-lemon fs-2 mb-3"></i> </span>
                    <span class="checkbox-label">과일</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa-solid fa-carrot fs-2 mb-3"></i>
                    </span>
                    <span class="checkbox-label">채소</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa-solid fa-bowl-rice fs-2 mb-3"></i>
                    </span>
                    <span class="checkbox-label">쌀/잡곡</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa-solid fa-fish-fins fs-2 mb-3"></i>
                    </span>
                    <span class="checkbox-label">수산물</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa-solid fa-bacon fs-2 mb-3"></i>
                    </span>
                    <span class="checkbox-label">축산물</span>
                  </span>
                </label>
              </div>
              <div class="checkbox">
                <label class="checkbox-wrapper">
                  <input type="checkbox" class="checkbox-input" />
                  <span class="checkbox-tile">
                    <span class="checkbox-icon">
                      <i class="fa-solid fa-egg fs-2 mb-3"></i>
                    </span>
                    <span class="checkbox-label">가공식품</span>
                  </span>
                </label>
              </div>
            </fieldset>
          </section>
        </div>
      </div>
    </section>
  </body>
</html>
