package com.promore.member.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.promore.member.dto.MemberDto;

@Component
public class MemberDaoImp implements MemberDao {
	
	 @Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int loginOk(String memId, String memPassword) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public String getPw(Map<String, Object> paramMap) {
		String value = (String) sqlSessionTemplate.selectOne("mem_password", paramMap);
		return value;
	}
	
	@Override
	public MemberDto memberSelect(int memNum) {
		return sqlSessionTemplate.selectOne("member_select", memNum);
	}
	
	@Override
	public int memberUpdate(int memNum) {
		return sqlSessionTemplate.update("member_update");
	}
}
