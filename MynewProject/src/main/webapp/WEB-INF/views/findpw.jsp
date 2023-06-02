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

	<div id="wrap" style="border: 1px solid red">
		<input type="submit" value="전송">
	</div>
</form>


<div id="popup">
	공지입니다
</div>

<!-- input원본 시작 -->
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

<!-- findpw script 시작 -->

    <script>
         function fnClick(){
            let matchid = "${matchid}"  // if의 값을 선언해 주어야 한다.
         if (matchid){            
            alert("Password를 변경했습니다.")
            location.href = "index.jsp"
         } else {
            alert("id와 pw를 입력해주세요.")
            location.href = "http://naver.com"
        } 
    }
    </script>
    
    
<!-- findpw 시작 -->

    <!-- <div class="common-title">Login</div> -->
    <div class="login-container">
        <!-- 입력 영역 -->
        <form action="/fidpw.do" method="post">	
            <!-- 로그인 박스 -->
            <div class="login-wrap">
                <div class="login-text">Password 찾기</div><br>
                <br>
                <br>
                <!-- 중첩 박스 (inner)-->
                <div id="login">
                                               
                    <!-- 아이디-->
                    <div class="login-inputbox">
                        <input type="text" name="id" placeholder="아이디를 입력하세요">
                        <span class="border"></span>
                    </div>
                    
                    
                    <!-- 이메일로 pw 전송-->
                    <div class="login-inputbox">
                    <input type="password" name="pw" placeholder="이메일을 입력하세요.">
                    <span class="border"></span>
                    </div>
					
					<div class="login-btnbox"><a href="#" class="login-btn" onclick="fnClick()">이메일로 비밀전호 전송</a></div>
					<br>
					<br>
					<br>
					
					
                    <!-- 비밀번호 변경 신규입력 -->
                    <div class="login-inputbox">
                    	<div class="login-text">Password 변경하기</div><br>
                        <input type="password" name="pw" placeholder="새로운 비밀번호를 입력하세요.">
                        <span class="border"></span>
                    </div>         
                    <div class="login-remember">         
                  
                <!--   비밀번호 확인 
                    <div class="login-inputbox">
                        <input type="password" name="pw" placeholder="새로운 비밀번호를 다시 입력하세요.">
                        <span class="border"></span>
                    </div> -->
                        
                                              
                     <!-- <div id="btn2"> - ajax로 sign up 파일 불러오기  -->      
                    <!--버튼(idpw 변경완료)-->     
                     
                    <br>
                    <br>
                    <div class="login-btnbox"><a href="#" class="login-btn" onclick="fnClick()">비밀번호 변경완료</a></div>
                     
                    </div>                                         
              </div>      
            </div>   
        </form>    
    </div> 
</body>
</html>