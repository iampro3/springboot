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
<%
	// context는 서버에 등록된 프로젝트 단위임
	String ctxPath = request.getContextPath();
	System.out.println("ctxPath : [" + ctxPath + "]");
%>

<form action="/create">
    작성자 : <input type="text" name="writer" value="${dto.writer}"> <br />
    내용 : <input type="text" name="content" value="${dto.content}"> <br />
    <input type="submit" value="전송"> <br />
</form>

</body>
</html>