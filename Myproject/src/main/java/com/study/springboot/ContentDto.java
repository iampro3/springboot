package com.study.springboot;

import lombok.Data;

// lombok 을 통해서 메소드(getter, setter 등등) 자동 생성

@Data
public class ContentDto {
	
	private int id;
	private String writer;
	private String content;
	
}
