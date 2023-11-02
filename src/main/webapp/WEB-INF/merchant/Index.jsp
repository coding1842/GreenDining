<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="" isErrorPage="false" 
 import="java.util.Date" 
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="en">
<head>
  	<link rel="stylesheet" href="/css/Header.css" />
    <link rel="stylesheet" href="/css/Style.css" />
    <link rel="stylesheet" href="/css/Sizing.css" />
    <link rel="stylesheet" href="/css/Main.css" />
    <link rel="stylesheet" href="/css/Footer.css" />
    <link rel="stylesheet" href="/css/Login.css" />
    <link rel="stylesheet" href="/css/SmartStoreMain.css" />
    <link rel="stylesheet" href="/css/ProductDetail.css" />
    <link rel="stylesheet" href="/css/ProductList.css" />
 
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   
    
    <title>Document</title>
</head>
<body>
    <div id="wrap">
    	<header>
        	<c:import url="../Header.jsp"/>
        </header>
        <main>
        	<c:import url='${main}.jsp'/>
        </main>
        <footer>
        	<c:import url="../Footer.jsp"/>
        </footer>
    </div>
    
</body>
    <script src="https://kit.fontawesome.com/dd4730185a.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script src="js/Script.js"></script>
</html>