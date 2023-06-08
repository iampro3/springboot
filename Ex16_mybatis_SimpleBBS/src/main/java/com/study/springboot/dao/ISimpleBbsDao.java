package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.Dto.SimpleBbsDto;

@Mapper
public interface ISimpleBbsDao {
		//제네릭 : <>여기에 들어가는 애를 제어하는 역할 : 인터페이스를 사용할 때 변수처럼 사용할 수 있고, 
	    // return 타입 자체를 제네릭에 맞춰 사용할 수 있다.
		//
	List<SimpleBbsDto> listDao();
	
	SimpleBbsDto viewDao();
	
	// 쓰기업뎃 지우기는 int 밖에 못 온다.
	// return 값은 int 실행결과 영향을 받은 row의 수
	int writeDao();
	int deleteDao();
	int updateDao();
}
