<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

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
            alert("Password를 변경했습니다.")
            location.href = "index.jsp"
         } else {
            alert("id와 pw를 입력해주세요.")
            location.href = "/findpw"
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
                <div class="login-text">Password 찾기</div><br>
                <br>
                <br>
                <!-- 중첩 박스 (inner)-->
                <div id="login">
                                               
              <!--       아이디
                    <div class="login-inputbox" id="wrap">
                        <input type="text" name="id" placeholder="아이디를 입력하세요">
                        <span class="border"></span>
                    </div>
                     -->
                    <!-- <form id="form1"  action="login" method="get">	 -->
                    <!-- 이메일로 pw 전송-->
                    <div class="login-inputbox">
                    <input type="email" name="email" placeholder="이메일을 입력하세요.">                   
                    </div>
					
					<div class="login-btnbox" id="wrap"><a href="#" class="login-btn">
					<input type="submit" value="이메일로 비밀전호 전송" style="font-size: 12pt; color:rgb(255,255,255)">
<!-- 					<input type="submit" form="form1" value="이메일로 비밀전호 전송" style="font-size: 12pt; color:rgb(255,255,255)"> -->
					</a></div>
					<!-- </form>     -->
					<br>
					<br>
					<br>
					
                    <!-- 비밀번호 변경 신규입력 -->
                  <!--   <form id="form2" action="login" method="get"> -->	<br>
                    <div class="login-inputbox" >
                    	<div class="login-text">Password 변경하기</div><br><br>
                        <input type="password" name="pw" placeholder="새로운 비밀번호를 입력하세요.">                       
                            
                  	<br><br>
                <!--   비밀번호 확인 -->                   
                        <input type="password" name="pw" placeholder="새로운 비밀번호를 다시 입력하세요.">
                        <span class="border"></span>
                    </div>                         
       
                    <!--버튼(idpw 변경완료)-->
                    <br><br><br><br><br><br>
                    <div class="login-btnbox" id="wrap1"><a href="#" class="login-btn">
					<input type="submit" form="form2" value="비밀번호 변경완료" style="font-size: 12pt; color:rgb(255,255,255)"></a></div>
				<!-- 	</form>      -->                 
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
		
		let email = document.querySelector("input[name=email]").value
		console.log("email : ", email)
		
		if(email.trim().length == 0){
			setTimeout(function(){
				alert("email을 입력하세요")
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