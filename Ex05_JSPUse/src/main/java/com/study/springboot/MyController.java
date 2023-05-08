package com.study.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MyController {
	
	@RequestMapping("/")
	public @ResponseBody String root() throws Exception{
		
		return "JSP in Gradle";
	}
	
	@RequestMapping("/test1")	// url
	public String test1() {		// 메소드 
		System.out.println();
		return "test1";			// jsp 이름	: application. "/WEB-INf/views/" +"test3"+".jsp"를 불러온다.
	}
	
	@RequestMapping("/ajax")	// url
	public String ajax() {		// 메소드 
		// System.out.println();
		return "ajax";			// jsp 이름	: application. "/WEB-INf/views/" +"test3"+".jsp"를 불러온다.
	}
	
	@RequestMapping("https://zdnet.co.kr/news/?lstcode=0060&page=1/get?url")	// url
	public String home() {		// 메소드 
		// System.out.println();
		return "home";			// jsp 이름	: application. "/WEB-INf/views/" +"test3"+".jsp"를 불러온다.
	}
	
	@RequestMapping("/test2")
	public String test2(){
		System.out.println("/test2 실행");
		String nextPage = "sub/test2";
		return nextPage;
	}
	
	@RequestMapping("/json")
	@ResponseBody
	public String json() {
		System.out.println("/json 실행");
		return "{'key1': 'value1', 'key2':'value2'}";
	}
}
