
package com.study.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;

//import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MyController {
	@RequestMapping("/insertForm")
	public String insert1() {
		return "createPage";
		
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
	
	@RequestMapping("/create")
    public String insert2(@ModelAttribute("dto")
    					   ContentDto contentDto,
    						
                          BindingResult result)
    {
        String page = "createDonePage";
        System.out.println(contentDto);
        
        ContentValidator validator = new ContentValidator();
        validator.validate(contentDto, result);
        if (result.hasErrors()) {
            page = "createPage";
        }
        
        return page;       
    }
	
	// Ex05에서 붙여왔음
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
	
	
	@RequestMapping("/test2")
	public String test2(){
		System.out.println("/test2 실행");
		String nextPage = "sub/test2";
		return nextPage;
	}
	
	
}
