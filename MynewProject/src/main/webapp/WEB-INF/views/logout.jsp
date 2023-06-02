<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout 되었습니다.</title>
</head>
<body>

<%
//Cookie user = new Cookie("id", "");
session.invalidate();//세션의 모든 속성 제거
response.sendRedirect("index.jsp");
%>
<!-- 로그아웃 처리 완료 -->

</body>
</html>