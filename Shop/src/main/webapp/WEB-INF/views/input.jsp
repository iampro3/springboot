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
<a href="http://localhost:8081/send1?id=admin2">anchor�±� �̿�</a>
<br>
<form action = "http://localhost:8081/send1">
	
	id :<input type="text" name="id">
	
	<div id="wrap"  style="border: 5px solid red">
	<input type="submit" value="����">
	</div>	
</form>

<div id="popup">
�����Դϴ�
</div>
<script>
	let submit=document.querySelector("#wrap")
	submit.addEventListener("click", function(event){
		console.log("wrap Ŭ��")
	})

	let submit=document.querySelector("[type=submit]")
	submit.addEventListener("click", function(event){
		event.preventDefault(); // ���� dom�� �����ؾ� �ϴ� �ൿ�� ���´�.
		
		event.stopPropagation(); // event���ĸ� ����
		document.querySelector("#popup").style.display="block";
		
		let frm =document.querySelector("form")
		
		let id=document.querySelector("input[name=id]").value
		console.log("id:",id)
		
			if(id.trim().length ==0){
				alert("id�� �Է��ϼ���")
			}else{
				frm.submit();
			}
		}
	})
</script>
</body>
</html>