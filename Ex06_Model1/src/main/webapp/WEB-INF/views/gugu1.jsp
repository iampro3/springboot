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

<table border="1">
	<thead>
		<tr>
			<th colspan="5">2단</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>2</td><td>*</td><td>1</td><td>=</td><td>2</td>
		</tr>
		<tr>
			<td>2</td><td>*</td><td>2</td><td>=</td><td>4</td>
		</tr>
		<tr>
			<td>2</td><td>*</td><td>3</td><td>=</td><td>6</td>
		</tr>
		<tr>
			<td>2</td><td>*</td><td>4</td><td>=</td><td>8</td>
		</tr>
		<tr>
			<td>2</td><td>*</td><td>5</td><td>=</td><td>10</td>
		</tr>
		<tr>
			<td>2</td><td>*</td><td>6</td><td>=</td><td>12</td>
		</tr>
		<tr>
			<td>2</td><td>*</td><td>7</td><td>=</td><td>14</td>
		</tr>
		<tr>
			<td>2</td><td>*</td><td>8</td><td>=</td><td>16</td>
		</tr>
		<tr>
			<td>2</td><td>*</td><td>9</td><td>=</td><td>18</td>
		</tr>
	</tbody>
</table>

<hr>
<%
// 이 단계는 이제 끝	
// 	System.out.println("7 * 1 = 7");
// 	System.out.println("7 * 2 = 14");
// 	System.out.println("7 * 3 = 21");
// 	System.out.println("7 * 4 = 28");
// 	System.out.println("7 * 5 = 35");

	// java의 for문을 이용해서
	// 총 4가지 방법으로 출력
	for(int i=1; i<=9; i++){
		System.out.println( "7 * "+ i +" = "+ (7 * i) );
		out.println( "7 * "+ i +" = "+ (7 * i) +"<br>" );
%>
		<c:set var="i2" value="<%= i %>" />
		<strong>7 * ${i2 } = ${7 * i2}</strong><br>
		<em>7 * <%= i %> = <%= 7 * i %></em><br><br>
<%
	}
%>

<hr>
forEach로 출력<br>
<c:forEach var="i" begin="1" end="9">
	<strong>7 * ${i } = ${7 * i}</strong><br>
</c:forEach>

<hr>
홀수만 출력<br>
<c:forEach var="i" begin="1" end="9">
	<c:if test="${ (i mod 2) eq 1 }">
		<em>7 * ${i } = ${7 * i}</em><br>
	</c:if>
</c:forEach>

<hr>
전부 출력<br>
<style>
	.gugu_wrap {
		margin-bottom: 20px; 
		
		border: 1px solid red;
		
		display:inline-block;
		width : 150px;
	}
	.red {
		background-color: #f009;
	}
	.blue {
		background-color: #00f9;
	}
</style>
<c:forEach var="k" begin="2" end="9">
	<div class="gugu_wrap 
		<c:if test="${ k % 2 == 0 }">
			blue
		</c:if>
		<c:if test="${ !(k % 2 == 0) }">
			red
		</c:if>
		">
		<div>${k }단</div>
		<c:forEach var="i" begin="1" end="9">
			<span>${k } * ${i } = ${k * i}<span></span><br>
		</c:forEach>
	</div>
	<c:if test="${ k % 3 == 1 }">
		<br>
	</c:if>
</c:forEach>

<!-- <div> -->
<!-- 	<div>3단</div> -->
<%-- 	<c:forEach var="i" begin="1" end="9"> --%>
<%-- 		3 * ${i } = ${3 * i}<br> --%>
<%-- 	</c:forEach> --%>
<!-- </div> -->






</body>
</html>