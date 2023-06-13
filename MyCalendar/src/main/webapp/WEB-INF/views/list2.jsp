<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>

	 <link rel="stylesheet" href="css/style_list.css">

	<style>
		
		
        th{background-color: rgb(187, 155, 233);color: aliceblue;}
        th,td{
            border: 0.4px solid grey;
            padding: 10px 5px;
            background-color:rgb(231,226,241);
            height:120px;
            width:160px;
            /* width: 100px; */
        }
        
       	#input .button{
	    display: block;
	    background-color: rgb(231,226,241);
	    color: blanchedalmond;
	    font-size: 1.0rem;
	    color: rgb(133, 103, 146);
	    margin-top: 10px;   /* 내가 추가함 */
	    line-height: 25px;    /* 버튼 안에서 글자 높이 */
	    border-radius: 5px;
	    width: 170px;
	    height: 40px;
	    justify-content: space-between;
	    align-items: center;    
	}
    </style>
</head>
<body>
<!--  <div class="container"> -->
<div style="text-align:center;">
        
        <!-- 제목 영역 -->
        <div class="main-title">
            <h1>My calendar</h1>
            <p><a href=""><</a>  2023년 6월  <a href="">></a></p>
        </div>

        <!-- 게시글 목록 -->
        <table class="board" style="width:800px; margin:auto;" border="1">

         <thead>
		<br>

	<form action="/testIf">
		<select name="type">
			<option value="선택">선택</option>
			<option value="w">작성자</option>
			<option value="t">제목</option>
		</select> 
		<input type="text" name="keyword" placeholder="검색어를 입력하세요"> 
		<input type="submit" value="검색">
	</form>

	<br>
	<br>
	<a href="/writeForm">글쓰기</a>
	<br><br>
	<form action="/testForeach">
		<input type="submit" value="일정 조회">
		
		
	
		<tbody>
			<tr>
				<td>체크</td>
				<td class="num">글번호</td>
				<td class="writer">작성자</td>
				<td class="title">제목</td>
				<td>등록일자</td>
				<td>조회수</td>
				<!-- 		<td>글 내용</td> -->
				<td>삭제</td>
			</tr>
			</thead>
			<c:forEach var="dto" items="${list }">
				<tr>
					<td "><input type="checkbox" name="chk" value="${dto.id }"></td>
					<td class="num">${dto.id }</td>
					<td class="writer">${dto["writer"] }</td>
					<td class="title"><a href="/view?id=${dto.id }">${dto.title }</a></td>
					
					<td ><fmt:formatDate value="${dto.createDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
					<td >${board.viewcnt }</td>
					<td ><a href="/delete?id=${dto.id }">삭제</a></td>
					
					
				</tr>
			</c:forEach>	
		
	</form>
	</tbody>
	</table>
	</div>
</body>
</html>