package com.study.springboot.test;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

public class Drinktest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Drink earlgrey = new Drink();
		Drink milktea = new Drink();
		Drink blacktea = new Drink();
		Drink lemonginger = new Drink();
		
		earlgrey.title = "홍차";
		earlgrey.alc=20;
		
		milktea.title = "로열밀크티";
		milktea.alc=10;
		
		blacktea.title = "블랙티";
		blacktea.alc=2;
		
		lemonginger.title = "레몬차";
		lemonginger.alc=12;
		
		int[] alc = {20,10,2,12};
		
//		List alc2 = new ArrayList();
//		alc2.add(20);
//		alc2.add(2);
//		alc2.add(6);
//		alc2.add(15);
//		alc2.sort(null);
		
		List<Drink> list = new ArrayList<Drink>();
		list.add(earlgrey);
		list.add(milktea);
		list.add(blacktea);
		list.add(lemonginger);
		
//		list.sort(new Comparator() {
		//	Comparator c= new Comparator() {
//			@Override
//			public int compare(Object o1, Object o2) {
				
		//		int result =0;
//				Drink h1 = (Drink)o1; 
//				Drink h2 = (Drink)o2; 
//				if(h1.alc > h2.alc) {
//					result =1;
//				}else if(h1.alc == h2.alc) {
//					result =0;
//				}else if(h1.alc < h2.alc)
//					result =-1;
//				return h2.alc - h1.alc;
//			}
//			
//			return result; // -1, 0, 1이 들어올 수 있다.
		// 익명구현객체/클래스
		list.sort(new Comparator() {
	
				@Override
				public int compare(Object o1, Object o2) {
		
					Drink h1 = (Drink)o1; 
					Drink h2 = (Drink)o2; 
					return h2.alc - h1.alc;
			}
		}); 
		
		for(int i = 0; i<list.size();i++) {
			
			System.out.println(list.get(i).title + ", "+list.get(i).alc);
		//list.sort(c);
		}
	}
}
