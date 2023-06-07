<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>+ My page : 회원 가입 완료!</title>

    <link rel="stylesheet" href="/style.css">
    <script src="https://code.jquery.com/jquery-3.6.4.js"></script>   
    
</head>
<body>
 <section class="sign" id="sign">          
            <div class="sign-container">
                <!-- 입력 영역 -->
                
                    <!-- 로그인 박스 -->
                    <div class="sign-wrap">
                        <div class="sign-text">+ My page<br>
                        &nbsp&nbsp&nbsp&nbsp ${ req_id }님, 
                                               
                        <br>&nbsp&nbsp&nbsp&nbsp 회원가입을 환영합니다.
                        </div><br>
                        	 <div id="sign">                                                       
                            <!-- 아이디-->
                            <br>
                            <div class="sign-inputbox1">
                                <input type="text" name="id" placeholder="당신의 id는 ${ req_id }입니다.">
                                <input type="text" name="id" placeholder="당신의 pw는 ${ req_pw }입니다.">
                                <input type="text" name="id" placeholder="당신의 name은 ${ req_name }입니다.">
                                <input type="text" name="id" placeholder="당신의 phone은 ${ req_phone }입니다.">
                                <input type="text" name="id" placeholder="당신의 email은 ${ req_email }입니다.">
                                <input type="text" name="id" placeholder="당신의 gender는 ${ req_gender }성입니다.">
                                <br>                            								
									<%-- list_id : ${list_id } --%>									
							</div>
										 
                  	<br><br>
                    <form action="/login" name="sign" method="post">
       				<!--버튼(로그인)-->
		                  <div class="sign-btnbox"><a href="#" class="sign-btn" onclick="fnClick()">
		                  	<input type="submit" id="btn" value="로그인" style="font-size: 12pt; color:rgb(255,255,255)">
		                  </a></div>			
					</form>
					<br>
					</div>
			  </div>	
		</div>
</section>
</body>
</html>
