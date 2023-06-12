<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" href="/style_list.css">
</head>
<body>

<table width="500" cellpadding="0" cellspacing="0" border="1">
    <tr>
        <td>번호</td>
        <td>작성자</td>
        <td>제목</td>
        <td>삭제</td>
    <tr>
    <c:forEach items="${list}" var="dto">
    <tr>
        <td>${dto.id}</td>
        <td>${dto.writer}</td>
        <td><a href="view?id=${dto.id}">${dto.title}</a></td>
        <td><a href="delete?id=${dto.id}">X</a></td>
    <tr>
    </c:forEach>
</table>

<p><a href="writeForm">글작성</a></p>

<!-- Board -->

 <div class="container">
        
        <!-- 제목 영역 -->
        <div class="main-title">
            <h1>Post & Board</h1>
            <p>게시글 데이터를 조회합니다.</p>
        </div>

        <!-- 게시글 목록 -->
        <table class="board">

            <thead>
                <tr>
                    <td class="num">번호</td>
                    <td class="writer">작성자</td>
                    <td class="title">제목</td>
                    <td class="date">등록일자</td>
                    <td class="view">조회수</td>
                </tr>
            </thead>

            <tbody>
<%--              <c:forEach items="${list}" var="dto"> --%>
                <tr>
                    <td class="num">5</td>
                    <td class="title">
                        <a href="read.html">게시글 제목 05</a>
                    </td>
                    <td class="writer">홍길동</td>
                    <td class="date">2023.03.10</td>
                    <td class="view">55</td>
                </tr>
                <tr>
                    <td class="num">4</td>
                    <td class="title">
                        <a href="read.html">게시글 제목 04</a>
                    </td>
                    <td class="writer">브래드</td>
                    <td class="date">2023.03.10</td>
                    <td class="view">55</td>
                </tr>
                <tr>
                    <td class="num">3</td>
                    <td class="title">
                        <a href="read.html">게시글 제목 03</a>
                    </td>
                    <td class="writer">야옹이</td>
                    <td class="date">2023.03.10</td>
                    <td class="view">55</td>
                </tr>
                <tr>
                    <td class="num">2</td>
                    <td class="title">
                        <a href="read.html">게시글 제목 02</a>
                    </td>
                    <td class="writer">이민호</td>
                    <td class="date">2023.03.10</td>
                    <td class="view">55</td>
                </tr>
                <tr>
                    <td class="num">1</td>
                    <td class="title">
                        <a href="read.html">게시글 제목 01</a>
                    </td>
                    <td class="writer">Reba</td>
                    <td class="date">2023.03.10</td>
                    <td class="view">55</td>
                </tr>
            </tbody>

        </table>

        <div class="pagination">
            <a href="#" class="arrow">&#8810;</a>
            <a href="#" class="arrow">&#12298;</a>
            <a href="#" class="num">1</a>
            <a href="#" class="num">2</a>
            <a href="#" class="num">3</a>
            <a href="#" class="num">4</a>
            <a href="#" class="num">5</a>
            <a href="#" class="arrow">&#12299;</a>
            <a href="#" class="arrow">&#8811;</a>
        </div>

        <div class="btn-box">
            <a href="insert.html" class="btn primary">글쓰기</a>
        </div>
        
    </div>

</body>
</html>