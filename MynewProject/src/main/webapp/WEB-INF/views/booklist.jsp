<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울시 도서관 소장 정보</title>

 	<style>
        th{background-color: rgb(66, 0, 132);color: aliceblue;}
        th,td{
            border: 1px solid grey;
            padding: 14px 12px;      
        }
    </style>
    
</head>

<body>
<div style="margin-left:70px; margin-top: 50px;">
   
      <!-- <input type="button" id="btn7" value="소장정보 조회하기"  style="width:130px; height:30px; color: rgb(63, 6, 116);"> -->
      <div class="title-btnbox" id="btn9"><a href="#Find" class="title-btn">도서관 소장정보 조회하기</a></div>
      </div> 
    <div id="info">
   
    <table style ="padding:10px 70px">
        <thead>
            <tr>
            <th>TITLE</th>
            <th>대출 상태</th>
            <th>AUTHOR</th>
            <th>CTRLNO</th>
            <th>출판사</th>
            <th>출판년도</th>
            <th>소장 도서관</th>
            <!-- <th>METHOD</th> -->
            </tr>
        </thead>
        <tbody>
            <tr>
                <!-- <td colspan="8">내용이 없습니다.</td> -->
            </tr>
        </tbody>
    </table>
</div>

	<script>
	/* 	 console.log("viewData 실행") */
		 
		 let btn9 = document.querySelector("#btn9");
	     btn9.addEventListener("click", function(){  
	         // ajax 객체 생성
	         const xhr = new XMLHttpRequest();   // 준비시킴
	         
	          xhr.open('GET', 'http://openapi.seoul.go.kr:8088/6756645a776c75633132304162465052/json/SeoulLibraryBookSearchInfo/1/9/'); // url로 부르면 안 들어온다.
	         // 실행을 지시. 단 언제 끝날지 모름
	         xhr.send();
	         // 다녀오는것이 끝났을 때, : 응답 이후
	         xhr.onload = function(){
	             console.log(xhr.responseText);
	    		
	             try
	             {
	                 let json_data = JSON.parse(xhr.responseText);               
	                 
	 
	                 for (let i = 0; i < 10; i++) {
				          let TITLE = json_data.SeoulLibraryBookSearchInfo.row[i].TITLE;
				          let LOAN_STATUS_NAME = json_data.SeoulLibraryBookSearchInfo.row[i].LOAN_STATUS_NAME;
				          let AUTHOR = json_data.SeoulLibraryBookSearchInfo.row[i].AUTHOR;
				          let CTRLNO = json_data.SeoulLibraryBookSearchInfo.row[i].CTRLNO;
				          let PUBLER = json_data.SeoulLibraryBookSearchInfo.row[i].PUBLER;
				          let PUBLER_YEAR = json_data.SeoulLibraryBookSearchInfo.row[i].PUBLER_YEAR;
				          let LOCA_NAME = json_data.SeoulLibraryBookSearchInfo.row[i].LOCA_NAME;
				
				          let html = "";
				          html += "<tr>";
				          html += "<td>" + TITLE + "</td>";
				          
				          html += "<td>" + LOAN_STATUS_NAME + "</td>";
				          html += "<td>" + AUTHOR + "</td>";
				          html += "<td>" + CTRLNO + "</td>";
				          html += "<td>" + PUBLER + "</td>";
				          html += "<td>" + PUBLER_YEAR + "</td>";
				          html += "<td>" + LOCA_NAME + "</td>";
				          html += "</tr>";
	
	                     
	                 document.querySelector("tbody").innerHTML +=html;
	            	 }
	 
	             } catch(error){
	                 console.error(error)
	             }                
	         };
	     });

		</script>
    </body>
</html>