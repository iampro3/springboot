<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

    <link rel="stylesheet" href="/style.css">
    <script src="https://code.jquery.com/jquery-3.6.4.js"></script>   

</head>
<body>

<!-- <form action="http://localhost:8081/send1" method="get"> -->

<!-- findpw script 시작 -->

<!--     <script>
      function fnClick(){
            let matchid = "${matchid}"  // if의 값을 선언해 주어야 한다.
         if (matchid){            
            alert("인증번호를 전송했습니다.")
            location.href = "index.jsp"
         } else {
            alert("id와 pw를 입력해주세요!!")
            location.href = "http://naver.com"
        } 
    }
         
         function fnClick1(){
             let matchid = "${matchid}"  // if의 값을 선언해 주어야 한다.
          if (matchid){            
             alert("인증번호가 확인되었습니다.")
             location.href = "index.jsp"
          }
         }
         
         function fnClick2(){
             let matchid = "${matchid}"  // if의 값을 선언해 주어야 한다.
          if (matchid){            
             alert("id가 이메일로 전송되었습니다.")
             location.href = "index.jsp"
          }
         }
    </script> -->
    
    
<!-- findpw 시작 -->
<!-- <form action="http://localhost:8081/send1" method="get"> -->
<div id="popup"></div>	
<div id="popup_pw"></div>

   <div class="login-container">
        <!-- 입력 영역 -->
         <form action="login" method="get">		
            <!-- 로그인 박스 -->
            <div class="login-wrap">
                <div class="login-text">ID 찾기</div><br>
                <br>
                <br>
                <!-- 중첩 박스 (inner)-->
                <div id="login">
                        
                    <!-- 아이디 찾기 : 휴대폰 번호입력-->
                    <div class="login-inputbox">
                    <input type="password" name="pw" placeholder="휴대폰 번호를 입력하세요.">
                    <span class="border"></span>
                    </div>
					<div class="login-btnbox"><a href="index" class="login-btn">
					<input type="submit" value="휴대폰으로 인증번호 전송" style="font-size: 12pt; color:rgb(255,255,255)">
<!-- 					<input type="submit" form="form1" value="휴대폰으로 인증번호 전송" style="font-size: 12pt; color:rgb(255,255,255)"> -->
					</a></div>	
					<br>  
					
                    <!-- 비밀번호 확인 -->
                    <div class="login-inputbox">
                        <input type="password" name="pw" placeholder="휴대폰에 전송된 인증번호를 입력하세요.">
                        <span class="border"></span>
                    </div>
                    <div class="login-btnbox"><a href="#" class="login-btn" onclick="fnClick1()">휴대폰 인증번호 확인</a></div>	
                  
                    <div class="login-remember">    
                                                                                                              
                    <br> 
                    <br>                                                    
                    <!-- 아이디 찾기 : 이멜 전송-->
                    <div class="login-inputbox">
                        <input type="text" name="id" placeholder="이메일을 입력하세요">
                    </div>
                                
                     <!-- <div id="btn2"> - ajax로 sign up 파일 불러오기  -->      
                    <!--버튼(idpw 변경완료)-->
                    <div class="login-btnbox" id="wrap1"><a href="#" class="login-btn">
                    <input type="submit" value="이메일로 전송합니다" style="font-size: 12pt; color:rgb(255,255,255)">
<!--                     <input type="submit" form="form2" value="이메일로 전송합니다" style="font-size: 12pt; color:rgb(255,255,255)"> -->
                    </a></div>
                     
                    </div>                                         
              </div>      
            </div>   
        </form>    
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
		
		let pw = document.querySelector("input[name=pw]").value
		console.log("pw : ", pw)
		
		if(pw.trim().length == 0){
			setTimeout(function(){
				alert("pw를 입력하세요")
			}, 50)
		} else {
			frm.submit("email로 전송했습니다.");
		}
	})
	
	
	/* pw 입력하기 script */
/* 	 let wrap1 = document.querySelector("#wrap1")
	wrap.addEventListener("click", function(event){
// 		event.stopPropagation();
		
		console.log("wrap1 클릭")
	})
	
	let submit = document.querySelector("[type=submit]")
	submit.addEventListener("click", function(event){
		// 원래 dom이 동작해야하는 행동을 막아준다
		event.preventDefault();
		
		// 이벤트 전파를 막아준다
		event.stopPropagation();

		console.log(document.querySelector("#popup_pw").style.display)
		
		setTimeout(function(){
			document.querySelector("#popup_pw").style.display = "block";
		}, 0)

		
		let frm2 = document.querySelector("form2")
		
		let pw = document.querySelector("input[name=pw]").value
		console.log("pw : ", pw)
		
		if(pw.trim().length == 0){
			setTimeout(function(){
				alert("pw를 입력하세요")
			}, 50)
		} else {
			frm2.submit();
		}
	})  */
</script>
</body>
</html>