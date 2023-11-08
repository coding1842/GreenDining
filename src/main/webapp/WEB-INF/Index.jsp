<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="" isErrorPage="false" import="java.util.Date" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Webpack 번들 적용 -->
    <link rel="stylesheet" href="/dist/bundle/bundle.css" />
    <script src="/dist/bundle/bundle.js"></script>
    <script src="/js/Script.js"></script>
    <!-- SASS / BABLE NODE.js -->
    <link rel="stylesheet" href="/dist/gulp/css/main.css" />

    <!--  -->
    <script src="https://kit.fontawesome.com/dd4730185a.js" crossorigin="anonymous"></script>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <title>Document</title>
  </head>
  <body>
    <div id="wrap">
      <header>
        <c:import url="Header.jsp" />
      </header>
      <main>
        <c:import url="${main}.jsp" />
        <c:import url="Aside.jsp" />
      </main>
      <footer>
        <c:import url="Footer.jsp" />
      </footer>
    </div>
  </body>
  <script src="https://kit.fontawesome.com/dd4730185a.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</html>
