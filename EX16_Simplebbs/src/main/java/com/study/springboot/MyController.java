package com.study.springboot;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.springboot.dao.ISimpleBbsDao;
import com.study.springboot.dto.SimpleBbsDto;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MyController {
	
	@Autowired
	ISimpleBbsDao dao;

	@RequestMapping("/writeForm")
	public String writeForm() {
		return "writeForm";
	}
	
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
			n_id = Integer.parseInt("id");
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
		
		System.out.println("/modifyForm : id" + id);
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
}
