<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view</title>
</head>
<body>
<%-- id:${dto.id }<br> --%>
writer:${dto.writer }<br>
title:${dto.title }<br>
content:<br>
<textarea>
${dto.content }
</textarea>
<br>
<a href="/list">목록</a>
<a href="/modifyForm?id=${dto.id }">수정</a>
</body>
</html>