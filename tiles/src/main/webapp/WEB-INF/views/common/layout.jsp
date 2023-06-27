<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>		
	<tiles:insertAttribute name="title"/> 
</title>
</head>

<body>
	<div>
		<div>
		<!-- header.jsp -->
		<tiles:insertAttribute name="header"/> 
		</div>
		<div>
		<!-- main.jsp -->
		<tiles:insertAttribute name="main"/> 
		<!-- mypage.jsp -->
		</div>
		<div>
		<!-- footer.jsp -->
		<tiles:insertAttribute name="footer"/> 
		</div>
	</div>
</body>
</html>