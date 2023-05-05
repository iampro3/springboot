<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${member2 }<br>

당신의 id : ${member2.id }<br>
당신의 name : ${member2["name"] }<br>

<hr>
DTO<br>
당신의 id : ${memberDTO.id }<br>
당신의 name : ${memberDTO["name"] }<br>


</body>
</html>