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
   
        <!-- slick �̹��� �����̵� : ���̺귯�� ��� slick.css ���� -->
        <!-- slick css CDN -->
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">        
        <link rel="stylesheet" href="/style.css"> 
       <%--  <link href="<c:url value="/resources/static/style.css"/>" rel='stylesheet' />   --%>    
    
        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=db50938a3b4ef4e31b81ef7b279e5313"></script>
        
        <!-- slick js �̹��� �����̵� -->
        <script src="/slick.min.js"></script>
    
        <script src="/script.js"></script>        
        
        <!-- cookie style ������ -->
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

    <!-- login ��ư ������ �̵� -->
    <script>
        function fnClick(){
                let matchid = "${matchid}"  // if�� ���� ������ �־�� �Ѵ�.
             if (matchid){            
                alert("ȯ���մϴ�!")
                location.href = "index.jsp"
/*                 location.href = "index.html" */
             } else {
                alert("id�� pw�� �Է����ּ���.")
                location.href = "http://naver.com"
            } 
        }
        </script>
        
         <script>
         <!-- cookie popup scripts ���� -->

         /* setCookie()�� getCookie�� �״�� ������ ����ص� �ȴ�. */
         	function setCookie(){
         		// �б�
         		/* document.cookie */
         		
         		//����
         		//key=value; path=/user(user�������� �� ��� ����); expires=GMT, UTC
         		
         		let now = new Date();
         		let after_10s=now.getSeconds()+10
         		now.setSeconds(after_10s)
         		
         		document.cookie= "popup7=true; path=/; expires=" +now.toGMTString(); 
         		/*	popup 7 : 7�� ���� �� ���̱�*/
         		document.cookie= "popup1=false; path=/; expires=" +now.toGMTString(); 
         		
          		/* document.cookie= "login=true"  */
         		console.log("cookie ���� �Ϸ�")
         	}
         	
         	//�� maxAge�� ������ ��
         	function setCustomCookie(key, value, maxAge){
         		let now = new Date();
         		let after=now.getSeconds()+maxAge
         		now.setSeconds(after)
         		
         /* 		document.cookie= "popup7=true; path=/; expires=" +now.toGMTString();  */
         		document.cookie= key + "=" + value + "; path=/; expires=" +now.toGMTString(); 		
         	}
         	
         	function getCookie(key){
         		let value = null;
         		//let key = "popup7";  // �������ڷ� �ִ´�.
         		let cookie = document.cookie;
         		console.log(cookie)	//"popup7=true"
         		// "popup7=true"; "popup5=true"; "popup7=true"; "popup6=false";
         		// ��� 1
         		let cookies = cookie.split("; ") // =���� �ڸ� �迭
         		for(c of cookies){
         			let kv = cookie.split("=") // =���� �ڸ� �迭
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
         	
         	// ����
         	setCookie()
         	
         	getCookie()
         	setTimeout(function(){
         		getCookie()
         	}, 11*1000)
         	
          	let popup_1 = document.querySelector("#popup_1")
         	popup_1.addEventListener("click", function(event){
         		// click�� ���(Ȥ�� �̺�Ʈ�� �߻��� ���)���
         		// �� ����� üũ ����
         		console.log(event.target.checked);
         		
         		if(event.target.checked){ //  == true �� �ᵵ �ǰ� �� �ᵵ �ȴ�. �ݵ�� "=="���� ǥ���ϱ�
         			setCustomCookie('popup_1', true, -1); // 60�� -1
          			//setCustomCookie('popup_1', true, 60*1); // 60�� 
         			document.querySelector(".popup").style.display= "none";	// popup�� check�ڽ��� üũ �ϴ� ���� popup �������.
         		}
         	})          	
         	
              	
         	function showPopup(){
         		let value = getCookie("popup_1")
         		console.log("value : ", value, typeof(value), ( value == true )) // if���� ������ ����غ���.
         		if(value == 'true'){
         			document.querySelector(".popup").style.display = "none";
         		} else{
         			document.querySelector(".popup").style.display= "block";
         		}
         	}
         	showPopup(); 
         	//popup check �ϴ� ��� 1. getcookie�� �����´�.
         	
     
</script>
<!-- cookie popup scripts �� -->

<body>
	<!-- cookie popup ����-->
	<div class="popup">
	<h2>���� ����</h2><br>
	 
	<h3>Login �Ǿ����ϴ�. <br> <br> MakeData �� �湮�Ͻ� ���� ȯ���մϴ�.</h3><br>
	<br>  <br>  <br>   
	â �ݱ�&nbsp<input type="checkbox" id="popup_1" ><br>  
	</div>
		<!-- cookie �� -->	
	  <!-- ���� ��� �޴� ���� -->
        <span id="btn-menu" class="btn-menu">
            <i class="fa fa-bars"></i>
        </span>
    
        <!-- ########## header ########## -->       
        <header>
            <!-- �޴� �ݱ� ��ư -->
            <span id="btn-close" class="btn-menu">
                <i class="fa fa-times"></i>
            </span>
    
            <a href="#" class="logo">
                <span>Makedata</span>                
                <br>
                <br>
                <div class="main-logo"><img src="img/logo-01.png" alt="make"></div>               
           </a>
           
        <!-- ���� Navigation �޴� -->
        <nav class="navbar">
            <a href="#Find">������ ����</a>                   
            <a href="#chatbot">Chatbot</a>
            <a href="#AIProject">Image make</a>                    
            <a href="https://iampro3-iris-streamlit-app-0331-w3thn9.streamlit.app/" target="_blank">Bidgata Analysis Portpolio</a>
        </nav>
            <br>
            <br>
            <div class="navbar_log">
            <a href="/">Logout</a>	<!-- index.jsp�� �̵��� -->
           
            <form action="http://localhost:8081/send1" name="sign" method="get">
            <a href = "#" >
            ${id }�� ȯ���մϴ�!</a>             
             </div>
             </form>
            <br>
        <!-- sns ��ư -->
            <div class="sns">        
            <a href="https://twitter.com/i/flow/login" class="fab fa-twitter"></a>
            <a href="https://www.instagram.com/" class="fab fa-instagram"></a>
            <a href="#Map">M</a>            
            <span id="btn5"><a href="#field" >Post</a></span>            
        </div>            
    </header>

    <!-- ########## section 1 ########## -->
    <section class="Find" id="Find">             
            
        <!-- ������ ����/���� ���� -->
            <!-- index.html �������� -->
            <!-- ��ü ���� -->
        <div class="container">
            <!-- �Է� ���� -->
            <form action="" method="post">
                <!-- �Է� �ڽ� -->
                <div class="title-wrap">
                    <!-- ��ø �ڽ� (inner)-->
                    <div id="title">
                        <div class="title-text">������ ���� �˻�</div>             
                        <br>
                        <!-- �������� -->
                        <div class="title-inputbox">
                            <p>����� �������� ��ȭ���� ������ �˻��մϴ�</p><br>
                               
                                <!-- libstudy.html �ҷ����� -->
                                <div class="title-btnbox" id="btn6"><a href="#Find" class="title-btn">��ȭ���� ���� ��ȸ�ϱ�</a></div>                                                                  
                        </div>
                        
                        <br>
                        <br>
                         <!-- �������� -->
                        <div class="title-inputbox">
                            <p>����� �������� ����� ���� ������ �˻��մϴ�</p><br>
                                
                                <!-- booklist.html �ҷ����� -->
                                <div class="title-btnbox" id="btn8"><a href="#Find" class="title-btn">���嵵�� ���� ��ȸ�ϱ�</a></div>                                                                  
                        </div>
                    </div>
                </div>
            </form>
        </div>      
    </section>

        <!-- section 2 ê�� -->
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
                <p class="address">+ �ּ� : ����Ư���� �������� 1000</p>
            </div>         
        </section>  

         <!-- section 6 �Խ��� -->
        <section class="field" id="field">
            <div class="login-container">
                <!-- �Է� ���� -->
                <div class="common-title">We make a new Generation, and new Universe</div>
                <br>
                <img src="img/last1.jpg" alt="" style="width:420px;height:550px;align-items: flex-end;" >
                <img src="img/last2.jpg" alt="" style="width:520px;height:550px;align-items: flex-end;" >
                              
            <!--ī�Ƕ���Ʈ-->
            <div class="copy">       
                <br>                               
                <p align="center">Copyright&copy: 2023 AI Project JOE. All rights reserved.</p>   
            </div>                     
            </div>             
        </section>

        <!-- map api -->         
        <script>
            // īī�� ���� API ��� �����ϱ� 
			
            var lat = 37.51826573899883		// ���� 
            var lon = 126.90642947856348

            var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
                mapOption = {
                    center: new kakao.maps.LatLng(lat, lon), // ������ �߽���ǥ 
                    center: new kakao.maps.LatLng(37.51826573899883, 126.90642947856348), // ������ �߽���ǥ
                    level: 4, // ������ Ȯ�� ����
                    mapTypeId : kakao.maps.MapTypeId.ROADMAP // ��������
                }; 

            // ������ �����Ѵ� 
            var map = new kakao.maps.Map(mapContainer, mapOption); 

            // ���� Ÿ�� ���� ��Ʈ���� �����Ѵ�
            var mapTypeControl = new kakao.maps.MapTypeControl();

            // ������ ��� ������ ���� Ÿ�� ���� ��Ʈ���� �߰��Ѵ�
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);	

            // ������ Ȯ�� ��� ��Ʈ���� �����Ѵ�
            var zoomControl = new kakao.maps.ZoomControl();

            // ������ ������ Ȯ�� ��� ��Ʈ���� �߰��Ѵ�
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            // ������ ��Ŀ�� �����ϰ� ǥ���Ѵ�
            var marker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(lat, lon), // ��Ŀ�� ��ǥ
                map: map // ��Ŀ�� ǥ���� ���� ��ü
            });

            // Ŀ���� �������̸� �����ϰ� ������ ǥ���Ѵ�
            var customOverlay = new kakao.maps.CustomOverlay({
                map: map,
                content: '<div style="padding:10px 15px;background:#fff; border: 1px solid black;">Human center</div>', 
                position: new kakao.maps.LatLng(lat, lon), // Ŀ���� �������̸� ǥ���� ��ǥ
                xAnchor: 0.5, // �������� x ��ġ
                yAnchor: 0 // �������� y ��ġ
            });

            kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
                
                // Ŭ���� ����, �浵 ������ �����ɴϴ� 
                var latlng = mouseEvent.latLng; 
                
                // ��Ŀ ��ġ�� Ŭ���� ��ġ�� �ű�ϴ�
                marker.setPosition(latlng);
                
                var message = 'Ŭ���� ��ġ�� ������ ' + latlng.getLat() + ' �̰�, ';
                message += '�浵�� ' + latlng.getLng() + ' �Դϴ�';
                
                var resultDiv = document.getElementById('clickLatlng'); 
                resultDiv.innerHTML = message;                
            });        
        </script>


        <!-- ȸ������ html �ҷ�����. -->
        <script>        
        $("#btn2").off("click").on("click", function(){
            // ajax ����
            let option = {                 
                "url" : "/login.html", // sts���� ��θ� �����ߴ�. 
                "type": "get",
                "success" : function(data){
                    console.log(data);                       
                    /* let result = document.querySelector("#login");
                	result.innerHTML = data */
                	/* ���ο� jquery ���� */
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
            
             <!-- login â, id ã�� find.html �ҷ�����-->
            <script>
            $("#btn1").off("click").on("click", function(){
                // ajax ����
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
        
        <!-- login â, pw ã�� findpw.html �ҷ�����-->
         <script>
            $("#btn7").off("click").on("click", function(){
                // ajax ����
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
        
        <!-- imgmake â �ҷ����� imgmake.html : AIProject �̹��� ����ũ �ҷ����� -->
        <script>
             
             $("#btn3").off("click").on("click", function(){
                // ajax ����
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

        <!-- chatbot â �ҷ����� chatbot.html : health �Խ��� �ҷ����� -->
        <script>
            
            $("#btn4").off("click").on("click", function(){
                // ajax ����
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

          <!-- field â �ҷ����� field.html : �Խ���, post -->
          <script>
            
            $("#btn5").off("click").on("click", function(){
                // ajax ����
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

        <!-- libstudy â �ҷ����� libstudy.html : ���������� ũ�Ѹ� -->
          <script>            
            $("#btn6").off("click").on("click", function(){
                // ajax ����
                let option = {
            
                    "url" : "/libstudy.html",
                    "type": "get",
                    "success" : function(data){
                        console.log(data);                        
                        
                        
                        /* let result = document.querySelector("#Find");
                   		result.innerHTML = data
                   		---- �Ʒ��� jq�� ������ : �߿�, �����ϱ�~~
                   		*/
                   		/* ���ο� jquery ���� */
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
        
        <!-- booklist �������� â �ҷ����� booklist.html : ���������� ũ�Ѹ� -->
          <script>            
            $("#btn8").off("click").on("click", function(){
                // ajax ����
                let option = {
            
                    "url" : "/booklist.html",
                    "type": "get",
                    "success" : function(data){
                        console.log(data);                        
                        
                        
                        /* let result = document.querySelector("#Find");
                   		result.innerHTML = data
                   		---- �Ʒ��� jq�� ������ : �߿�, �����ϱ�~~
                   		*/
                   		/* ���ο� jquery ���� */
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