package com.study.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.TodoDAO;
import com.study.springboot.dto.TodoDTO;

@Service
public class TodoServiceImpl implements TodoService{

	@Autowired
	TodoDAO todoDAO;
	
//	@Override
//	public int addTodo(TodoDTO todoDTO) {
//		
//		int result = todoDAO.insertTodo(todoDTO);
//		return result;
//		
//	}

	
	// 할 일 목록 100 개 생성하는 for 문
	@Override
	   public int addTodo(TodoDTO todoDTO) {
//	      
      int result = 0; 
//	      for(int i=0; i<100; i++) {
//	         String old = todoDTO.getTodo();
	//         todoDTO.setTodo(old +"_"+ i);
//	         
	         todoDAO.insertTodo(todoDTO);
//	         
//	         todoDTO.setTodo(old);
//	      }
	      return result;	      
	   }

	@Override
	public List<TodoDTO> list() {
		List<TodoDTO> list = todoDAO.selectTodo();
		return list;
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
