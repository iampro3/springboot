package com.study.springboot;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.springboot.dao.ISimpleBbsDao;
import com.study.springboot.dto.SimpleBbsDto;

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
}
