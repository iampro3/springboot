<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>

<h1>글목록</h1>
<br>
<table border="1">
	<tr>
		<td>글번호</td>
		<td>작성자</td>
		<td>제목</td>
		<td>글 내용</td>
	</tr>
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.id }</td>
		<td>${dto.writer }</td>
		<td>${dto.title }</td>
		<td>${dto.content }</td>

<%-- 		<td>${list.id }</td> --%>
<%-- 		<td>${list.writer }</td> --%>
<%-- 		<td>${list.title }</td> --%>
<%-- 		<td>${list.content }</td> --%>
	</tr>	
	</c:forEach>
</table>


</body>
</html>