<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write</title>
   
</head>

<body>
<!-- id는 만들어 놨다. seq에서 불러오면 된다.html에서 java로 만들고 db에서 데이터 만들어 밀어 넣기 -->
<!-- wriht, title, content를 입력받음 -->
<form action="/write" method="post">
	writer : <input type ="text" name="writer"><br>
	title : <input type ="text" name="title"><br>
	content
	<textarea name="content" cols="50" rows="10">		
	</textarea>
	<input type="submit" value="글쓰기">
</form>

</body>
</html>