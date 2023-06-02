<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>

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
          location.href = "index.jsp"
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
    <section class="sign" id="sign">   
            
            <!-- <div class="common-title">Login</div> -->
            <div class="sign-container">
                <!-- 입력 영역 -->
                <form action="/login_check" name="sign" method="post">
                    <!-- 로그인 박스 -->
                    <div class="sign-wrap">
                        <div class="sign-text">Sign up:회원가입</div><br>
                        <br>
                        <!-- 중첩 박스 (inner)-->
                        <div id="sign">
                                                       
                            <!-- 아이디-->
                            <div class="sign-inputbox">
                                <input type="text" name="id" placeholder="아이디">
                                <span class="border"></span>
                            </div>

                            <!-- 비밀번호-->
                            <div class="sign-inputbox">
                            <input type="password" name="pw" placeholder="비밀번호">
                            <span class="border"></span>
                            </div>

                              <!-- 이름-->
                              <div class="sign-inputbox">
                                <input type="name" name="name" placeholder="이름">
                                <span class="border"></span>
                                </div>

                                <!-- tel-->
                              <div class="sign-inputbox">
                                <input type="tel" name="phone" placeholder="전화번호">
                                <span class="border"></span>
                                </div>

                                  <!-- 이메일 -->
                              <div class="sign-inputbox">
                                <input type="email" name="email" placeholder="이메일">
                                <span class="border"></span>
                                </div>

                                <!-- 성별 -->
                              <div class="sign-inputbox">
                                <input type="gender" name="gender" placeholder="성별">
                                <span class="border"></span>
                                </div>                                 
                              
                                  <!-- 생년월일 -->
                              <div class="sign-inputbox">
                                <!-- <input type="year" name="year" placeholder="생년 / 월 / 일"> -->
                                <select name="year" onchange="func(this.value)">
                                  <option value="">출생년도</option>
                                  <option value="1970">1970</option>
                                  <option value="1980">1980</option>
                                  <option value="1981">1981</option>
                                  <option value="1982">1982</option>
                                  <option value="1983">1983</option>
                                  <option value="1984">1984</option>
                                  <option value="2023">2023</option>
                              </select>
                              	<input type="text" name="selectYear" style="width: 60px;">

                              <select name="month" onchange="func1(this.value)">
                                <option value="">월</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
								<input type="text" name="selectMonth" style="width: 30px;">
								
                            <select name="day" onchange="func2(this.value)">
                              <option value="">일</option>
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="31">31</option>
                          </select>
                          		<input type="text" name="selectDay" style="width: 30px;">
                                <span class="border"></span>
                                </div>
                            <!-- <input type="button" value="Login" onclick="fnClick()" width="100" height="200"><br> -->
                            
                            <!--버튼(회원가입)-->
                           
                            <div class="sign-btnbox"><button type ="submit" style="width:400px;"><a href="#" class="sign-btn" onclick="fnClick()">회원가입</a> </button> </div>
                           
                        </div> 
                      </div>  
                </form>    
             </div> 
        </section>
    </body>
</html>