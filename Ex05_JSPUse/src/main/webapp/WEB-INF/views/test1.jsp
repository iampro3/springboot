<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int a = 10;
	System.out.println(a);
	
	// html에 적어주는 역할.
	out.println("<h1>hello world! "+ a +"</h1>");
%>

</body>
</html>