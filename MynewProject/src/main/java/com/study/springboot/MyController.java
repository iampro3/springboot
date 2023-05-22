package com.study.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MyController {

    @RequestMapping("/index")
    public @ResponseBody String root() throws Exception{
        return "index.html";
    }
 
    @RequestMapping("/test1")
    public String test1(HttpServletRequest httpServletRequest, Model model) {
		
		// 전달받은 파라미터 중에 key가 id인 것의 value를 가져온다.
		// key가 없다면 null을  return한다.    	
    	// test1?id=ss&name=aa / 주소 불러오는 방식
		String id = httpServletRequest.getParameter("id");
		String pw = httpServletRequest.getParameter("pw");
		String name = httpServletRequest.getParameter("name");
		String birth = httpServletRequest.getParameter("birth");
		String gender = httpServletRequest.getParameter("gender");
		String email = httpServletRequest.getParameter("email");
		String phone = httpServletRequest.getParameter("phone");
		
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		model.addAttribute("name", name);
		model.addAttribute("birth", birth);
		model.addAttribute("gender", gender);
		model.addAttribute("email", email);
		model.addAttribute("phone", phone);
		return "test1";
}   

	 @RequestMapping("/test2") 
	 public String test2	 
	 	(
		// String id = httpServletRequest.getParameter("id");
		// 이 역할을 해 줌
		// 파라미터 중 id 없는 경우
		// 실행되지 않도록 해 줌
		@RequestParam("id") String id,
	 
		// key가 필수 : 없으면 400 에러 코드
		// @RequestParam("name") 
		
		// 전달인자 없이 상요할 때, 넘겨받은 모든 것을 map에 저장
		//@RequestParam Map map
		
		// key 없어도 사용하려면
		@RequestParam(value="name", required=false) 
		String name, Model model) {
		 	model.addAttribute("id", id); 
		 	model.addAttribute("name", name);
	 
		 	return "test1"; }
	//전달받은 key와 클래스의 필드명이 같은 경우
	 // ("set"+ 전달받은 key의 첫글자를 대문자로 하는 메소드를 실행
	 // 자동으로 값을 채운다.
	 // 뒤에 나오는 괄호안의 글씨를 key로 model에 넣어준다.
	 // 62이 63와 같이 동일하면 생략가능함
	 //@ModelAttribute("memberDTO")	
	 // MemberDTO memberDTO
	@RequestMapping("/test3")	// 전달인자를 모두 알 수 있다.
	public String test3(MemberDTO memberDTO, Model model)
	{
		String id = memberDTO.getId();
		System.out.println("id:" + id);
				
		// 아래가 없으면 test3의 id와 name가 출력 되지 않는다.
		// member2를 model에 담아주어야 한다.
		model.addAttribute("member2", memberDTO);	
		return "test3";
	}
					  // 주소창에 입력하는 값 : "http://localhost:8081"/test4/{studentId}/{name}
	@RequestMapping("/test4/{studentId}/{name}")	// {studentId} : @PathVariable String studentId에 담는다.
							// 변수명이 같아야 한다. 규약
	public String getStudent(@PathVariable String studentId,
            @PathVariable String name,
            Model model)
		{
			model.addAttribute("id", studentId);
			model.addAttribute("name", name);
			return "test1";	// jsp 파일 명 
		}	
}
	