<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>출력</h1>
\${ 100 } : % {100 }
\${"안녕" }<br>
<%-- \${"안녕"+"하세요" } : ${"안녕"+"하세요" } }<br> --%>
\${ "10"+1 } : ${"10"+1 }<br>
\${10/10 }	: ${10/10 }<br>
\${10 div 10 }	: ${10 div 10 }<br>
\${10%7 } : ${10%7 }<br>
\${10 mod 7 } : ${10 mod 7 }<br>
<hr>

<h1>가치판단</h1>
\${10 == 5 } : ${10 == 5 }<br>
\${10 ep 5 } : ${10 eq 5 }<br>
\${"한" == "한" } : ${"한" == "한" }<br>
<br>
\${10 != 5 } : ${10 != 5 }<br>
\${10 ne 5 } : ${10 ne 5 }<br>
<br>
\${10 > 5 } : ${10 > 5 }<br>
\${10 gt 5 } : ${10 gt 5 }<br>
<br>
\${10 < 5 } : ${10 ne 5 }<br>
\${10 lt 5 } : ${10 lt 5 }<br>
<br>
\${10 >= 5 } : ${10 >= 5 }<br>
\${10 ge 5 } : ${10 ge 5 }<br>
<br>
\${10 <= 5 } : ${10 <= 5 }<br>
\${10 le 5 } : ${10 le 5 }<br>
<hr>
and<br>
\${ (10 <= 5) || (1==1) } : ${ (10 <= 5) || (1==1) }<br>
\${ (10 <= 5) or (1==1) } : ${ (10 <= 5) or (1==1) }<br>
<br>
not<br>
\${ !(10 <= 5) } : ${ !(10 <= 5) }<br>
\${ not(10 <= 5) } : ${ not(10 <= 5) }<br>
<hr>
<h1>empty</h1>
\${ empty "안녕"} : ${ empty "안녕" }<br>
\${  not empty "안녕"} : ${ not empty "안녕" }<br>
\${ empty null} : ${ empty null }<br>
<hr>
\${ null } : 앞${ null }뒤<br>


</body>
</html>