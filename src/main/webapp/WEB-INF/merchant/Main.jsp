<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="" isErrorPage="false" import="java.util.Date" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="kr">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>main</title>
  </head>
  <body>
    <main class="container">
      <section id="slider">
        <!-- Slider main container -->
        <div class="swiper">
          <!-- Additional required wrapper -->
          <div class="swiper-wrapper">
            <!-- Slides -->
            <div class="swiper-slide">
              <img
                src="https://images.pexels.com/photos/4393021/pexels-photo-4393021.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
                alt=""
                srcset=""
                class="img-fluid" />
            </div>
            <div class="swiper-slide">
              <img
                src="https://images.pexels.com/photos/8969237/pexels-photo-8969237.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
                alt=""
                srcset=""
                class="img-fluid" />
            </div>
            <div class="swiper-slide">
              <img
                src="https://images.pexels.com/photos/718742/pexels-photo-718742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
                alt=""
                srcset=""
                class="img-fluid" />g
            </div>
          </div>
          <!-- If we need pagination -->
          <div class="swiper-pagination"></div>

          <!-- If we need navigation buttons -->
          <div class="swiper-button-prev"></div>
          <div class="swiper-button-next"></div>

          <!-- If we need scrollbar -->
          <div class="swiper-scrollbar"></div>
        </div>
      </section>
      <div id="item">
        <h1>추천 레시피</h1>
        <table class="item-table">
          <tr>
            <th>
              <a href="">
                <img alt="" src="../images/food.jpg" height="300" width="300" />
              </a>
            </th>
          </tr>
          <tr>
            <td class="food-name">간장 연어구이</td>
          </tr>
        </table>
        <div class="grid-it">
          <div>
            <a href="">
              <img alt="" src="../images/food.jpg" height="300" width="300" />
            </a>
            <p>000</p>
          </div>
          <div>
            <a href="">
              <img alt="" src="../images/food.jpg" height="300" width="300" />
            </a>
            <p>000</p>
          </div>
          <div>
            <a href="">
              <img alt="" src="../images/food.jpg" height="300" width="300" />
            </a>
            <p>000</p>
          </div>
        </div>
      </div>

      <div class="container text-center">
        <div class="row gx-5">
          <div class="col bg-primary"><div class="m-3">1</div></div>
          <div class="col bg-danger"><div class="m-3">2</div></div>
          <div class="col bg-success"><div class="m-3">3</div></div>
        </div>
      </div>

      <div class="container px-4 text-center">
        <div class="row gx-5">
          <div class="col">
            <div class="p-3">Custom column padding</div>
          </div>
          <div class="col">
            <div class="p-3">Custom column padding</div>
          </div>
        </div>
      </div>
    </main>
  </body>
</html>
