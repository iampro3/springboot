<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.title, .todo {
		display: inline-block;
		border: 1px solid black;
		width: 150px;
		height: 50px;
		vertical-align: top;
	}
</style>
</head>
<body>
	<header>
		<h1>할일 목록</h1>
	</header>

	<section>
		<a href="/add.do">+등록</a>
		<div>
			<div class="title">할일id</div>
			<div class="title">완료</div>
			<div class="title">할일</div>
			<div class="title">마감예정일</div>
			<div class="title">실제마감일</div>
			<div class="title">회원이름</div>
			<div class="title">삭제</div>
		</div>

		<c:forEach var="item" items="${list}">
		<div class="row">
			<div class="todo">${item.todo_id }</div>
			<div class="todo">
				<input 
					type="checkbox" 
					class="chk" 
					value="${item.todo_id }"
					<c:if test="${not empty item.done_date  }">
						checked="checked"
					</c:if>
					>
			</div>
			<div class="todo">
				<a href="/update.do?todo_id=${item.todo_id }">
					${item.todo }
				</a>
			</div>
			<div class="todo">${item.due_date }</div>
			<div class="todo">${item.done_date }</div>
			<div class="todo">${item.name }</div>
			<div class="todo">
				<a href="/delete?todo_id=${item.todo_id }">
					<input type="button" value="삭제">
				</a>
			</div>
		</div>
		</c:forEach>
		
<%-- 		total :${total } --%>
		<%
// 			int total2 = (int)request.getAttribute("total");
// 			out.print("out.println:" +total2+"<br>");
			int total = (int)request.getAttribute("total");
			int countPerPage = (int)request.getAttribute("countPerPage");
			
			double lastPage = Math.ceil((double )total/ (double)countPerPage);
			
			/* 페이징 그룹 */
			int groupCount =3;
			// 현재 페이지
			int pageNum = (int) request.setAttribute("pageNum");
			// 현재속한 그룹. 
			double group = Math.floor((((double)pageNum-1) /groupCount) +1);
			//그룹의 시작 페이지, 끝페이지
			int end = (int)group * groupCount; 
			int begin = end - (groupCount -1);			
			
			// 마지막 페이지가 lastPage보다 크면 마지막 페이지로 잡는다.
			if(end > lastPage){
				end = (int)lastPage;
			}
			
			// scope 
			pageContext.setAttribute("a",1);
			// dom 에 올린다.
			session.setAttribute("test",3);
			application.setAttribute("test2", 4); // tomcat에 올린다.
		%> 
		
		<!-- 확인하기 -->
 		lastPage  : <%=lastPage  %><br>	<!-- java 표현이다. --> 
		
<%-- 		<c:set var="total3" value="<%=total2 %>" scope="page"/> --%>
<%-- 		total3 :${total3 }<br> <!-- el태그로 바꿀 수 있게 메모리에 올릴 수 있도록 한다. --> --%>
<%-- 		total2 :${total2 }<br>	<!-- 출력 안 됨 --> --%>
<%-- 		pageNum :${pageNum }  --%>


		<!-- c:foreach or java로 for 문 활용 -->
		<div style ="width:200px; margin:0 auto"> 
		<%
			if(begin!=1){				
			%>
				<a href="/list.do?pageNum=<%= begin-1 %> ">[이전]</a>
			<%				
			}
			%>
		<%
			for (int i=begin; i<end; i++){
		%>
			<a href="/list.do?pageNum=<%= i %> ">
				<c:set var="i2" value="<%=i %>" scope="page"/> <!-- scope : 변수가 저장되는 영역 설정(page | request | session | application 생략가능 생략시 기본값은 page) -->
				<c:if test="${pageNum eq i2} ">
						<strong><%=i %></strong>
				</c:if>
				<c:if test="${pageNum ne i2 } ">
						<%=i %>
				</c:if>
			</a>
			<%
			}
			%>
			<%
			if(end!=lastPage){
			%>
			<a href="/list.do?pageNum=<%= end+1 %> ">[다음]</a>
			<%
			}
			%>
			
			
			</div>
	</section>

<script>
	let list_chk = document.querySelectorAll(".chk")
	for(let i=0; i<list_chk.length; i++){
		list_chk[i].addEventListener("click", function(event){
			// event.target : 실제 클릭된 요소
			console.log("event.target", event.target)
			// event.currentTarget : 이벤트가 바인딩된 요소
			console.log("event.currentTarget", event.currentTarget)
			
			let target = event.target;
			
			console.log("target.value :", target.value)
			console.log("속성 value :", target.getAttribute("value"))
			
			console.log("체크 여부 :", target.checked)
			
			let todo_id = target.value;
			let checked = target.checked;
			
			// ajax 객체 생성
            const xhr = new XMLHttpRequest();
            
            // 보낼 준비
            let url = "/api/update";
            xhr.open("PUT", url); // 업데이트라서 PUT이 어울림
            xhr.setRequestHeader("Content-Type", "application/json");
            
            let param = {
           		todo_id: todo_id,
           		checked: checked
            }
            console.log("param", param)
            
            // serialized -> "application/json" 94 줄, 위에 처럼 넣어야 한다.
            xhr.send(JSON.stringify(param));
            
            // 다녀오는게 끝났을때(응답 이후)
            xhr.onload = function(){
                console.log(xhr.responseText);
                
                if( Number(xhr.responseText) != 0){
                	location.href = "/list.do"
                } else {
                	alert("업데이트 실패")
                }
            }
			
			
		})
	}
</script>
</body>
</html>