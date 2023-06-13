package com.study.springboot;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.springboot.dao.ISimpleBbsDao;
import com.study.springboot.dto.SimpleBbsDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyController {
	 
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	ISimpleBbsDao dao;

	@RequestMapping("/writeForm")
	public String writeForm() {
		return "writeForm";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/loginCheck")
	public String loginCheck(HttpServletRequest req) {
		//위에서 얻어온 세션 담기
		HttpSession session = req.getSession();
		session.setAttribute("isLogon", true);  // isLogon:boolean 에 true가 들어간다.
		
		// 콘솔에 출력
		return "redirect:/list";
	}
		
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) {
		//위에서 얻어온 세션 담기
		HttpSession session = req.getSession();
		session.invalidate();		
		
		return "login";
	}
	
	
	@RequestMapping("/write")
	public String write(
			@ModelAttribute SimpleBbsDto dto,
			Model model,
			HttpServletRequest req  // 세션 만들기
	) {
		
		// 요청한 내용을 받아서 변수에 저장
		String writer = dto.getWriter();
		String title = dto.getTitle();
		String content = dto.getContent();

		//session.setAttribute("writer", writer);  // writer 에 string인 writer이 들어간다.
		
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
	public String userlistPage(Model model, HttpServletRequest req) {
								//jsp로 보내려면 model 전달인자로 필요
		
								/*  filter를 사용하면 아래처럼 불편하게 모두에 넣어주지 않아도됨!!!
								 * Boolean idLogon = (Boolean)req.getSession().getAttribute("isLogon"); if(
								 * isLogon == null || isLogon !=true) { return="login"; }
								 */
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
			List list=	dao.testIf(dto);
		
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
