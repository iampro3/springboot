/**
 * 
 */

 
window.addEventListener("load",function(){
    getlist();
    /*     let list = document.querySelector("list");
    list.innerHTML = <h1>로딩완료</h1>;
 */    
})

function getlist(){
    // 준비
    let xhr = new XMLHttpRequest();
    
    //// 세팅
    // 세팅
    //let url = "https://cors-anywhere.herokuapp.com/https://comic.naver.com/index";
    //let url = "https://cors-anywhere.herokuapp.com/https://comic.naver.com/api/realtime/ranking/list?rankTabType=DEFAULT";

    //let url = "https://zdnet.co.kr/news/?lstcode=0060&page=1";
    let url = "https://data.seoul.go.kr/dataList/OA-15483/S/1/datasetView.do";
    url = "https://api.allorigins.win/get?url="+encodeURIComponent(url);
    xhr.open("get", url);
    
    // 실행
    xhr.send();

    // 얻어온 url 결과물을 갖고
    // 접속완료 이벤트가 실행
    xhr.onload = function(){
        let data = xhr.responseText;
        console.log("------------------------")
        //console.log(data) // 제이슨을 확인해보자.
        let json_data = JSON.parse(data);
        //console.log(json_data).contents;
        //let html = json_data.contents;        
        data = json_data.contents;        

        //console.log(html)

        let  domParser = new DOMParser();
        let html = domParser.parseFromString(data, "text/html");

        //let h3 = html.querySelector("body > div.contentWrapper > div > div.left_cont > div.news_box > div:nth-child(1) > div.assetText > a > h3")
        // 가져온 내용에서 원하는 것만 선택
         //let list_newsPost = html.querySelectorAll(".newsPost")
        let list_boxBase = html.querySelectorAll(".box-base type-b")
        let result = ""

        // for(let i=0; i < list_newsPost.length; i++){
        //     let h3 = list_newsPost[i].querySelector(".assetText h3")
        //     if(h3){
        //         let title = list_newsPost[i].querySelector(".assetText h3").innerHTML
        //         let date = list_newsPost[i].querySelector(".byline span").innerHTML
        //         let writer = list_newsPost[i].querySelector(".byline a").innerHTML


        //         let img_src = list_newsPost[i].querySelector(".assetThumb img").getAttribute("data-src")
        
        //         result += "<div>"
        //         result += "     <h3>"+ title + "</h3>"
        //         result += "     <img src="+ img_src +">"
        //         result += "     <span>"+ date +"</span>"
        //         result += "     <a>"+ writer +"</a>"
        //         result += "</div>"
        //     } 


            for(let i=0; i < list_boxBase.length; i++){
                let h3 = list_boxBase[i].querySelector(".box-base type-b")
                if(h3){
                    let title = list_boxBase[i].querySelector(".assetText h3").innerHTML
                    //let date = list_newsPost[i].querySelector(".byline span").innerHTML
                    //let writer = list_newsPost[i].querySelector(".byline a").innerHTML
    
    
                    //let img_src = list_newsPost[i].querySelector(".assetThumb img").getAttribute("data-src")
            
                    result += "<div>"
                    result += "     <h3>"+ title + "</h3>"
                    result += "     <img src="+ img_src +">"
                    //result += "     <span>"+ date +"</span>"
                    //result += "     <a>"+ writer +"</a>"
                    result += "</div>"
                }
        }        

        //let list = document.querySelector("#result");
        let list = document.querySelector("#list");
        list.innerHTML = result;

        //console.log(title_1)
        console.log("------------------------")
    }


}
