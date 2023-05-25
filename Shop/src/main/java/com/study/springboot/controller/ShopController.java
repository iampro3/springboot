package com.study.springboot.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ShopController {
	
	public ShopController (){
		System.out.println("ShopController 생성"); // 생성자를 확인해보자.
	}
	
	List<String>  list = new ArrayList();
	/**
	 * 브라우저에서 전달한 값을 출력만
	 */
	@RequestMapping("/send1") // 모든 method를 받을 수 있음
//	@RequestMapping(value="/send1") // 위와 같음
//	@RequestMapping(value="/send1", method=RequestMethod.GET)
//	@GetMapping("/send1")// 위와 같음
//	@RequestMapping(value="/send1", method={RequestMethod.GET, RequestMethod.POST})
	// get이 아닌 method로 들어오면 405 method not allowed
//	@PostMapping("/send1")

//	public @ResponseBody String print( // String 대신 Map 이면 Jsonn파일
//	@ResponseBody public  String print( // String 대신 Map 이면 Json파일
	
	public String print( // String 대신 Map 이면 Json파일
				HttpServletRequest request,
				
				// 들어올때 필수; 없으면 400 bad request
				@RequestParam("id") String id2,
				
				// 필수 아님
				@RequestParam(value="id", required=false) String id3,
				
				Model model // class-불변:변수-가변
			) {
		
		// id에 해당하는 내용을 전달받아
		// 변수에 저장한다
		
		// 전달받은 key값 중에서 첫번째것 하나만 가져옴
		String id = request.getParameter("id"); // querySelector처럼
		String[] ids = request.getParameterValues("id"); // querySelectorAll처럼
		
		
		
		System.out.println("id : "+ id);
		System.out.println("id2 : "+ id2);
		System.out.println("id3 : "+ id3);
		for(String value : ids) {
			System.out.println("ids : "+ value);
		}
		
		// 내보내기 part
		model.addAttribute("req_id", id); //  이 구문은 id를 jsp에 보낼 수 있따.
		
		list.add(id);	// list를 쌓고 있음
		model.addAttribute("list_id", list); //  model에 담음
		for(int i =0; i<list.size();i++) {
			System.out.println(i +"번째 id : "+ list.get(i));
		}
		
		request.setAttribute("req_id2", id); 
		request.setAttribute("text", "abcd"); 
		request.setAttribute("m", model); 
		
		String req_id2= (String) request.getAttribute("req_id2");
		
		System.out.println("req_id2 :" +req_id2 );
		return "view";
		
//		return "redirect:/view";
//		return "<h1>a</h1>"; // MVC 패턴 jsp에 맡기겠따.
		/*
		 * return null;
		 */	}
	
	
	@RequestMapping("/input")
			public String input(){
		return "input";
	}
	
	@RequestMapping("/getBagList")
	@ResponseBody
	public String getBagList(){
		
		List list_item = new ArrayList();
		Map info = new HashMap();
		
		info.put("img_src","//image.msscdn.net/images/goods_img/20230401/3199783/3199783_16844763299344_320.jpg");
		info.put("name","보테가베네타");
		info.put("desc","여성 카세트 크로스백 - 패러킷");
		info.put("price","1,308,000");
		
		info = new HashMap();
		
		info.put("img_src","//image.msscdn.net/images/goods_img/20230401/3199783/3199783_16844763299344_320.jpg");
		info.put("name","보테가베네타");
		info.put("desc","여성 카세트 크로스백 - 패러킷");
		info.put("price","1,308,000");
		
		list_item.add(info);
		list_item.add(info);
		list_item.add(info);
		 
		 return list_item;
	}
}
