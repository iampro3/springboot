<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.popup{
		border : 1px solid red;
		width : 300px;
		height : 300px;
		position : absolute;
		top : 50%;
		left : 50%;
		 background-color : rgb(0,163,89); */
		transform : translate(-50%, -50%);
		
	 }
	
</style>
</head>
<body>
index.jsppp


<div class="popup">
	공지 팝업<br>
	 <input type="checkbox" id="popup_1">1분동안 보이지 않기<br> 
	<input type="checkbox" id="popup_dark" >어두운 화면<br>
</div>

<script>

/* setCookie()와 getCookie는 그대로 가져다 사용해도 된다. */
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
	
	//단 maxAge의 단위는 초
	function setCustomCookie(key, value, maxAge){
		let now = new Date();
		let after=now.getSeconds()+maxAge
		now.setSeconds(after)
		
/* 		document.cookie= "popup7=true; path=/; expires=" +now.toGMTString();  */
		document.cookie= key + "=" + value + "; path=/; expires=" +now.toGMTString(); 		
	}
	
	function getCookie(key){
		let value = null;
		//let key = "popup7";  // 전달인자로 넣는다.
		let cookie = document.cookie;
		console.log(cookie)	//"popup7=true"
		// "popup7=true"; "popup5=true"; "popup7=true"; "popup6=false";
		// 방법 1
		let cookies = cookie.split("; ") // =으로 자른 배열
		for(c of cookies){
			let kv = cookie.split("=") // =으로 자른 배열
			if(kv[0]==key){
				console.log("kv[0] : " + kv[0])
				console.log("kv[1] : " + kv[1])
				value = kv[1];
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
	
 	let popup_1 = document.querySelector("#popup_1")
	popup_1.addEventListener("click", function(event){
		// click된 요소(혹은 이벤트가 발생한 요소)요소
		// 그 요소의 체크 여부
		console.log(event.target.checked);
		
		if(event.target.checked){ //  == true 를 써도 되고 안 써도 된다. 반드시 "=="으로 표기하기
			setCustomCookie('popup_1', true, -1); // 60초
 			//setCustomCookie('popup_1', true, 60*1); // 60초 
			document.querySelector(".popup").style.display= "none";	// popup의 check박스에 체크 하는 순간 popup 사라진다.
		}
	}) 
	
	
	// popup_dark	
	let popup_dark = document.querySelector("#popup_dark")
	popup_dark.addEventListener("click", function(event){
		// click된 요소(혹은 이벤트가 발생한 요소)요소
		// 그 요소의 체크 여부
		console.log(event.target.checked);
		
		if(event.target.checked){ //  == true 를 써도 되고 안 써도 된다. 반드시 "=="으로 표기하기
			setCustomCookie('popup_dark', true, 10); // 60초/
			document.querySelector(".popup").style.backgroundColor= "rgb(212, 185, 227)";	// popup의 check박스에 체크 하는 순간 popup 배경색이 바뀐다.
		}
	})
	
	function showPopup(){
		let value = getCookie("popup_1")
		console.log("value : ", value, typeof(value), ( value == true )) // if문이 들어갔는지 출력해본다.
		if(value == 'true'){
			document.querySelector(".popup").style.display= "none";
		} else{
			document.querySelector(".popup").style.display= "block";
		}
	}
	showPopup(); 
	//popup check 하는 방법 1. getcookie를 가져온다.
	
	function darkPopup(){
		let value= getCookie("popup_dark")
		console.log("value : ", value, typeof(value), (value == true) )
		if(value == 'true'){
			document.querySelector(".popup").style.backgroundColor = "rgb(212, 185, 227)";
		}else {
			document.querySelector(".popup").style.display = "block";
		}
	}
	darkPopup();
	
</script>
</body>
</html>