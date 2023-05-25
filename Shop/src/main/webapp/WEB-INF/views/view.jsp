<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	결과페이지 입니다.
	
	당신의 id는 ${req_id }입니다
	당신의 id는 ${req_id == "1234" }입니다
	당신의 id는 ${req_id == "134" }입니다<br>
	
	이것은 >: (lt), < gt입니다.
	req_id2: ${req_id2 }<br>
	<%

	String req_id2= (String) request.getAttribute("req_id2");
	
	System.out.println("jsp:req_id2 :" +req_id2 );
%>
<hr>
list_id : ${list_id } <br>
<!-- controller의 list_id를 불러옴 -->

<!-- <% %>  java로 사용해도 됨 -->

<table>
<tr>
	<th>아이디</th>	
</tr>
						<!-- request에서 온 것--><!-- 10까지만 작동해라. -->
	<c:forEach var="item" items="${list_id }"  end= "10"> 
<%-- <c:forEach var="i" begin="0" end= "10"> --%>
	<tr>
		<td>
		<c:if test="${item eq'admin' }">
			<strong>
			${item}
			</strong>
		</c:if>
			<c:if test="${item !='admin' }">
			${item}
			</c:if>
		</td>	
		<!-- key값으로 el태그에 넣어줌 -->
	</tr>
	</c:forEach>
</table>


</body>
</html>