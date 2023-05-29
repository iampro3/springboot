package com.study.springboot.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dto.ShopDTO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ShopController {
	
	public ShopController() {
		System.out.println("ShopController 생성");
	}
	
	List<String> list = new ArrayList();

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
	public String print(
				HttpServletRequest request,
				
				// 들어올때 필수; 없으면 400 bad request
				@RequestParam("id") String id2,
				
				// 필수 아님
				@RequestParam(value="id", required=false) String id3,
				
				Model model
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
		
		////////////////////////////////////////////////
		// 내보내기
		////////////////////////////////////////////////
		model.addAttribute("req_id", id);
		
		list.add(id);
		model.addAttribute("list_id", list);
		for(int i=0; i<list.size(); i++) {
			System.out.println( i +"번째 id : "+ list.get(i) );
		}
		
		request.setAttribute("req_id2", id);
		request.setAttribute("text", "abcde");
		request.setAttribute("m", model);
		
		String req_id2 = (String) request.getAttribute("req_id2");
		System.out.println("req_id2 : "+ req_id2);
		
		return "view";
	}
	
	@RequestMapping("/input")
	public String input() {
		return "input";
	}
	
	// get으로 전달하는것
	// post로 전달하는것 : @RequestBody
	@RequestMapping("/getBagList")
	@ResponseBody
	public List getBagList(int count) {
		List list_item = new ArrayList();
		
		Map info = new HashMap();
		info.put("img_src", "//image.msscdn.net/images/goods_img/20230401/3199783/3199783_16844763299344_320.jpg");
		info.put("name", "보테가베네타");
		info.put("desc", "여성 카세트 크로스백 - 패러킷");
		info.put("price", "1,308,000");

		info = new HashMap();
		info.put("img_src", "//image.msscdn.net/images/goods_img/20230401/3199783/3199783_16844763299344_320.jpg");
		info.put("name", "보테가베네타");
		info.put("desc", "여성 카세트 크로스백 - 패러킷");
		info.put("price", "1,308,000");
		
		
		for(int i=0; i < count; i++) {
			list_item.add(info);
		}
				
		return list_item;
	}
	
	@RequestMapping("/js_store")
	public String js_store() {
		return "js_store";
	}
	
	@RequestMapping("/send2")
	@ResponseBody
		 // return 타입과 동일하게 변경 List	
	public List send2(
	//public String send2(
			@RequestParam Map paramMap,	// Map을 이용하는 방법; 전부 받아줌
			
			// 주소의 query string('?' 이후에 key=value) 형태를 받음
			@ModelAttribute ShopDTO shopDTO,

			// post방식으로 json을 받음
			@RequestBody ShopDTO shopDTO2
			) {
		System.out.println("/send2 진입");
		
		System.out.println("paramMap : "+ paramMap);
		System.out.println(shopDTO);
		System.out.println(shopDTO2);
		
		List list = getBagList(shopDTO2.getCount());
		return list;
	}
	
	@RequestMapping("/cookie")
	public String cookie(HttpServletRequest request, // 요청에 관한 모든 것
						HttpServletResponse reponse// 응답에 관한 모든 것. 브라우저까지 전송함 : reponse에 담아서 보내도 된다.
													// model은 jsp까지만 전송된다. jsp가 java로 바뀐다.
			) {
		//쓰기
		Cookie cookie = new Cookie("popup3", "ks:나");
		cookie.setMaxAge(10);//단위 :초
		// 브라우저에 돌려주기 : 일반적으로 모델에 담았음
		cookie.setPath("/");//단위 :초
		reponse.addCookie(cookie);
		
		//읽기
		Cookie[] cookies = request.getCookies();
		
		for (Cookie c: cookies) {
			System.out.println("c:"+c);
			System.out.println("c.getName():"+c.getName());
			System.out.println("c.getValue():"+c.getValue());
		}
		
		//HttpSession session = request.getSession();
//		if(id, pw 같을 때,) {
//			session.setAttribute("isLogin', true);
//		}
//		
//		if(session.getAttribute("isLogin")!= null)
//			&& (boolean) session.getAttribute("isLogin") == 
//		{   System.out.println("login 되었습니다.");
//		}
//		else {
//			System.out.println("c.getName():"+c.getName());
//		}		
		
		return "cookie";	// 자바스크립트에서 쿠키 출력
	}
	
}


















