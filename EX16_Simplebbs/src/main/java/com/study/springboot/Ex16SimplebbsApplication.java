package com.study.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class Ex16SimplebbsApplication {

	public static void main(String[] args) {
		SpringApplication.run(Ex16SimplebbsApplication.class, args);
	}

}
