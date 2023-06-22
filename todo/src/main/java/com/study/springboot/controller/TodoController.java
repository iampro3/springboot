package com.study.springboot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dto.TodoDTO;
import com.study.springboot.service.TodoService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class TodoController {

	@Autowired
	TodoService todoService;	
	
	@RequestMapping(value="/add.do", method=RequestMethod.GET)
	public String addPage(HttpServletRequest request) {
		String page = "todo/add";
		
		HttpSession session = request.getSession();
		
		// 로그인 상태 점검
		String login = (String)session.getAttribute("login");
		if(login == null || !"ok".equals(login)) {
			page = "user/login";
		} else {
			page = "todo/add";
		}
		
		return page;
	}

	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String add(
		@ModelAttribute
		TodoDTO todoDTO,
		HttpServletRequest request
	) {
		HttpSession session = request.getSession();
		
		// 로그인 상태 점검
		String login = (String)session.getAttribute("login");
		if(login == null || !"ok".equals(login)) {
			return "user/login";
		}
		
		System.out.println("todo : "+ todoDTO.getTodo());
		System.out.println("due_date : "+ todoDTO.getDue_date());
		
		int user_id = (int) session.getAttribute("user_id");
		System.out.println("user_id : "+ user_id);
		todoDTO.setUser_id(user_id);
		
		int result = todoService.addTodo(todoDTO);
		System.out.println("할일 추가 결과 : "+ result);
		
		return "redirect:/list.do";
	}
	
	@RequestMapping("/list_csr.do")
	public String list_csr() {
		return "todo/list_csr";
	}
	
	@RequestMapping(value="/api/todo", method=RequestMethod.GET)
	@ResponseBody
	public Map todoList(
			@RequestParam(value="pageNum", required=false)
			Integer pageNum,
			HttpServletRequest request
	) {
		TodoDTO todoDTO = new TodoDTO();
		
		System.out.println("pageNum : "+ pageNum);
		if(pageNum == null) {
			pageNum = 1;
		}
		
		String cpp = request.getParameter("countPerPage");
		int countPerPage = 10;
		try {
			
			countPerPage = Integer.parseInt(cpp); // 한 페이지당 표시 수
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		int startNum = ((pageNum-1) * countPerPage) + 1;
		int endNum = startNum + (countPerPage - 1);
		System.out.println("startNum : "+ startNum +", endNum : "+ endNum);
		
		todoDTO.setStartNum(startNum);
		todoDTO.setEndNum(endNum);
		
		Map map = todoService.list(todoDTO);
		List<TodoDTO> list = (List<TodoDTO>) map.get("list");
		int total = (int) map.get("totalCount");
		
		Map returnMap = new HashMap();
		returnMap.put("pageNum", pageNum);
		returnMap.put("countPerPage", countPerPage);
		returnMap.put("list", list);
		returnMap.put("total", total);
		
		return returnMap;
	}
	
	@RequestMapping("/list.do")
	public String list(
			Model model,
			
			@RequestParam(value="pageNum", required=false)
			// 파라메터 pageNum가 없는 경우
//			int pageNum, // int에 null 들어가지 못함
			Integer pageNum, // 정수이지만 null을 넣을 수 있는 타입
			
			HttpServletRequest request
	) {
		TodoDTO todoDTO = new TodoDTO();
		
		System.out.println("pageNum : "+ pageNum);
		if(pageNum == null) {
			pageNum = 1;
		}
//		int pageNum = 3; // 현재 페이지 번호
		
		String cpp = request.getParameter("countPerPage");
		int countPerPage = 10;
		try {
			
			countPerPage = Integer.parseInt(cpp); // 한 페이지당 표시 수
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		int startNum = ((pageNum-1) * countPerPage) + 1;
		int endNum = startNum + (countPerPage - 1);
		System.out.println("startNum : "+ startNum +", endNum : "+ endNum);
		
		todoDTO.setStartNum(startNum);
		todoDTO.setEndNum(endNum);
		
		request.setAttribute("pageNum", pageNum);
		model.addAttribute("countPerPage", countPerPage);
		
		Map map = todoService.list(todoDTO);
//		model.addAttribute("map", map);

		List<TodoDTO> list = (List<TodoDTO>) map.get("list");
		model.addAttribute("list", list);

		int total = (int) map.get("totalCount");
		request.setAttribute("total", total);
		
		return "todo/list";
	}

	@RequestMapping("/update.do")
	public String updatePage(
		@RequestParam("todo_id") int todo_id,
		Model model
	) {
		
		TodoDTO todoDTO = todoService.detailTodo(todo_id);
		
		model.addAttribute("dto", todoDTO);
		
		return "todo/update";
	}
	
	@RequestMapping("/update")
	public String update(
			@ModelAttribute TodoDTO todoDTO
	) {
		System.out.println("todoDTO.getUser_id() : "+ todoDTO.getUser_id());
		int updateResult = todoService.updateTodo(todoDTO);

		System.out.println("updateResult : "+ updateResult);

		return "redirect:/list.do";
	}

	@RequestMapping("/api/update")
	@ResponseBody
	public int update2(
			@RequestBody TodoDTO todoDTO
	) {
		System.out.println("todoDTO.getTodo_id() : "+ todoDTO.getTodo_id());
		System.out.println("todoDTO.getTodo() : "+ todoDTO.getTodo());

		int updateResult = todoService.updateTodo(todoDTO);
		System.out.println("updateResult : "+ updateResult);

		return updateResult;
	}
	
	@RequestMapping("/delete")
	public String delete(
			@ModelAttribute TodoDTO todoDTO
	) {
		int deleteResult = todoService.deleteTodo(todoDTO);
		System.out.println("deleteResult : "+ deleteResult);
		
		return "redirect:/list.do";
	}
}
