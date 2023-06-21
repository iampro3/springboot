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