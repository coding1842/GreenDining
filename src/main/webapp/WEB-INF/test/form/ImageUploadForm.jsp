<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="" isErrorPage="false" import="java.util.Date" %> <%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Imgur 이미지 업로드 테스트</title>
  </head>
  <body>
    <form action="/imgur/upload" method="post" enctype="multipart/form-data">
      <input type="file" name="fileList" id="" multiple />
      <input type="number" name="group_id" id="" value="3" />
      <input type="submit" value="" />
    </form>
  </body>
</html>
