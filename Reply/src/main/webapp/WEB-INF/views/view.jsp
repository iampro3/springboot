<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
writer: ${dto.writer }<br>
title: ${dto.title }<br>
content<br>
<textarea>
${dto.content }
</textarea>
<br><br>
<a href="/list">목록으로</a><br><br>
<a href="/modifyForm?id=${dto.id }">수정하기</a><br><br>
<a href="/reply?parent_id=${dto.id }">답글달기</a><br>
</body>
</html>