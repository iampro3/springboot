package com.study.springboot.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.common.Const;
import com.study.springboot.dao.UserDAO;
import com.study.springboot.dto.UserDTO;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserDAO userDAO;
	
	@Override
	public int setUser(String id) {
		
		int result = userDAO.insertUser(id);
		
		return result;
	}

	@Override
	public List getUser() {
		List list = userDAO.selectUser();
		
		return list;
	}

	@Override
	public int modifyUser(String name) {
		int result = userDAO.updateUser(name);
		return result;
	}

	@Override
	public int deleteUser(UserDTO dto) {
		int result = userDAO.deleteUser(dto);
		return result;
	}

	@Override
	public int joinUser(UserDTO userDTO) {
		int result = -1;
		
		// id가 이미 있는지 검사
		int countId = userDAO.idCheck(userDTO);
		
		
		if(countId == 0) {
		// id가 중복되지 않았다면
			result = userDAO.joinUser(userDTO);
			// result에는 1(insert 성공), 0(insert 실패)
		} else {
		// id가 이미 존재한다면
			result = Const.CODE_JOIN_DUP_ID;
		}
		return result;
	}

	@Override
	public Map loginCheck(UserDTO userDTO) {
		int count = userDAO.loginCheck(userDTO);
		UserDTO dto = userDAO.selectUserInfo(userDTO);
		
		Map map = new HashMap();
		map.put("count", count);
		map.put("dto", dto);
		return map;
	}

}
