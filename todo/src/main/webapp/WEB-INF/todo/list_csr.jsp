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

<script src="/assets/js/code.jquery.com_jquery-3.7.0.js"></script>
<script>
	
	// 페이지 로딩이 끝나면
	window.onload = function(){
		// 한 페이지에 하나밖에 못씀
		// 여러 페이지를 이 jsp에서 로딩하는 경우
		// 각각 onload가 지정되어 있다면
		// 마지막 onload만 적용됨
		// 변수에 덮어쓰기 방식이라서.
	}
// 	function a(){
		
// 	}
// 	window.addEventListener("load", a);
// 	window.removeEventListener("load", a);
// 	window.addEventListener("load", function(){
// 		init();
// 		bind();
// 	});

// 	$(document).ready(function(){
		
// 	})
// 	$(window).on("load", function(){
		
// 	})
	
	$(function(){
		init();
		bind();
	})
	
	function init(){
		// ajax로 컨트롤러에 요청
		// 받은 내용(json)을
		// html에 표시
		
        // ajax 실행
        let option = {
            "url" : "/api/todo",
            "type": "get",
            
            "success" : function(data){
            	// JSON.parse("{a:1}")
            	// JSON.stringify(data) // '{"a":"1"}'
                console.log("data", data);
                console.log("data.countPerPage", data.countPerPage);
                console.log("data['total']", data['total']);
                
                // 이런것도 있다; string을 넣으면 실행해줌
//                 eval("console.log(1)")

				// 리스트 표시

				// 템플릿 리터럴;백틱(`) 사용법
				// jsp 그냥은 el로 인식해서 사용 불가
				console.log(`data.countPerPage : \${data.countPerPage}`)

				for(let i=0; i<data.list.length; i++){
					let item = data.list[i];
					
					let html = "";
					html += '<div class="row">';
					html += '	<div class="todo">'+ item.todo_id +'</div>';
					html += '	<div class="todo">';
					html += '		<input ';
					html += '			type="checkbox"'; 
					html += '			class="chk" ';
					html += '			value="'+ item.todo_id +'"';
					
				console.log(item.done_date != null)
				if(item.done_date != null){
					html += '			checked="checked"';
				}
					html += '			>';
					html += '	</div>';
					html += '	<div class="todo">';
					html += '		<a href="/update.do?todo_id='+ item.todo_id +'">';
					html += '			'+ item.todo_id +'';
					html += '		</a>';
					html += '	</div>';
					html += '	<div class="todo">'+ item.due_date +'</div>';
					html += '	<div class="todo">'+ item.done_date +'</div>';
					
					let done_date = item.done_date ;
					if(done_date ==null){  //0 이 false
						if(!done_date){
						done_date = "";
						}  
					}
					
					html += '	<div class="todo">'+ item.name +'</div>';
					html += '	<div class="todo">';
					html += '		<a href="/delete?todo_id='+ item.todo_id +'">';
					html += '			<input type="button" value="삭제">';
					html += '		</a>';
					html += '	</div>';
					html += '</div>';
					
					$("#content").append(html)
				}
				
            },
            "error" : function(data){
                console.error("ERROR", data)
            }
        }
        $.ajax(option);
		
	}
	function bind(){
		
	}
	
</script>
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
		<div id="content"></div>
	</section>
</body>
</html>