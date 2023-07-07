package com.study.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface hotplaceDAO {
	
	List<Map> selectAllHot();
	Map selectAllHot2();

	// @param은 전달인자를 #{id}으로 쓸 수 있게 해 줌
	// 없는 경우,  #{param1} : 첫번째 전달 인자 #{args}
	//	
	Map selectHot(int hotplace_id);
//	Map selectHot(@Param("id") int hotplace_id);	
}
