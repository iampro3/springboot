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
	��������� �Դϴ�.
	
	����� id�� ${req_id }�Դϴ�
	����� id�� ${req_id == "1234" }�Դϴ�
	����� id�� ${req_id == "134" }�Դϴ�<br>
	
	�̰��� >: (lt), < gt�Դϴ�.
	req_id2: ${req_id2 }<br>
	<%

	String req_id2= (String) request.getAttribute("req_id2");
	
	System.out.println("jsp:req_id2 :" +req_id2 );
%>
<hr>
list_id : ${list_id } <br>
<!-- controller�� list_id�� �ҷ��� -->

<!-- <% %>  java�� ����ص� �� -->

<table>
<tr>
	<th>���̵�</th>	
</tr>
						<!-- request���� �� ��--><!-- 10������ �۵��ض�. -->
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
		<!-- key������ el�±׿� �־��� -->
	</tr>
	</c:forEach>
</table>


</body>
</html>