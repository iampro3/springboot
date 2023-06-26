<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up : 회원가입</title>
    
    <link rel="stylesheet" href="/style.css">
    <script src="https://code.jquery.com/jquery-3.6.4.js"></script>   

</head>
<body>

<!-- 회원가입폼 시작 -->
 <section class="sign" id="sign">   
            <div id="backGC">
            <!-- <div class="common-title">Login</div> -->
            <div class="sign-container">
                <!-- 입력 영역 -->
                <form action="http://localhost:8081/send1" name="sign" method="get">
                    <!-- 로그인 박스 -->
                    <div class="sign-wrap">
                        <div class="sign-text">Sign up : 회원가입</div><br>
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
                                <input type="phone" name="phone" placeholder="전화번호">
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
                            <div class="sign-btnbox"><a href="#" class="sign-btn" onclick="fnClick()">
                            <input type="submit" id="btn" value="회원가입" style="font-size: 12pt; color:rgb(255,255,255)">
                             </a>
                            </div>
                        </div> 
                      </div>  
                </form>    
             </div> 
        </section>
	</div>
<!-- 회원가입폼 끝 -->

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
	
	
	/* 회원가입 script 시작 */	
		<!-- select 입력 창 -->
  
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
	/* 회원가입 script 끝 */
	
</script>
</body>
</html>