package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.TodoDTO;

@Mapper
public interface TodoDAO {

	int insertTodo(TodoDTO todoDTO);
	List<TodoDTO> selectTodo();
}
