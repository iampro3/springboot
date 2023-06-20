package com.study.springboot.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.springboot.common.Const;
import com.study.springboot.dto.UserDTO;
import com.study.springboot.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired 
	UserService userService;
	
	@RequestMapping("/")
	public String login(
//			@RequestParam("a") String a,
			Model model
			) {
		System.out.println("hello world");
		
//		model.addAttribute("han", a);
		
		return "user/login";
	}
	
	@RequestMapping("/test/insert")
	public String testInsert(
			@RequestParam("id") String id
	) {
		int result = userService.setUser(id);
		System.out.println("insert 결과 : "+ result);
		
		return "user/login";
	}
	
	@RequestMapping("/test/list")
	public String testList() {
		List list = userService.getUser();
		System.out.println("list 결과 : "+ list);
		return "user/login";
	}
	
	@RequestMapping("/test/update")
	public String testUpdate(
		HttpServletRequest request
	) {
		String name = request.getParameter("name");
		System.out.println("name : "+ name);
		
		int update_count = userService.modifyUser(name);
		System.out.println("update_count : "+ update_count);
		
		return "user/login";
	}

	@RequestMapping("/test/delete")
	public String testDelete(
//			@ModelAttribute("userDTO")
			@ModelAttribute
			UserDTO userDTO,
			Model model
	) {
//		model.addAttribute("userDTO", userDTO);
		
		System.out.println("userDTO.getName() : "+ userDTO.getName());
		
		int delete_count = userService.deleteUser(userDTO);
		System.out.println("delete_count : "+ delete_count);
		
		return "user/login";
	}
	
	@RequestMapping("/joinForm")
	public String joinForm() {
		return "user/joinForm";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(
		@ModelAttribute
		UserDTO userDTO,
		Model model
	) {
		int result = userService.joinUser(userDTO);
		System.out.println("회원 가입 : "+ result);
		
		if(result == Const.CODE_JOIN_DUP_ID) {
			model.addAttribute("message", "사용중인 아이디 입니다.");
			return "user/joinForm";
		}
		return "user/login";
	}
	
	
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "user/login";
	}
	
	@RequestMapping("/login")
	public String login(
		@ModelAttribute
		UserDTO userDTO,
		Model model,
		HttpServletRequest request
	) {
		System.out.println("/login "+ userDTO);
		
		
		Map map = userService.loginCheck(userDTO);
		
		int count = (int) map.get("count");
		UserDTO dto = (UserDTO) map.get("dto");

		System.out.println("count : "+ count);
		System.out.println("dto : "+ dto);
		
		
		if(count != 0) {
			// 계정 있음
			HttpSession session = request.getSession();
			session.setAttribute("login", "ok");
			if( dto != null ) {
				session.setAttribute("user_id", dto.getUser_id());
			}
		} else {
			// 계정 없음
			model.addAttribute("message", "계정을 확인해주세요");
		}
		
		return "user/login";
	}

	
}
