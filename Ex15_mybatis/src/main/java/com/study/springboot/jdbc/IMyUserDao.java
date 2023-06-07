package com.study.springboot.jdbc;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

// @Mapper : select도 하고, 클래스도 알아서 만들고 결과도 만들어준다.
@Mapper			// 	IMyUserDao가 myUSerDao.xml에서 읽힌다.
public interface IMyUserDao {
	/*db에 관한것은 dao에서 관리한다.*/
	
	// 메소드 생성 // 제네릭 //  myUSerDao.xml(db sql 파일의 데이터를 관리하고 sql 언어 생성한다.) 에서 id 불러오기.
	List<MyUserDTO> list();	// myUSerDao.xml 파일의 id(아래 : select id="list) 와 동일하게 맞춰주면 불러올 수 잇다.
							// <select id="list" resultType="com.study.springboot.jdbc.MyUserDTO">
							// 적어만 주면 메소드를 만들어줄 필요가 없다.
	
	//@Select("select sysdate from dual")
	//;
	
}
