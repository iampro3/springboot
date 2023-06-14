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
            padding: 1px 5px;
            background-color:rgb(231,226,241);
            height:120px;
            width:200px;
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
	
	.selectbox {

    position: relative;
    width: 200px;  /* 너비설정 */
    border: 1px solid #999;  /* 테두리 설정 */
    z-index: 1;
	}
	
	.selectbox select {
	  width: 100%;
	  height: auto;  /* 높이 초기화 */  
	  line-height: normal; /* line-height 초기화 */  
	  font-family: inherit; /* 폰트 상속 */  
	  padding: .8em .5em;  /* 여백과 높이 결정 */  
	  border: 0;
	  opacity: 0;  /* 숨기기 */ 
	  filter: alpha(opacity=0);  /* IE8 숨기기 */
	  
	  -webkit-appearance: none;  /* 네이티브 외형 감추기 */ 
	  -moz-appearance: none;
	  appearance: none;
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
        <table class="board" style="width:1200px; margin:auto;" border="1">

         <thead>
		<br>
	
	<form action="/testIf">
<!-- 		<div class="selectbox"> -->
		<select name="type" >
		
			<option selected>선택&nbsp</option>&nbsp
			<option value="w">작성자&nbsp</option>
			<option value="t">제목&nbsp</option>
		</select> 
		<input type="text" name="keyword" placeholder="검색어를 입력하세요"> 
		<input type="submit" value="검색">
		
	</form>
	
	&nbsp&nbsp
	
	<form action="/testForeach">
		<input type="submit" value="일정 조회">
		<br>
		<br>
		<tbody>
			<tr>
				<td style="width:70px;">체크</td>
				<td>삭제</td>
				<td class="num" >월<br><a href="/writeForm">1</a><br>
<%-- 				<a href="/view?id=${dto.id }">${dto.title }</a><br> --%>
				</td>				
				<td class="writer">화<br><a href="/writeForm">2</a></td>
				<td class="title">수<br><a href="/writeForm">3</a></td>
				<td>목<br><a href="/writeForm">4</a></td>
				<td>금<br><a href="/writeForm">5</a></td>
				<td>토<br><a href="/writeForm">6</a></td>
				<td>일<br><a href="/writeForm">7</a></td>
			
			</tr>
			</thead>
			<c:forEach var="dto" items="${list }">
				<tr>
					
					<td><input type="checkbox" name="chk" value="${dto.id }"></td>
					<td ><a href="/delete?id=${dto.id }">삭제</a></td>
					<td class="num">${dto.id }</td>
					<td class="writer">${dto["writer"] }</td>
					<td class="title"><a href="/writeForm">4</a><br>
					<a href="/view?id=${dto.id }">${dto.title }</a></td>
					<td class="title"><a href="/view?id=${dto.id }">${dto.title }</a></td>
					<td class="title"><a href="/view?id=${dto.id }">${dto.title }</a></td>
					
					<td ><fmt:formatDate value="${dto.createDate }" pattern="yyyy-MM-dd"></fmt:formatDate></td>
					<td >${board.viewcnt }</td>
					
					
				</tr>
			</c:forEach>	
		
	</form>

	
	</tbody>
	</table>
	</div>
</body>
</html>