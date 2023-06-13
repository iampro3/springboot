package com.study.springboot.config;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/*"})	// 전부 거쳐 실행한다
//@WebFilter("/api/") : 8081/api 들만 실행하기로 함
//Ex16SimplebbsApplication 에 @ 추가하기
public class myFilter implements Filter {
	
	@Override
	public void doFilter(
			ServletRequest request,
			ServletResponse response,
			FilterChain chain)
			throws IOException, ServletException {  // 여기가지 인터페이스에 정의된 내용이다.
		
		System.out.println("Filter 동작");
		long start = System.currentTimeMillis();
		//인코딩 처리
		request.setCharacterEncoding("utf-8");
		
		//parameter 관련
		String title = request.getParameter("title");
/*		String title = request.getParameter("title"),.toString(),.indexOf("a");
*/		System.out.println("title : " + title);
		
		// **** 세션 관리 : 로그온이 되었을 때에만 글쓰기로 갈 수 있도록 만들어준다.
									//형변환 해줌
		HttpServletRequest httpReq = (HttpServletRequest) request;
		HttpSession session = httpReq.getSession();
		
		StringBuffer sb = httpReq.getRequestURL();
		String url = sb.toString();	// 버퍼가 줄어든다.
		System.out.println("getRequestURL : " + url);	// 8081/login 을 치면 전체 주소가 로그창에 나온다. Controller에서도 사용가능하다.
		
		String writer = null; // 밖으로 뺴줌 지역변수-> 전역변수화 함
		
		// ********* login 이 아래 하나면 끝난다.
		// login에서 세션 없으므로 list에서 글쓰기 못한다.
		try {
								//형변환 해줌
			Boolean isLogon = (Boolean) session.getAttribute("isLogon"); // null을 담을 수 있다. true/false는 사용할 수 없다.							
			System.out.println("isLogon :" + isLogon);
								//	형변환 해줌
//			boolean isLogon = (boolean) session.getAttribute("isLogon"); // null을 담을 수 없다.	
							//	형변환 해줌
			//writer = (String)session.getAttribute("writer");
			// writer가 null이 아니면 글쓰기로 가기
			
			if(url.indexOf("/login") == -1 ) { //-1은 글씨가 없다. 즉 로그인이 아니라면 / != -1 로그인 이라면
				//마침내 Controller까지 보내기 시작
				chain.doFilter(request, response);		
			}else {			
			if(isLogon == null || isLogon !=true) {
				HttpServletResponse resp = (HttpServletResponse)response;
				resp.sendRedirect("/login");
			}
			else {
				//마침내 Controller까지 보내기 시작
				chain.doFilter(request, response);						
				}		
			}							
		}catch (Exception e) {
			System.out.println("boolean에 null이 들어가면 예외");
			e.printStackTrace();
		}	


//		System.out.println("***********");	
//		//		여기가지 들어오는 영역
//		//**************************************
//		//**************************************		
//		// 밖으로 나가기 직전 영역
//		System.out.println("Filter 동작완료");
		
		long end = System.currentTimeMillis();
//		System.out.println("걸린시간 : " + (end - start)+"[ms]";
	}
}
