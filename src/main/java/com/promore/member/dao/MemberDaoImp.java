package com.promore.member.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDaoImp implements MemberDao {
	
	 @Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int loginOk(String mem_id, String mem_password) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public String getPw(Map<String, Object> paramMap) {
		String value = (String) sqlSessionTemplate.selectOne("mem_passowrd", paramMap);
		return value;
	}
}
