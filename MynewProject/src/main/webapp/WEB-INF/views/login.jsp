<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign up</title>
    
    <link rel="stylesheet" href="/style.css">
    <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
    
</head>
<body>
<%-- <c:if test="${msg != null}">
	<h1>${msg }</h1>
</c:if>

<form action="/login_check" method="post">
	id : <input type ="text" name="id"><br>
	password : <input type ="text"  name="pw"><br>
	<input type ="submit" value="로그인">
</form> --%>

<script>
  function fnClick(){
          let matchid = "${matchid}"  // if의 값을 선언해 주어야 한다.
       if (matchid){            
          alert("회원가입을 환영합니다!")
          location.href = "mypage.jsp"
/*           location.href = "index.html" */
       } else {
          alert("id와 pw를 입력해주세요.")
          location.href = "#"
      } 
  }
  </script>
	
	<!-- select 입력 창 -->
  <script>
	  function func(year) {
	    document.sign.selectYear.value  = year;
	    // 파라미터로 전달받은 셀렉트박스 속성값을 
	    // 텍스트 박스 속성값에 전달함
	  }
	
	  function func1(month) {
	    document.sign.selectMonth.value  = month;
	  }
	
	  function func2(day) {
	    document.sign.selectDay.value  = day;
	  }
  </script>
<body>
    <section class="login" id="login">   
            
                   <!-- <div class="common-title">Login</div> -->
            <div class="login-container">
                <!-- 입력 영역 -->
                <form action="/login_check" method="post">
                    <!-- 로그인 박스 -->
                    <div class="login-wrap">
                        <div class="login-text">Login</div><br>
                        <br>
                        <br>
                        <br>
                        <!-- 중첩 박스 (inner)-->
                        <div id="login">
                                                       
                            <!-- 아이디-->
                            <div class="login-inputbox">
                                <input type="text" name="id" placeholder="아이디">
                                <span class="border"></span>
                            </div>
                            <!-- 비밀번호-->
                            <div class="login-inputbox">
                            <input type="password" name="pw" placeholder="비밀번호">
                            <span class="border"></span>
                            </div>
                            <!--아이디 저장/자동로그인-->
                            <div class="login-remember">
                                <label for="remember-id">
                                    <input type="checkbox" name="remember-id" id="remember-id">
                                    <span class="checkmark"> </span>
                                    <span>아이디 저장</span>                       
                                 </label>
                            <label for="remember-me">
                                 <input type="checkbox" name="remember-me" id="remember-me">                    
                                <span class="checkmark"> </span>    <!-- 체크모양을 만듦 -->
                                <span>자동 로그인</span>
                            </label><br>                           
                        </div>                                     
                           <!--버튼(로그인/회원가입)-->
                            <div class="login-btnbox"><a href="#" class="login-btn" onclick="fnClick()">
                            	<input type="submit" id="btn" value="로 그 인" style="font-size: 12pt; color:rgb(255,255,255)">
                            </a></div>
                            <!-- <div id="btn2"> - ajax로 sign up 파일 불러오기  -->
                            <div class="login-btnbox" id="btn2"><a href="#login" class="login-btn">회원가입</a></div>   
                            <br>
                                                      
                            <!-- ID/PW 찾기 -->
                            <br>                           
                                <div id="btn1" style="width: 300px; text-align: center; float :left;" ><a href=#login class="login-btn"><span>ID 찾기</span> </a>                                                
                                <div id="btn7" style=" text-align: center; float :right;"><a href=#login class="login-btn"><span>PW 찾기</span></a>  
                                <span class="border"></span>                                            
                                </div>                        
                                	
                    </div>    
                </form>    
            </div>   
        </section>
        
        <script>        
        $("#btn2").off("click").on("click", function(){
            // ajax 실행
            let option = {                 
                "url" : "/login.jsp", // sts에서 경로를 변경했다. 
                "type": "get",
                "success" : function(data){
                    console.log(data);                       
                    /* let result = document.querySelector("#login");
                	result.innerHTML = data */
                	/* 새로운 jquery 구문 */
               	//$("#login").jsp(data);
               		$("#login").html(data);
                	
                },
                "error" : function(data){
                    console.log(data)
                },
                "complete" : function(data){
                    console.log("THE END")
                }
            }
            $.ajax(option);
            let option2 = {                
                "url" : "http://localhost:8081/",               
                "type": "get"
            }       
        })
            </script>
            
             <!-- login 창, id 찾기 find.html 불러오기-->
            <script>
            $("#btn1").off("click").on("click", function(){
                // ajax 실행
                let option = {
            
                    "url" : "/find.html",
                    "type": "get",
                    "success" : function(data){
                        console.log(data);                  
                        let result = document.querySelector("#login");
                    result.innerHTML = data
                    },
                    "error" : function(data){
                        console.log(data)
                    },
                    "complete" : function(data){
                        console.log("THE END")
                    }
                }         
                $.ajax(option);
                let option2 = {                
                    "url" : "http://localhost:8081/",               
                    "type": "get"
                }                  
            })
        </script>
        
        <!-- login 창, pw 찾기 findpw.html 불러오기-->
         <script>
            $("#btn7").off("click").on("click", function(){
                // ajax 실행
                let option = {
            
                    "url" : "/findpw.jsp",
/*                     "url" : "/findpw.html", */
                    "type": "get",
                    "success" : function(data){
                        console.log(data);                  
                        let result = document.querySelector("#login");
                    result.innerHTML = data
                    },
                    "error" : function(data){
                        console.log(data)
                    },
                    "complete" : function(data){
                        console.log("THE END")
                    }
                }         
                $.ajax(option);
                let option2 = {                
                    "url" : "http://localhost:8081/",               
                    "type": "get"
                }                  
            })
        </script>
        
    </body>
    
</html>