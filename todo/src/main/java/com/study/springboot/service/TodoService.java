package com.study.springboot.service;

import java.util.List;

import com.study.springboot.dto.TodoDTO;

public interface TodoService {

	int addTodo(TodoDTO todoDTO);
	List<TodoDTO> list();
	
}