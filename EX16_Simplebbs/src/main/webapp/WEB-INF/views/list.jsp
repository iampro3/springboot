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
<a href = "/writeForm">글쓰기</a><br>
<br>
<table border="1">
	<tr>
		<td>글번호</td>
		<td>작성자</td>
		<td>제목</td>
		
		<td>삭제</td>
		<!-- <td>글 내용</td> -->
	</tr>
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.id }</td>
		<td>${dto.writer }</td>
						<!-- 보내고 싶은 id -->
		<td><a href="/view?id=${dto.id }">${dto.title }</a></td>
		<td><a href="delete?id=${dto.id }"> 삭제 </a></td>	<!-- 체크박스로 바꾸기 -->
		<%-- <td>${dto.content }</td> --%>

<%-- 		<td>${list.id }</td> --%>
<%-- 		<td>${list.writer }</td> --%>
<%-- 		<td>${list.title }</td> --%>
<%-- 		<td>${list.content }</td> --%>
	</tr>	
	</c:forEach>
</table><br>
<form action="/testIF">
	<select name ="type">  <!-- dto에 없음 -->
		<option value="선택">선택</option>
		<option value="writer">writer</option>
		<option value="title">title</option>
	</select>
	<input type="text" name="keyword" placeholder="검색어를 입력하세요." >
<!-- 	<input type="text" name="title" placeholder="검색어를 입력하세요." > -->
	<input type="submit" value="검색">
</form>


</body>
</html>