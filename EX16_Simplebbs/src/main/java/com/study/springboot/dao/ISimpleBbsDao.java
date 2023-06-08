package com.study.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.SimpleBbsDto;

@Mapper // java와 xml, sql 을 연결시키는 문서 
public interface ISimpleBbsDao {
	
	List<SimpleBbsDto> listDao();
	
	SimpleBbsDto viewDao();
	
	// return값인 int는 실행 결과 영향을 받은 row 수 // 전달인자를 입력함
	int writeDao(String writer, String title, String content);
	int deleteDao();
	int updateDao();
}
