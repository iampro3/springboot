package com.study.springboot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.TodoDAO;
import com.study.springboot.dto.TodoDTO;

@Service
public class TodoServiceImpl implements TodoService{

	@Autowired
	TodoDAO todoDAO;
	
	@Override
	public int addTodo(TodoDTO todoDTO) {
		
		int result = 0; 
		/*// 리스트에 목록 5개씩 추가 생성하기
		 * for(int i=0; i<5; i++) { String old = todoDTO.getTodo(); todoDTO.setTodo(old
		 * +"_"+ i);
		 */		
		result = todoDAO.insertTodo(todoDTO);
			
		/*
		 * todoDTO.setTodo(old); }
		 */		return result;		
	}

	@Override
	public Map list(TodoDTO todoDTO) {
		List<TodoDTO> list = todoDAO.selectTodo(todoDTO);
		int totalCount = todoDAO.totalCount();
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("totalCount", totalCount);
		
		return map;
	}

	@Override
	public TodoDTO detailTodo(int todo_id) {
		TodoDTO todoDTO = todoDAO.detailTodo(todo_id);
		return todoDTO;
	}

	@Override
	public int updateTodo(TodoDTO todoDTO) {
		return todoDAO.updateTodo(todoDTO);
	}
	
	@Override
	public int deleteTodo(TodoDTO todoDTO) {
		return todoDAO.deleteTodo(todoDTO);
	}

}
