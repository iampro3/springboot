<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="EUC-KR"> -->
<!-- <title>Makedata</title> -->
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Makedata</title>

        <!-- FontAwesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
   
        <!-- slick 이미지 슬라이드 : 라이브러리 사용 slick.css 파일 -->
        <!-- slick css CDN -->
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">        
        <link rel="stylesheet" href="/style.css"> 
       <%--  <link href="<c:url value="/resources/static/style.css"/>" rel='stylesheet' />   --%>    
    
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db50938a3b4ef4e31b81ef7b279e5313"></script>
        
        <!-- slick js 이미지 슬라이드 -->
        <script src="/slick.min.js"></script>
    
        <script src="/script.js"></script>        
        
        <!-- cookie style 설정함 -->
        <style>
			.popup{
				/* border : 1px solid red; */
				width : 300px;
				height : 300px;
				position : absolute;
				top : 60%;
				left : 65%;
			/* 	background-color : rgb(82,52,186);  */
		/* 		   background: 
			    radial-gradient(circle at 50% 0, rgba(255,0,0, 0.5), rgba(255,0,0,0) 70%),
			    radial-gradient(circle at 7% 75%, rgba(0,0,255, 0.5), rgba(255,0,0,0) 70%),
			    radial-gradient(circle at 93% 75%, rgba(0,255,0, 0.5), rgba(255,0,0,0) 70%); */
			    
			    background: linear-gradient(90deg, #9ebd13 0%, #26b3f7 50%, #5726f7 100%);
				color : rgb(255,255,255); 
				transform : translate(-50%, -50%);	
				padding : 30px;
				z-index : 999;	
			 }	
		</style>    
    </head>

    <!-- login 버튼 누르면 이동 -->
    <script>
        function fnClick(){
                let matchid = "${matchid}"  // if의 값을 선언해 주어야 한다.
             if (matchid){            
                alert("환영합니다!")
                location.href = "index.jsp"
/*                 location.href = "index.html" */
             } else {
                alert("id와 pw를 입력해주세요.")
                location.href = "http://naver.com"
            } 
        }
        </script>
        
         <script>
         <!-- cookie popup scripts 시작 -->

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
         			setCustomCookie('popup_1', true, -1); // 60초 -1
          			//setCustomCookie('popup_1', true, 60*1); // 60초 
         			document.querySelector(".popup").style.display= "none";	// popup의 check박스에 체크 하는 순간 popup 사라진다.
         		}
         	})          	
         	
              	
         	function showPopup(){
         		let value = getCookie("popup_1")
         		console.log("value : ", value, typeof(value), ( value == true )) // if문이 들어갔는지 출력해본다.
         		if(value == 'true'){
         			document.querySelector(".popup").style.display = "none";
         		} else{
         			document.querySelector(".popup").style.display= "block";
         		}
         	}
         	showPopup(); 
         	//popup check 하는 방법 1. getcookie를 가져온다.
         	
     
</script>
<!-- cookie popup scripts 끝 -->

<body>
	<!-- cookie popup 시작-->
	<div class="popup">
	<h2>공지 사항</h2><br>
	 
	<h3>Login 되었습니다. <br> <br> MakeData 를 방문하신 것을 환영합니다.</h3><br>
	<br>  <br>  <br>   
	창 닫기&nbsp<input type="checkbox" id="popup_1" ><br>  
	</div>
		<!-- cookie 끝 -->	
	  <!-- 좌측 상단 메뉴 열기 -->
        <span id="btn-menu" class="btn-menu">
            <i class="fa fa-bars"></i>
        </span>
    
        <!-- ########## header ########## -->       
        <header>
            <!-- 메뉴 닫기 버튼 -->
            <span id="btn-close" class="btn-menu">
                <i class="fa fa-times"></i>
            </span>
    
            <a href="#" class="logo">
                <span>Makedata</span>                
                <br>
                <br>
                <div class="main-logo"><img src="img/logo-01.png" alt="make"></div>               
           </a>
           
        <!-- 좌측 Navigation 메뉴 -->
        <nav class="navbar">
            <a href="#Find">도서관 정보</a>                   
            <a href="#chatbot">Chatbot</a>
            <a href="#AIProject">Image make</a>                    
            <a href="https://iampro3-iris-streamlit-app-0331-w3thn9.streamlit.app/" target="_blank">Bidgata Analysis Portpolio</a>
        </nav>
            <br>
            <br>
            <div class="navbar_log">
            <a href="/">Logout</a>	<!-- index.jsp로 이동함 -->
           
            <form action="http://localhost:8081/send1" name="sign" method="get">
            <a href = "#" >
            ${id }님 환영합니다!</a>             
             </div>
             </form>
            <br>
        <!-- sns 버튼 -->
            <div class="sns">        
            <a href="https://twitter.com/i/flow/login" class="fab fa-twitter"></a>
            <a href="https://www.instagram.com/" class="fab fa-instagram"></a>
            <a href="#Map">M</a>            
            <span id="btn5"><a href="#field" >Post</a></span>            
        </div>            
    </header>

    <!-- ########## section 1 ########## -->
    <section class="Find" id="Find">             
            
        <!-- 도서관 강좌/소장 정보 -->
            <!-- index.html 가져오기 -->
            <!-- 전체 영역 -->
        <div class="container">
            <!-- 입력 영역 -->
            <form action="" method="post">
                <!-- 입력 박스 -->
                <div class="title-wrap">
                    <!-- 중첩 박스 (inner)-->
                    <div id="title">
                        <div class="title-text">도서관 정보 검색</div>             
                        <br>
                        <!-- 강좌정보 -->
                        <div class="title-inputbox">
                            <p>서울시 도서관의 문화강좌 정보를 검색합니다</p><br>
                               
                                <!-- libstudy.html 불러오기 -->
                                <div class="title-btnbox" id="btn6"><a href="#Find" class="title-btn">문화강좌 정보 조회하기</a></div>                                                                  
                        </div>
                        
                        <br>
                        <br>
                         <!-- 소장정보 -->
                        <div class="title-inputbox">
                            <p>서울시 도서관의 소장된 도서 정보를 검색합니다</p><br>
                                
                                <!-- booklist.html 불러오기 -->
                                <div class="title-btnbox" id="btn8"><a href="#Find" class="title-btn">소장도서 정보 조회하기</a></div>                                                                  
                        </div>
                    </div>
                </div>
            </form>
        </div>      
    </section>

        <!-- section 2 챗봇 -->
        <section class="chatbot" id="chatbot">   
            <div class="slide-container">  
                    
                <div class="slide">
                    <div class="text">Chatbot : Health Counsel</div><br>                   
                  <!--  <div class="slide-container.row"> -->
                    <ul>
                        <li>
                            <div id="btn4" >
                            <a href="#chatbot"> 
                                <figure>
                                    <img src="img/h1.jpg" alt="" style="width:350px;height:250px;">
                                    <figcaption>: For you, health Counsel</figcaption>
                                </figure>                        
                            </a>
                        </div>
                        </li>
                        <li>
                            <a href="#chatbot">
                                <figure>
                                    <img src="img/h2.jpg" alt="">
                                    <figcaption> : Health Care</figcaption>
                                </figure>
                            </a>
                        </li>
                        <li>
                            <a href="#chatbot" target="_self">
                                <figure>
                                    <img src="img/h3.jpg" alt="">                   
                                <figcaption>: Healthy food</figcaption>
                                </figure>
                            </a>
                        </li>
                        <li>
                            <a href="#chatbot" target="_self">
                                <figure>
                                    <img src="img/h4.jpg" alt="">                   
                                <figcaption>: Excercise</figcaption>
                                </figure>
                            </a>
                        </li>
                        <li>
                            <a href="#chatbot" target="_self">
                                <figure>
                                    <img src="img/h5.jpg" alt="">                   
                                <figcaption>: health info</figcaption>
                                </figure>
                            </a>
                        </li>
                        <li>
                            <a href="#chatbot" target="_self">
                                <figure>
                                    <img src="img/h6.jpg" alt="">                   
                                <figcaption>: Community</figcaption>
                                </figure>
                            </a>
                        </li>  
                    </ul>                    
                  <p>+ If you want to know about health, you ask anything!</p><br>          	
                    </div>                   
                </div>
           <!--  </div> -->
        </section>
		
        <!-- section 3 image make -->
        <section class="AIProject" id="AIProject">   
            <div class="slide-container">   
                   
                <div class="slide">
                    <div class="text">AI Project : Image make</div><br>
                    <ul>
                        <li>
                            <div id="btn3">
                                <a href="#AIProject">
                                <figure>
                                    <img src="img/a1.jpg" alt="" style="width:350px;height:250px;" >
<!--                                     <img src="img/a1.jpg" alt="" style="width:360px;height:260px;" > -->
                                    <figcaption>: Grafitti</figcaption>
                                </figure>                        
                           	    </a>
                       		</div>
                        </li>
                        <li>
                            <a href="#AIProject">
                                <figure>
                                    <img src="img/a2.jpg" alt="" >
                                    <figcaption> : Abstract painting</figcaption>
                                </figure>
                            </a>
                        </li>
                        <li>
                            <a href="#AIProject" target="_self">
                                <figure>
                                    <img src="img/a3.jpg" alt="" style="width:350px;height:250px;">                   
                                <figcaption>: Character</figcaption>
                                </figure>
                            </a>
                        </li>
                        <li>
                            <a href="#AIProject" target="_self">
                                <figure>
                                    <img src="img/a4.jpg" alt="" >                   
                                <figcaption>: Webtoon</figcaption>
                                </figure>	
                            </a>
                        </li>
                        <li>
                            <a href="#AIProject" target="_self"  >
                                <figure><img src="img/a5.jpg" alt="">                   
                                <figcaption>: Universe</figcaption>
                                </figure>
                            </a>
                        </li>
                        <li>
                            <a href="#AIProject" target="_self" >
                                <figure>
                                    <img src="img/a6.jpg" alt="" >                    
                                <figcaption>: Fantasy</figcaption>
                                </figure>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </section>        
            
        <!-- section 5 map -->
        <section class="Map" id="Map">   
            <br>
            <div class="common-title">Map</div>
            <br>
            
            <div class="margin-box">
                <div id="map" style="width:100%;height:500px;"></div>
                <div id="clickLatlng"></div>
            </div>

        <div class="place-info">
            <div class="content">
                <p class="hall">+ Email : star@gmail</h3>
                <p class="address">+ 주소 : 서울특별시 영등포구 1000</p>
            </div>         
        </section>  

         <!-- section 6 게시판 -->
        <section class="field" id="field">
            <div class="login-container">
                <!-- 입력 영역 -->
                <div class="common-title">We make a new Generation, and new Universe</div>
                <br>
                <img src="img/last1.jpg" alt="" style="width:420px;height:550px;align-items: flex-end;" >
                <img src="img/last2.jpg" alt="" style="width:520px;height:550px;align-items: flex-end;" >
                              
            <!--카피라이트-->
            <div class="copy">       
                <br>                               
                <p align="center">Copyright&copy: 2023 AI Project JOE. All rights reserved.</p>   
            </div>                     
            </div>             
        </section>

        <!-- map api -->         
        <script>
            // 카카오 지도 API 기능 구현하기 
			
            var lat = 37.51826573899883		// 위도 
            var lon = 126.90642947856348

            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표 
                    center: new kakao.maps.LatLng(37.51826573899883, 126.90642947856348), // 지도의 중심좌표
                    level: 4, // 지도의 확대 레벨
                    mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
                }; 

            // 지도를 생성한다 
            var map = new kakao.maps.Map(mapContainer, mapOption); 

            // 지도 타입 변경 컨트롤을 생성한다
            var mapTypeControl = new kakao.maps.MapTypeControl();

            // 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);	

            // 지도에 확대 축소 컨트롤을 생성한다
            var zoomControl = new kakao.maps.ZoomControl();

            // 지도의 우측에 확대 축소 컨트롤을 추가한다
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            // 지도에 마커를 생성하고 표시한다
            var marker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(lat, lon), // 마커의 좌표
                map: map // 마커를 표시할 지도 객체
            });

            // 커스텀 오버레이를 생성하고 지도에 표시한다
            var customOverlay = new kakao.maps.CustomOverlay({
                map: map,
                content: '<div style="padding:10px 15px;background:#fff; border: 1px solid black;">Human center</div>', 
                position: new kakao.maps.LatLng(lat, lon), // 커스텀 오버레이를 표시할 좌표
                xAnchor: 0.5, // 컨텐츠의 x 위치
                yAnchor: 0 // 컨텐츠의 y 위치
            });

            kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
                
                // 클릭한 위도, 경도 정보를 가져옵니다 
                var latlng = mouseEvent.latLng; 
                
                // 마커 위치를 클릭한 위치로 옮깁니다
                marker.setPosition(latlng);
                
                var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
                message += '경도는 ' + latlng.getLng() + ' 입니다';
                
                var resultDiv = document.getElementById('clickLatlng'); 
                resultDiv.innerHTML = message;                
            });        
        </script>


        <!-- 회원가입 html 불러오기. -->
        <script>        
        $("#btn2").off("click").on("click", function(){
            // ajax 실행
            let option = {                 
                "url" : "/login.html", // sts에서 경로를 변경했다. 
                "type": "get",
                "success" : function(data){
                    console.log(data);                       
                    /* let result = document.querySelector("#login");
                	result.innerHTML = data */
                	/* 새로운 jquery 구문 */
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
            
                    "url" : "/findpw.html",
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
        
        <!-- imgmake 창 불러오기 imgmake.html : AIProject 이미지 메이크 불러오기 -->
        <script>
             
             $("#btn3").off("click").on("click", function(){
                // ajax 실행
                let option = {
               
                    "url" : "/imgmake.html",
                    "type": "get",
                    "success" : function(data){
                        console.log(data);                      
                        let result = document.querySelector("#AIProject");
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

        <!-- chatbot 창 불러오기 chatbot.html : health 게시판 불러오기 -->
        <script>
            
            $("#btn4").off("click").on("click", function(){
                // ajax 실행
                let option = {
            
                    "url" : "/chatbot.html",
                    "type": "get",
                    "success" : function(data){
                        console.log(data);                        
                        let result = document.querySelector("#chatbot");
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

          <!-- field 창 불러오기 field.html : 게시판, post -->
          <script>
            
            $("#btn5").off("click").on("click", function(){
                // ajax 실행
                let option = {
            
                    "url" : "/field.html",
                    "type": "get",
                    "success" : function(data){
                        console.log(data);                        
                        
                         let result = document.querySelector("#field");
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

        <!-- libstudy 창 불러오기 libstudy.html : 공공데이터 크롤링 -->
          <script>            
            $("#btn6").off("click").on("click", function(){
                // ajax 실행
                let option = {
            
                    "url" : "/libstudy.html",
                    "type": "get",
                    "success" : function(data){
                        console.log(data);                        
                        
                        
                        /* let result = document.querySelector("#Find");
                   		result.innerHTML = data
                   		---- 아래의 jq로 수정함 : 중요, 공부하기~~
                   		*/
                   		/* 새로운 jquery 구문 */
                   		$("#Find").html(data);
                   		
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
        
        <!-- booklist 소장정보 창 불러오기 booklist.html : 공공데이터 크롤링 -->
          <script>            
            $("#btn8").off("click").on("click", function(){
                // ajax 실행
                let option = {
            
                    "url" : "/booklist.html",
                    "type": "get",
                    "success" : function(data){
                        console.log(data);                        
                        
                        
                        /* let result = document.querySelector("#Find");
                   		result.innerHTML = data
                   		---- 아래의 jq로 수정함 : 중요, 공부하기~~
                   		*/
                   		/* 새로운 jquery 구문 */
                   		$("#Find").html(data);
                   		
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