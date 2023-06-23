package com.study.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class ReplyApplication {

	public static void main(String[] args) {
		SpringApplication.run(ReplyApplication.class, args);
	}

}
