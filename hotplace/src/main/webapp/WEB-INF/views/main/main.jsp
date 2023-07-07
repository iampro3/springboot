<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
여기는 main.jsp입니다.
<hr>
key의 값은 : ${key }<br>
id의 값은 : el의 경우 : [${id }], java로 실행 : [<%= request.getParameter("id") %>]
<hr>
pw의 값은 : ${pw }
</body>
</html>