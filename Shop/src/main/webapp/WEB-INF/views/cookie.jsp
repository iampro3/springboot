<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
cookie
<script>
	function setCookie(){
		// 읽기
		/* document.cookie */
		
		//쓰기
		//key=value; path=/user(user폴더에서 만 사용 가능); expires=GMT, UTC
		
		let now = new Date();
		let after_10s=now.getSeconds()+10
		now.setSeconds(after_10s)
		
		document.cookie= "popup7=true; path=/; expires=" +now.toGMTString(); 
		/*	popup 7 : 7일 동안 안 보이기*/
		document.cookie= "popup1=false; path=/; expires=" +now.toGMTString(); 
		
 		/* document.cookie= "login=true"  */
		console.log("cookie 설정 완료")
	}
	
	function getCookie(){
		let key = "popup1";
		let cookie = document.cookie;
		console.log(cookie)	//"popup7=true"
		// 방법 1
		let cookies = cookie.split("=") // =으로 자른 배열
		for(c of cookies){
			let kv = cookie.split("=") // =으로 자른 배열
			if(kv[0]==key){
				console.log("kv[0] : " + kv[0])
				console.log("kv[1] : " + kv[1])
				break
				}				
			}
			
			let temp_val = c.split(key+"=")
			if(temp_val.length ==1){
				console.log(" value =", temp_val[0].split(";")[0])
			}else{
				console.log(" value =", temp_val[1].split(";")[0])
				}
		
		}
	
	// 실행
	setCookie()
	
	getCookie()
	setTimeout(function(){
		getCookie()
	}, 11*1000)
	
</script>
</body>
</html>