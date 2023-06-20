package com.study.springboot.test;

public class Human implements manKind {

	@Override
	public void eat(String food) {
		System.out.println("food : "+ "먹는다");
		
	}
	
	//manKind를 구현해야 함
	public void sleep(int hour) {
		System.out.println("sleep : "+ "수면");
		
	}
}
