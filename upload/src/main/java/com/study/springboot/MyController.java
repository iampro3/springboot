package com.study.springboot;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MyController {

	@RequestMapping("/uploadForm")
	public String uploadForm() {
		String path= "c:/file";	// 상위폴더로 하면 목록이 모두 호출된다.
		getFiles(path); // getFiles 함수를 여기서 호출함
		return "fileForm";		
	}
	
	void getFiles(String path) {
				
		File file = new File (path);
		// 실제 파일이나 디렉토리가 있는지 검사 필요
		
		//파일이나 디렉토리 목록들을 텍스트로 추출하기
		String[] files = file.list();
//		 File 객체로 가져오기
		File[] listFiles = file.listFiles();
		
		for(int i=0; i<listFiles.length; i++) {
			File tempFile = listFiles[i];
			if(tempFile.isDirectory()) {
				System.out.println("폴더이고 이름은 :" + tempFile.getName());
				System.out.println("폴더이고 이름은 :" + tempFile.getPath());
				
				// 재귀호출 : 내가 나를 다시 부르기
				getFiles(tempFile.getPath());
			}else {
				System.out.println("파일이고");
				System.out.println("이름 :" + tempFile.getName());
				System.out.println("크기 :" + tempFile.length());
				System.out.println("경로 :" + tempFile.getPath());
			}
		}
	}
	
	@RequestMapping("/uploadOk")
	@ResponseBody	// upload 하면 success,실패하면 fail
	public String uploadOk(
			@RequestParam("filename") 
			MultipartFile multipartFile
			) {
		try {
			// 방어
			// filename이 비어있는지 확인
			if( multipartFile.isEmpty() ) {
				return "need file";
			}
			
			// 절대 주소; 단, 다른 pc에서는 다른 경로일 수 있다
			String path = "c:/file/upload";
			
			// 디렉토리를 확인하고, 있다면  msg 출력하고, 없다면 생성하라.
			File dir = new File(path);	
			
			if(dir.exists()) { // 존재하느냐?
				System.out.println(path +" : 디렉토리가 존재합니다.");
			} else {
				boolean isMake = dir.mkdir();
				if( isMake ) {
					System.out.println(path +" : 디렉토리를 생성했습니다.");
				} else {
					System.out.println(path +" : 디렉토리를 생성에 실패했습니다.");
				}
			}
			
			
			// 상대적인 주소 classpath를 이용하는 방법
//			String path = ResourceUtils.getFile("classpath:static/upload").toPath().toString();
			
			String fileName = multipartFile.getOriginalFilename();
			long now = System.currentTimeMillis();
			fileName = now +"_"+ fileName;
			System.out.println("fileName : "+ fileName);
			
			// file 객체 만들기
			System.out.println(path +File.separator+ fileName);
			File file = new File( path +File.separator+ fileName );
			
			// 그 file 객체에 덮어쓰기
			FileUtils.writeByteArrayToFile(file, multipartFile.getBytes());
			
		}catch(Exception e) {
			e.printStackTrace();
			return "fail";
		}
		
		return "success";
	}
	
		@RequestMapping("/download")
		@ResponseBody
		public String download(
				HttpServletResponse response
				) {
			
//			download받는 파일
			String repo = "c:/file/upload/";
			String fileName = "1.png";			
			try {
			
			
				File file = new File(repo + fileName);
				
				// 읽는 것이니 InputStream을 열어서 실제 파일을 메모리에 로딩함				
				FileInputStream is = new FileInputStream(file);	
				// 브라우저가 전달받은 내용을 파일로 인식하게 만듦
				response.setHeader("Content-disposition", "attachment; fileName=" + fileName);
//				response.setHeader("Content-disposition", "attachment; fileName="+"b.txt");
				// 브라우저가 캐쉬를 사용하지 않도록 / 매번 다운로드 되도록 설정한다. 
				response.addHeader("Cash-Control", "no-cache");
				// 열었으면 닫아주기. 메모리를 절약하기 위해서 
				
				// 파일을 내보낼 수 있는 흐름을 열어서 준비
				OutputStream out = response.getOutputStream();
				
				byte[] buffer = new byte[4*1024]; // 4kb 씩 파일을 쪼개서 전송한다.
				
				while(is.read(buffer )!=-1) {
				//아래와 동일한 구문이다.				
//				while(true) {					
					// inputStream에서 buffer만큼 읽어서
					int count = is.read(buffer);
					System.out.println("읽은 크기 : " + count);
					
					if(count== -1) {
						break;
					}
					out.write(buffer, 0, count); // 처움부터 읽어라. : 0				
				}
				
				is.close();
				out.close();
			}
			catch (Exception e) {
	
				e.printStackTrace();
			}					
			
			return "success";
		}
	}

