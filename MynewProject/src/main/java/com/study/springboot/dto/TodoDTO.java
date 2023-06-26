package com.study.springboot.dto;

import java.sql.Date;

public class TodoDTO {

	private int todo_id;
	private String todo;
	private Date due_date; // 마감예정일
	private Date done_date; // 실제마감일
	private int user_id;
	private boolean checked; // false 기본값 - list.jsp 
	private String name;
	
	private int startNum;
	private int endNum;
	
	
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	public int getTodo_id() {
		return todo_id;
	}
	public void setTodo_id(int todo_id) {
		this.todo_id = todo_id;
	}
	public String getTodo() {
		return todo;
	}
	public void setTodo(String todo) {
		this.todo = todo;
	}
	public Date getDue_date() {
		return due_date;
	}
	public void setDue_date(Date due_date) {
		this.due_date = due_date;
	}
	public Date getDone_date() {
		return done_date;
	}
	public void setDone_date(Date done_date) {
		this.done_date = done_date;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "TodoDTO [todo_id=" + todo_id + ", todo=" + todo + ", due_date=" + due_date + ", done_date=" + done_date
				+ ", user_id=" + user_id + "]";
	}
	        // boolean 일 경우, isChecked 가 된다.
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
