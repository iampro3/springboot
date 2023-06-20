package com.study.springboot.test;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("test");

		// 클래스의 메소드  사용법
		Parent parent = new Parent(); // 메모리에 올려야 사용가능함 : 메모리에 올려놓음
		parent.print_x(15);
		// 위와 동일함
		(new Parent()).print_x(15);
		
		Child child = new Child(); // 메모리에 올려야 사용가능함 : 메모리에 올려놓음
		child.print_y(30);
		
		child.print_x(123);
		
		Parent child2 = (Parent) (new Child()); 
		Parent child3 = new Child(); // print_x만 있음
		
		child3.print_x(0);
		
		AnotherChild ac = new AnotherChild();
		ac.print_yy(1234);
		
		Parent ac1 =  new AnotherChild();
		ac1.print_x(22);
		
		Parent  p2= new Parent();
		test_print_x(p2,100);
		
		test_print_x(ac1,200);
		
		//Parent aac= (Parent) ac;
		test_print_x(ac,300);


		test_print_x(child,400);
		
		NeightHood nh = new NeightHood();
		//Parent ppp = (Parent) nh;  사용불가 접점이 없다.
		
		test_print_x(new Parent(),500);

		//하기도 가능 
//		test_print_x(new Parent(new A(new B())),500);
		
		System.out.println("---------");
		Parent p1 = new Child();
		p1.print_x(33);
		
		test_print_x(p1,44);
		
		//new manKind 사용불가
		Human h1 = new Human();
		h1.eat("점심식사");
		
		manKind h2 = (manKind) new Human();
		h2.eat(null);
		
		
		// *************중요 P.337 : 33번 줄*****************
		//Human class 없이 도 가능한 경우의 예시다.
		//**************익명구현객체(클래스)**************************
			//"manKind"는 구현자 
		manKind mankind = new manKind(){

			@Override
			public void eat(String food) {
			
				a(1,3);
				System.out.println("익명구현클래스 : "+ food);
			}
			//생성자를 구현한다.
			int a(int x, int y) {
				return x+y;
			}
			
		};
		mankind.eat("eat");
	}
	
	//Parent p만 상속받으면 사용 가능하다.
	static void test_print_x(Parent p,int x) {
		p.print_x(x);
	}
	
	
	//Parent p만 상속받으면 사용 가능하다.
//	Human 에서 implements로 human을 받아주지 않으면 아래처럼 받아줄 스 없다.
	//
	static void hotPlace(manKind p) {
		p.eat("asd");
	}
}
