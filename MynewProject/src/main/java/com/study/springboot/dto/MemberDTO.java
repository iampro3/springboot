package com.study.springboot.dto;

public class MemberDTO {
//	String id;
	private String id;	// private로 설정하여야 하는데 설정하지 않은 경우에 구동 안 될 수 있다. 
	private String pw;
//	String name;
	private String name;
	private String phone;
	private String email;
	private String gender;
	private String birth;
	
	public String getId() {
		return id;
	}
	
	
	public void setId(String id) {
		System.out.println("id" + id);
		this.id = id;
	}

	public String getPw() {
		return pw;
	}
	
	
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}	
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}
	
	
	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}	
}

	
