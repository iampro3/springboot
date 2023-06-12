package com.study.springboot.dto;

public class SimpleBbsDto {
	
	//hashmap을 사용해도 되는데
	//hashmap은 아무나 들어오므로
	//DTO를 설정해서 아래 허락된 인원만 들어오도록 한다.
	private int id;
	private String writer;
	private String title;
	private String content;
	private String[] chk;	// chk box
	
	public String[] getChk() {
		return chk;		// mycontroller : list_chk = dto.getChk();
	}
	public void setChk(String[] chk) {
		this.chk = chk;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
