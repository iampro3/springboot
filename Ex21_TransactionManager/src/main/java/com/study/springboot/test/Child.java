package com.study.springboot.test;

public class Child extends Parent{
				// extends를 붙이면 Parent의 "print_x"를 가져다 쓸 수 있다.
	
	public void print_y(int y) {
		System.out.println("y : "+y);
	}
	
	// 부모에게 없는지 있는지 검사함 : 덮어쓰기 위해 부모객체에서 확인함
	@Override
	public void print_x(int x) {
		
		// 다형성 
		System.out.println("Child print_x : "+ x);
		System.out.println("Child print_x : "+ x);
	}
	
}
