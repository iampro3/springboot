package com.study.springboot.jdbc;

public class MyUserDTO {
	private String id;
	private String name;
	
	// 마우스 우클릭 : source - > getter/setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}