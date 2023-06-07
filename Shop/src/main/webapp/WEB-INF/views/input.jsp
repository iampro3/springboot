<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#popup {
		display: none;
	
		width: 500px;
		height: 500px;
		position: absolute;
		top: 50px;
		left: 100px;
		border: 1px solid red;
	}
</style>
</head>
<body>
<a href="http://localhost:8081/send1?id=admin2">anchor 태그를 이용</a>
<br>
<form action="http://localhost:8081/send1" method="get">

	id : <input type="text" name="id"><br>
	pw : <input type="text" name="pw"><br>

	<div id="wrap" style="border: 1px solid red">
		<input type="submit" value="전송">
	</div>
</form>


<div id="popup">
	공지입니다
</div>


<script>
	let wrap = document.querySelector("#wrap")
	wrap.addEventListener("click", function(event){
// 		event.stopPropagation();
		
		console.log("wrap 클릭")
	})
	
	let submit = document.querySelector("[type=submit]")
	submit.addEventListener("click", function(event){
		// 원래 dom이 동작해야하는 행동을 막아준다
		event.preventDefault();
		
		// 이벤트 전파를 막아준다
		event.stopPropagation();

		console.log(document.querySelector("#popup").style.display)
		
		setTimeout(function(){
			document.querySelector("#popup").style.display = "block";
		}, 0)

		
		let frm = document.querySelector("form")
		
		let id = document.querySelector("input[name=id]").value
		console.log("id : ", id)
		
		if(id.trim().length == 0){
			setTimeout(function(){
				alert("id를 입력하세요")
			}, 50)
		} else {
			frm.submit();
		}
	})
</script>
</body>
</html>