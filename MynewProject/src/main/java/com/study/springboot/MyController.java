package com.study.springboot;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dto.MemberDTO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyController {
	
	/* -- 항상 ststic 폴더 > index.html 파일이 1순위로 열린다.
	 * @RequestMapping("/") public @ResponseBody String root() throws Exception{
	 * 
	 * System.out.println("html :"); return "index.html"; }
	 */
 
//	  @RequestMapping("/")
//	 	public String index() {
//		return "index";
//	}
	  
	  
    @RequestMapping("/test1")
    public String test1(HttpServletRequest httpServletRequest, Model model) {
		
		// 전달받은 파라미터 중에 key가 id인 것의 value를 가져온다.
		// key가 없다면 null을  return한다.    	
    	// test1?id=ss&name=aa / 주소 불러오는 방식
		String id = httpServletRequest.getParameter("id");
		String pw = httpServletRequest.getParameter("pw");
		String name = httpServletRequest.getParameter("name");
		String phone = httpServletRequest.getParameter("phone");
		String email = httpServletRequest.getParameter("email");
		String gender = httpServletRequest.getParameter("gender");
		String birth = httpServletRequest.getParameter("birth");
		
		model.addAttribute("id", id);
		model.addAttribute("pw", pw);
		model.addAttribute("name", name);
		model.addAttribute("phone", phone);
		model.addAttribute("email", email);
		model.addAttribute("gender", gender);
		model.addAttribute("birth", birth);
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
	
	
	List<String> list = new ArrayList();
	
	@RequestMapping("/send1") // 모든 method를 받을 수 있음
//	@RequestMapping(value="/send1") // 위와 같음
//	@RequestMapping(value="/send1", method=RequestMethod.GET)
//	@GetMapping("/send1")// 위와 같음
//	@RequestMapping(value="/send1", method={RequestMethod.GET, RequestMethod.POST})
	// get이 아닌 method로 들어오면 405 method not allowed
//	@PostMapping("/send1")
	public String print(
				HttpServletRequest request,
				
				// 들어올때 필수; 없으면 400 bad request
				@RequestParam("id") String id2,
				
				// 필수 아님
				@RequestParam(value="id", required=false) String id3,
				
				Model model
			) {
		
		// id에 해당하는 내용을 전달받아
		// 변수에 저장한다

		// 전달받은 key값 중에서 첫번째것 하나만 가져옴
		String id = request.getParameter("id"); // querySelector처럼
		String[] ids = request.getParameterValues("id"); // querySelectorAll처럼
		
		System.out.println("id : "+ id);
		System.out.println("id2 : "+ id2);
		System.out.println("id3 : "+ id3);
		for(String value : ids) {
			System.out.println("ids : "+ value);
		}
		
		////////////////////////////////////////////////
		// 내보내기
		////////////////////////////////////////////////
		model.addAttribute("req_id", id);
		
		list.add(id);
		model.addAttribute("list_id", list);
		for(int i=0; i<list.size(); i++) {
			System.out.println( i +"번째 id : "+ list.get(i) );
		}
		
		request.setAttribute("req_id2", id);
		request.setAttribute("text", "abcde");
		request.setAttribute("m", model);
		
		String req_id2 = (String) request.getAttribute("req_id2");
		System.out.println("req_id2 : "+ req_id2);
		
		return "viewresult";
	}
	
	// cookie 설정
	@RequestMapping("/index")
	public String index(
			/*
			 * public String cookie(
			 */			// 요청에 관한 모든 것
			HttpServletRequest request,
			
			// 응답에 관한 모든 것 - 브라우저까지 전송 됨
			//	* model은 jsp까지만 전송 됨
			HttpServletResponse response
	) {
		// 쓰기
		Cookie cookie = new Cookie("popup3", "ks");
		cookie.setMaxAge(-10); // 단위: 초
		cookie.setPath("/");
		response.addCookie(cookie);
		
		// 읽기
		Cookie[] cookies = request.getCookies();
		if( cookies != null ) {
			for(Cookie c : cookies) {
				System.out.println("c : "+ c);
				System.out.println("c.getName() : "+ c.getName());
				System.out.println("c.getValue() : "+ c.getValue());
			}
		}
		
		return "cookie";
	}
	
	@RequestMapping("/logout")
	public String logout(
			HttpServletRequest request
	) {
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "session";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	 @RequestMapping("/mypage")
	// @RequestMapping("/index")
	 	public String mypage(HttpServletRequest request, Model model) {
		
		String nextPage = "login";
		
		// 세션 가져오기
		HttpSession session = request.getSession();
		
		// 세션에서 꺼내기
		String id = (String) session.getAttribute("isLogin2");
		System.out.println("id : "+ id);
		if(id != null) {
			model.addAttribute("id", id);
//			nextPage = "index";
			nextPage = "mypage";
		} else {
			model.addAttribute("msg", "로그인 해주세요");
		}		
		return nextPage;
	}

	@RequestMapping("/login_check")
	public String login_check(
			HttpServletRequest request,
			
			@RequestParam("pw") String pw,
			
			Model model
	) {
		String nextPage = null;
		
		String id = request.getParameter("id");

		String _id = "admin";	
		String _pw = "1234";
		
		if(id != null && pw != null) {
			if(id.equals(_id) && pw.equals(_pw)) {
				// 로그인 확인 완료
				
				// 세션 가져오기
				HttpSession session = request.getSession();
				
				// 세션에 저장
				session.setAttribute("isLogin2", id);
//				session.removeAttribute("isLogin2");
				
				model.addAttribute("id", id);
//				nextPage = "/index";
				nextPage = "/mypage";
			} else {
				// 회원 정보 없음
				model.addAttribute("msg", "회원이 아닙니다");
				nextPage = "/login";
			}
		} else {
			model.addAttribute("msg", "아이디와 패스워드는 필수입니다");
			nextPage = "/login";
		}
		
		return "redirect:"+ nextPage;
	}
}
	