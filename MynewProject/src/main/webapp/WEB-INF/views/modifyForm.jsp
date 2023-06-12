<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyForm</title>
</head>
<body>
<!-- <script> -->
// let old_writer = "${dto.writer }"
<!-- 	</script> -->
<h1>수정</h1>
<!-- <form action="/modifyForm" method="post"> 데이터 가릴 때 post:select/ 다 보여줄 떄 get:insert-->
<!-- <form action="/modifyForm" method="put"> update -->
<form action="/modify" method="post">
	writer : <input type="text" name="writer" value="${dto.writer }"><br>
	title : <input type="text" name="title" value="${dto.title }"><br>
	content<br>
	<textarea name="content" cols="50" rows="10">${dto.content }
	</textarea><br>
	<!-- 글쓰기 버튼 추가하기. -->
	<input type="hidden" name="id" value="${dto.id }">
	<input type="submit" value="수정">
</form>
</body>
</html>