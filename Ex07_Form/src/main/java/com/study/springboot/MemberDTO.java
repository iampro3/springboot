package com.study.springboot;

public class MemberDTO {
	private String id;	// private로 설정하여야 하는데 설정하지 않은 경우에 구동 안 될 수 있다. 
//	String id;
	private String name;
//	String name;
	private String pw;
	private String birth;
	private String gender;
	private String email;
	private String phone;
	
	public String getId() {
		return id;
	}
	
	
	public void setId(String id) {
		System.out.println("id" + id);
		this.id = id;
	}

	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
}

	
