package com.study.springboot.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.springboot.dao.hotplaceDAO;
import com.study.springboot.dto.UserDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HotplaceController {
	
	// 생성자
	HotplaceController(){}
	// 필드=클래스 전체에서 사용할 수 있는 변수
	int a = 10;
	
	@Autowired
	hotplaceDAO hotplaceDAO;
	
	/*
	 * 뭘 만들껀지
	 * 뭘 전달받을지
	 * 뭘 돌려줄지
	 */
	@RequestMapping("/test1")
	public void test1() {
		System.out.println("hello world");
	}

	// test2.jsp를 호출
	@RequestMapping("/test2")
	public String test2() {
		System.out.println("여기는 /test2");

		String page = "test2";
		return page;
	}
	
	// html-java 값을 전달 test
	// html의 id값을 출력
	@RequestMapping("/loginCheck")
	public String loginCheck(
		HttpServletRequest request,
		Model model
	) {
		System.out.println("여기는 /loginCheck");

		String id = request.getParameter("id");
		System.out.println("id : ["+ id +"]");
		
		String pw = request.getParameter("pw");
		if(pw == null) {
			System.out.println("정상적인 경로로 접근해주세요");
		}
		System.out.println("pw : ["+ pw +"]");
		
		// ---- 여기까지는 들어온 것 처리하는곳
		
		// ---- 이제부터는 나가는 것 처리
		// 기본이 forward 방식이라서 request가 jsp로 그대로 전달됨
		model.addAttribute("key", "value2");
		request.setAttribute("key", "value");
		
		// Model에 담아서 보낼 수 있다
		model.addAttribute("pw", pw);
		
		String page = "main/main";
		return page;
	}
	
	// 전달인자에 @ 모음집
	@RequestMapping("/paramTest/{key}/fix/{key2}/view")
	@ResponseBody // jsp로 보내지 않고 String 그 자체나 json같은 걸로 내보냄
	public void paramTest(
		HttpServletRequest request,
		Model model,
		Locale locale,	// 언어 정보
		
		// 단, id가 null일 경우 400에러 발생
		@RequestParam("id") String id, // String id = request.getParameter("id");
		@RequestParam(value="id", required=true) String id2, // 윗것과 똑같음
		@RequestParam(value="id", required=false) String id3, // null 허용
		@RequestParam Map map, // 뭐가 넘어오던 map에 key, value로 담아줌
		
		@ModelAttribute UserDTO dto, // 주소의 ?id=value&pw=v 이걸 한번에 처리해줌
		UserDTO dto2,	// @ModelAttribute 생략 가능
		
		// 보통 ajax에서 json으로 보낸것 처리할때 사용
		@RequestBody UserDTO dto3, // post로 넘어온 내용을 한번에 처리
		
		@PathVariable("key") String key,	// 주소에 key에 해당하는 글씨를 얻어옴
		@PathVariable("key2") String key2
	) {
		
	}
	
	// method get이나 put만 진입할 수 있음
	// post같은게 오면 403 에러
	@RequestMapping(value="/redirect", method= {RequestMethod.GET, RequestMethod.PUT})
	
	// 이렇게 줄여 쓸 수 있다
//	@GetMapping("/redirect") 	// get방식만 쓰고 싶은 경우 // Read(select)
//	@PostMapping("/redirect")	// Create(insert)
//	@PutMapping("/redirect")	// Update
//	@DeleteMapping("/redirect") // Delete // 이렇게 나눠 쓰는걸 REST, RESTful, REST api
	public String redirect() {
//		return "test2";	// jsp로 forward한다
//		// forward의 특징
//		// request, response를 전달
//		// 주소의 변화가 없음
		
		return "redirect:/test2"; // sendRedirect
		// request, model 사라짐
		// 주소도 /test2 바뀜
	}
	
	@RequestMapping("/hotplace")
	public String hotplaceList() {
		
		// map or dto 가능
		// 담는다 ㅣ 한 줄의 내용을 key, value 또는 setter에 양식
		// 자료가 없는 경우 null
		Map map = hotplaceDAO.selectAllHot2();
		System.out.println("map : " + map);
		
		// map 또는 dto를 list에 차곡차곡 담는다.
		List list = hotplaceDAO.selectAllHot();
		System.out.println("/hotplace list : " + list);
		
		int hotplace_id = 4;
		Map map2 = hotplaceDAO.selectHot(hotplace_id);
		System.out.println("map2" + map2);
		
		return "test2";
	}
}






