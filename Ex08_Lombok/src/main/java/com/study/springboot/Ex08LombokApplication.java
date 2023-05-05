package com.study.springboot;

import java.util.Map;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Ex08LombokApplication {

	public static void main(String[] args) {
		SpringApplication.run(Ex08LombokApplication.class, args);
		
		/*
		 * Member m = new Member(); Member m2 =m;
		 * 
		 * Map<K, V> map = new HashMap(); map.put("key", "value"); // map.put("key",
		 * "v1"); //위에 있는 value값이 그대로 v1에 들어온다.
		 * 
		 * map.put("m", map); map.put("m", map); System.out.println(m);
		 */
	}

}
