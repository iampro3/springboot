package com.study.springboot;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.springboot.Dto.SimpleBbsDto;

public class MyController {
	
	@RequestMapping("/writeForm")
	public String writeForm() {
		return "writeForm";
	}

	@RequestMapping("/write")
	public String write(
			
	@ModelAttribute SimpleBbsDto dto
		) {
		
		String writer = dto.getWriter();
		String title = dto.getTitle();
		String content = dto.getContent();
		
		System.out.println("writer :" + writer);
		System.out.println("title :" + title);
		System.out.println("content :" + content);
		
		return "writeForm";
	}
}
