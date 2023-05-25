<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>form</title>
<style>
#popup{
	display:none;
	width:500px;
	height:500px;
	position:absolute;
	top:250px;
	left:0;
}
</style>
</head>
<body>
<a href="http://localhost:8081/send1?id=admin2">anchor태그 이용</a>
<br>
<form action = "http://localhost:8081/send1">
	
	id :<input type="text" name="id">
	
	<div id="wrap"  style="border: 5px solid red">
	<input type="submit" value="전송">
	</div>	
</form>

<div id="popup">
공지입니다
</div>
<script>
	let submit=document.querySelector("#wrap")
	submit.addEventListener("click", function(event){
		console.log("wrap 클릭")
	})

	let submit=document.querySelector("[type=submit]")
	submit.addEventListener("click", function(event){
		event.preventDefault(); // 원래 dom이 동작해야 하는 행동을 막는다.
		
		event.stopPropagation(); // event전파를 막음
		document.querySelector("#popup").style.display="block";
		
		let frm =document.querySelector("form")
		
		let id=document.querySelector("input[name=id]").value
		console.log("id:",id)
		
			if(id.trim().length ==0){
				alert("id를 입령하세요")
			}else{
				frm.submit();
			}
		}
	})
</script>
</body>
</html>