<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>
 <!--     <input type="button" id="btn1" value="js-ajax 실행"> -->
 	<input type="button" id="btn2" value="jq-ajax 실행">
    <div id="result" style="border: 1px solid white;">내용없음</div>
    <script>
        // 참고 : https://poiemaweb.com/js-ajax#3-xmlhttprequest
        /* let btn1 = document.querySelector("#btn1");
        btn1.addEventListener("click", function(){ */
        let btn2 = document.querySelector("#btn2");
        btn2.addEventListener("click", function(){
            
            // ajax 객체 생성
            const xhr = new XMLHttpRequest();
            
            // 보낼 준비
//            let url = "http://localhost:8081/json";
            //let url = "http://localhose:8081/test1";
            //let url = "http://localhose:8081/test1";
//            let url = "http://localhose:8081/test2";
			let url = "https://data.seoul.go.kr/dataList/OA-15483/S/1/datasetView.do";
    		url = "https://api.allorigins.win/get?url="+encodeURIComponent(url);
            xhr.open("GET", url);
            
            // 실행을 지시. 단! 언제 끝날지 모름
            xhr.send();
            // 다녀오는게 끝났을때 (응답 이후에)
            xhr.onload = function(){
                console.log(xhr.responseText);
                let result = document.querySelector("#result");
                result.innerText = xhr.responseText
                // result.innerHTML = xhr.responseText
            }
        })
    </script>
    <!-- <hr>
    jQuery로 ajax 실행<br> -->
  <!--    <input type="button" id="btn2" value="jq-ajax 실행"> -->
    <script>
        /* dom */ /*이벤트제거*//*이벤트 바인딩*/
        $("#btn2").off("click").on("click", function(){
            // ajax 실행
            let option = {
                //"url" : "http://localhost:8081/json",
                "url" : "http://localhost:8081/test1",	// button을 눌러 test1.jsp 파일을 불러와서 실행한다. 
                "type": "get",
                "success" : function(data){
                    console.log(data);
                    let result = document.querySelector("#result");
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
                //"url" : "http://localhost:8081/json",
                "url" : "http://localhost:8081/test1",
                //"url" : "http://localhost:8081/test2",
                //"url" : "http://localhost:8081/test3",
                "type": "get"
            }
            $.ajax(option2)
                .done(function(data){
                    console.log(data);
                    let result = document.querySelector("#result");
                    result.innerHTML = data
                })
                .fail()
                .always(function(data){
                    console.log("THE END")
                })
        })
    </script>
</body>
</html>