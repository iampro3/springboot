package com.study.springboot;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dao.ISimpleBbsDao;
import com.study.springboot.dto.MemberDTO;
import com.study.springboot.dto.SimpleBbsDto;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyController {
	
	// log창에 log 상태를 보여준다.
private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
/* board 영역 */
	@Autowired
	ISimpleBbsDao dao;

	@RequestMapping("/writeForm")
	public String writeForm() {
		return "writeForm";
	}
/* board 영역 */
	
	/* -- 항상 static 폴더 > index.html 파일이 1순위로 열린다.
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

/*
 * @RequestMapping("/test2") public String test2 ( // String id =
 * httpServletRequest.getParameter("id"); // 이 역할을 해 줌 // 파라미터 중 id 없는 경우 //
 * 실행되지 않도록 해 줌
 * 
 * @RequestParam("id") String id,
 * 
 * // key가 필수 : 없으면 400 에러 코드 // @RequestParam("name")
 * 
 * // 전달인자 없이 상요할 때, 넘겨받은 모든 것을 map에 저장 //@RequestParam Map map
 * 
 * // key 없어도 사용하려면
 * 
 * @RequestParam(value="name", required=false) String name, Model model) {
 * model.addAttribute("id", id); model.addAttribute("name", name);
 * 
 * return "test1"; } //전달받은 key와 클래스의 필드명이 같은 경우 // ("set"+ 전달받은 key의 첫글자를 대문자로
 * 하는 메소드를 실행 // 자동으로 값을 채운다. // 뒤에 나오는 괄호안의 글씨를 key로 model에 넣어준다. // 62이 63와 같이
 * 동일하면 생략가능함 //@ModelAttribute("memberDTO") // MemberDTO memberDTO
 * 
 * @RequestMapping("/test3") // 전달인자를 모두 알 수 있다. public String test3(MemberDTO
 * memberDTO, Model model) { String id = memberDTO.getId();
 * System.out.println("id:" + id);
 * 
 * // 아래가 없으면 test3의 id와 name가 출력 되지 않는다. // member2를 model에 담아주어야 한다.
 * model.addAttribute("member2", memberDTO); return "test3"; } // 주소창에 입력하는 값 :
 * "http://localhost:8081"/test4/{studentId}/{name}
 * 
 * @RequestMapping("/test4/{studentId}/{name}") // {studentId} : @PathVariable
 * String studentId에 담는다. // 변수명이 같아야 한다. 규약 public String
 * getStudent(@PathVariable String studentId,
 * 
 * @PathVariable String name, Model model) { model.addAttribute("id",
 * studentId); model.addAttribute("name", name); return "test1"; // jsp 파일 명 }
  0606 주석 처리함 : @RequestParam("id") String id, 이 구문이 겹치는 이유로 오류나서 프로젝트에 필요없는 코드*/
	
	
	List<String> list = new ArrayList();
	
	@RequestMapping("/send1") // [@RequestMapping] : 모든 method를 받을 수 있음
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
				//@RequestParam("pw") String pw2, //  0606추가함 
				
				// 필수 아님
				@RequestParam(value="id", required=false) String id3,
				
				Model model
			) {
		
		// id에 해당하는 내용을 전달받아
		// 변수에 저장한다

		// 전달받은 key값 중에서 첫번째것 하나만 가져옴
		String id = request.getParameter("id"); // querySelector처럼
		String[] ids = request.getParameterValues("id"); // querySelectorAll처럼
		
		String pw = request.getParameter("pw"); // querySelector처럼	//  0606추가함 
		String[] pws = request.getParameterValues("pw"); // querySelectorAll처럼	//  0606추가함 
		
		String name = request.getParameter("name"); // querySelector처럼	//  0606추가함 
		String[] names = request.getParameterValues("name"); // querySelectorAll처럼	//  0606추가함 
		
		String phone = request.getParameter("phone"); // querySelector처럼	//  0606추가함 
		String[] phones = request.getParameterValues("phone"); // querySelectorAll처럼	//  0606추가함 
		
		String email = request.getParameter("email"); // querySelector처럼	//  0606추가함 
		String[] emails = request.getParameterValues("email"); // querySelectorAll처럼	//  0606추가함 
		
		String gender = request.getParameter("gender"); // querySelector처럼	//  0606추가함 
		String[] genders = request.getParameterValues("gender"); // querySelectorAll처럼	//  0606추가함 
		
		
		System.out.println("id : "+ id);
		System.out.println("pw : "+ pw);
		System.out.println("id2 : "+ id2);
		System.out.println("id3 : "+ id3);
		for(String value : ids) {
			System.out.println("ids : "+ value);
		}
		
		// 0606 추기힘

		for(String value : pws) {
			System.out.println("pws : "+ value);
		}
		
		for(String value : names) {
			System.out.println("names : "+ value);
		}
		
		for(String value : phones) {
			System.out.println("phones : "+ value);
		}		
		
		for(String value : emails) {
			System.out.println("emails : "+ value);
		}
		
		for(String value : genders) {
			System.out.println("genders : "+ value);
		}
		////////////////////////////////////////////////
		// 내보내기
		////////////////////////////////////////////////
		model.addAttribute("req_id", id);
		model.addAttribute("req_pw", pw);
		model.addAttribute("req_name", name);
		model.addAttribute("req_phone", phone);
		model.addAttribute("req_email", email);
		model.addAttribute("req_gender", gender);
		
		list.add(id);
		model.addAttribute("list_id", list);
		for(int i=0; i<list.size(); i++) {
			System.out.println( i +"번째 id : "+ list.get(i) );
		}		
		
		// 0606 추기힘
		list.add(pw);
		model.addAttribute("list_pw", list);
		for(int i=0; i<list.size(); i++) {
			System.out.println( i +"번째 pw : "+ list.get(i) );
		}	
		
		// 이하 0607 추기힘
		list.add(name);
		model.addAttribute("list_name", list);
		for(int i=0; i<list.size(); i++) {
			System.out.println( i +"번째 name : "+ list.get(i) );
		}		
		
		list.add(phone);
		model.addAttribute("list_phone", list);
		for(int i=0; i<list.size(); i++) {
			System.out.println( i +"번째 phone : "+ list.get(i) );
		}		
		
		list.add(email);
		model.addAttribute("list_email", list);
		for(int i=0; i<list.size(); i++) {
			System.out.println( i +"번째 email : "+ list.get(i) );
		}	
		
		list.add(gender);
		model.addAttribute("list_gender", list);
		for(int i=0; i<list.size(); i++) {
			System.out.println( i +"번째 gender : "+ list.get(i) );
		}	
		
		String req_id2 = (String) request.getAttribute("req_id2");
		System.out.println("req_id2 : "+ req_id2);
		
		return "viewresult";
	}
	
	@RequestMapping("/input")
	public String input() {
		return "input";
	}
	
	@RequestMapping("/findpw")
	public String findpw() {
		return "findpw";
	}
	
	@RequestMapping("/find")
	public String find() {
		return "find";
	}
	
	@RequestMapping("/session")
	public String session(
			HttpServletRequest request
	) {
		// 세선 : 30분의 유효기간
		// JSESSIONID라는 키를 가지는 세션쿠키를 이용
		
		HttpSession session = request.getSession();
		boolean isNew = session.isNew(); // 최초 접속:true
		System.out.println("isNew : "+ isNew);
		
		// 세션에 저장
		session.setAttribute("isLogin", "true");
		
		return "session";
	}
	
	@RequestMapping("/session2")
	public String session2(
			HttpServletRequest request
	) {
		HttpSession session = request.getSession();
		
		// 세션에서 불러오기
		String isLogin = (String)session.getAttribute("isLogin");
		System.out.println("isLogin : "+ isLogin);
		try {
//			if(isLogin != null && isLogin.equals("true")) {
			if(isLogin != null 
				&& "true".equals(isLogin)) {
				
				System.out.println("로그인 되어있습니다.");
			} else {
				System.out.println("로그인 페이지로 이동합니다.");
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("로그인 페이지로 이동합니다.");
		}
		
		return "session";
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
		String pw = (String) session.getAttribute("isLogin3"); //  0606추가함
		System.out.println("id : "+ id);
		System.out.println("pw : "+ pw); // 0606추가함 콘솔창에 pw : null로 나옴
		if(id != null) {
			model.addAttribute("id", id);
			model.addAttribute("pw", pw);
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
			
			@RequestParam("pw") String pw2,  //  0606추가함 오류남,  pw2로 변경함
			
			Model model
	) {
		String nextPage = null;
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");  //  0606추가함 오류남, 

		String _id = "admin";	
		String _pw = "1234";
		
		if(id != null) {
			if(id.equals(_id) && pw.equals(_pw)) {
				// 로그인 확인 완료
				
				// 세션 가져오기
				HttpSession session = request.getSession();
				
				// 세션에 저장
				session.setAttribute("isLogin2", id);
				session.setAttribute("isLogin3", pw2);  //  0606추가함 "isLogin2"로 하면 콘솔창에 오류난다. id와 동일해서임 ~3으로 변경함 ,pw2로 변경
//				session.removeAttribute("isLogin2");
				
				model.addAttribute("id", id);
				model.addAttribute("pw", pw2);	 //  0606추가함 ,pw2로 변경
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
	
	
/* board 영역 */
	@RequestMapping("/write")
	public String write(
			@ModelAttribute SimpleBbsDto dto,
			Model model
	) {
		// 요청한 내용을 받아서 변수에 저장
		String writer = dto.getWriter();
		String title = dto.getTitle();
		String content = dto.getContent();
		
		// 콘솔에 출력
		System.out.println("writer : "+ writer);
		System.out.println("title : "+ title);
		System.out.println("content : "+ content);
		
		// 요청한 내용을 받아서 DB에 저장
		int result = dao.writeDao(writer, title, content);
		System.out.println("writeDao result : "+ result);
		
		//return "writeForm";
		//return userlistPage(model);	//
		return "redirect:/list";  //list를 포워드해서 받아주기: writeform에서 글쓰고 list로 간다. 
		// 200번 잘 전송됨
	}
	
	@RequestMapping("/list") // jsp로 보낸다.
	public String userlistPage(Model model) {
								//jsp로 보내려면 model 전달인자로 필요
		
		List<SimpleBbsDto> list = dao.listDao();
		model.addAttribute("list", list);
		return "list";
		
	}
	
	@RequestMapping("/view")
	public String view(Model model,
			/*@RequestParam("id") String str_id*/   //requestParam 은 id가 없는 사람은 들어오지 못하도록 설정한다. 
												// string이므로 str로 설정한다.
			@RequestParam("id") String id
			// null 을 허용하지 않음 400 에러 발생
	) {
		//id값을 받아서 
		System.out.println("str_id :" + id);
		int n_id = -1;
		//문자를 숫자로
		//n_id = Integer.parseInt("123"); // requestParam을 받음 "123"에 null 넣으면 오류난다.
		
		try {
			n_id = Integer.parseInt(id);
		}
		catch (Exception e) {
			n_id = -1;
		}
		//조회한 내용을 jsp로 보냄
		SimpleBbsDto dto = dao.viewDao(id);
		
		model.addAttribute("dto", dto);
		return "view";
	}
	
	@RequestMapping("/modifyForm")
	public String modifyForm(
			@RequestParam("id") String id,
			Model model
			) {
		
		System.out.println("/modifyForm : id :" + id);
		SimpleBbsDto dto = dao.viewDao(id);		
		model.addAttribute("dto", dto);
		
		return "modifyForm";
	}
	
	@RequestMapping("/modify")
	public String modify(
			@ModelAttribute SimpleBbsDto dto,
			Model model
			) {
	int result=	dao.updateDao(dto);
	System.out.println("업데이트결과 : " +result);
		return "redirect:/list";
	}
	
	@RequestMapping("/delete")
	public String delete(
			@RequestParam("id") String id
			) {
		int result = dao.deleteDao(id);	//ISimpleBbsDao.jsp에서 "int deleteDao(String id);"의 ()를 설정해주어야 한다.
		System.out.println("삭제 개수 : " +result);
		return "redirect:list";
	}	
	
	// 주소창에 ""-----8081/testIF"
	// title로 검색하기 코드
	@RequestMapping("/testIF")
	public String testIF(
			// 전달인자가 dto의 필드명:setter 양식:과 일치하면
			//값을 넣어줌
			@ModelAttribute SimpleBbsDto dto,
			
			//jsp로 값을 보내기 위해 사용
			Model model,
			HttpServletRequest request  
			) {
				String type = request.getParameter("type");
				String keyword = request.getParameter("keyword");
			
				System.out.println("type :" + type);
				System.out.println("keyword :" + keyword);
				
				// if 문의 ()안에는, list.jsp의 <select>안에 <option value="title">값을 넣어준 것이다.
				if("title".equals(type)) {	
					dto.setTitle(keyword);
				}else if("writer".equals(type)) {
					dto.setWriter(keyword);
				}
			//조건에 맞는 목록 선택
			List list=	dao.testIF(dto);
		
			//조회한 목록을list라는 key로 담아서 jsp로 전달
			model.addAttribute("list",list);
			//list.jsp를 호출
			return "list";
	}
	
	// chk box를 이용해서 찾는다.
	@RequestMapping("/testForeach")
	public String testForeach(
			// 전달인자가 dto의 필드명:setter 양식:과 일치하면
			//값을 넣어줌
			@ModelAttribute SimpleBbsDto dto,
			
			//jsp로 값을 보내기 위해 사용
			Model model,
			HttpServletRequest request  
			) {
		
				/* "getParameterValues"는 배열형태로 받을 수 있음 */
				// checkbox를 모두 선택되도록 for문으로 한다.			
				String[] list_chk = request.getParameterValues("chk"); 
				if(list_chk !=null) {
					for(int i=0 ; i<list_chk.length; i++) {
						System.out.println("list_chk["+i+"] :" + list_chk[i]);
					}
				}
				System.out.println("-------------------");
				
				// null 값 설정함
				list_chk = dto.getChk();	//  SimpleBbsDto의 
				if(list_chk !=null) {
					for(int i=0 ; i<list_chk.length; i++) {
						System.out.println("list_chk["+i+"] :" + list_chk[i]);
						
						logger.info("list_chk["+i+"] :" + list_chk[i]);
						// logger.error("list_chk["+i+"] :" + list_chk[i]);	// log창에 보여진다.
					}
				} else {
					System.out.println("list_chk is null");
				}
				List list = dao.testForeach(dto);
				model.addAttribute("list", list);
			
		return "list";
	}
}
	