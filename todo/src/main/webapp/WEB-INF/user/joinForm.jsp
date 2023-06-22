<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/assets/js/code.jquery.com_jquery-3.7.0.js"></script>

<script>
	$(()=>{
		$('#dub').off("click").on("click", ()=>{
			let id = $('input[name=id]').val()
			
			let param = {				
				id: id
				//nageNum:1
			}
// 			let param =param;
// 			if(method == "post"){
// 				data = 
// 			}
			// ajax 실행
		    let option = {
		        "url" : "/api/todo",
		        "type": "post",
		        "data": JSON.stringify(param),
		        "contentType" : "application/json",
		        	
		        "success" : function(data){
		        	console.log("data, data")
		        	if(data !=0){
		        		$("#msg").html("계정을 확인해주세요")
		        	}else {
		        		$("#msg").html("사용가능한 ID 입니다")	        		
		        		}		        	
		     	   },
		        "error" : function(data){
		            console.error("ERROR", data)		        
		 	   }	        
			}   
		    $.ajax(option);
		})			
	})
</script>
</head>

<body>

<h1>회원가입</h1>
<form action="/join" method="post">
	id: <input type="text" name="id"><input type = "button" id ="dub" value="중복검사"><br>
	<span id ="msg" style="color:red;">${message}</span><br>
	pw: <input type="password" name="pw"><br>
	name: <input type="text" name="name"><br>
	<input type="submit" value="회원가입">
</form>

</body>
</html>