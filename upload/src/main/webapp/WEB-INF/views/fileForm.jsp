<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/uploadOk" method="post" enctype="multipart/form-data" accept-charset="utf-8">
		<input type="file" name="filename"><br><br><br>
		<input type="submit" value="업로드">
	</form>
	
	<hr>
	<table border=1>
		<tr>
			<th>파일 경로</th>
			<th>파일 이름</th>
			<th>파일 크기</th>
			<th>미리보기</th>
		</tr>
	<c:forEach var="map" items="${fileList}">
		<tr>
			<td><c:url value="${map.path }"/></td>
			<td style="padding:10px;">
				<c:url value="/download" var="url">
					<c:param name="path" value="${map.path }" />
				</c:url>
				<a href="${url }">
					${map.name }
				</a>
			</td>
			<td>${map.size }</td>
			<td><img src="/readMail?id=${map.name }" style="display:none;"></td>
		</tr>
	</c:forEach>
	</table>

</body>
</html>