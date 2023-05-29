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
결과페이지 입니다.<br>
당신의 id는 ${ req_id }입니다.<br>
req_id2 : ${ req_id2 }<br>

<%
	String req_id2 = (String) request.getAttribute("req_id2");
	System.out.println("jsp : req_id2 : "+ req_id2);
%>
<hr>
list_id : ${list_id }<br>

<table>
	<tr>
		<th>아이디</th>
	</tr>
<%-- 	<c:forEach var="i" begin="0" end="10"> --%>
	<c:forEach var="item" items="${list_id }">
		<tr>
			<td>
				<c:if test="${ item eq 'admin' }">
					<strong>${item }</strong>
				</c:if>
				<c:if test="${ item != 'admin' }">
					${item }
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>

</body>
</html>
