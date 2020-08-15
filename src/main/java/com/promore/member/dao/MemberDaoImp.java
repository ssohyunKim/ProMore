package com.promore.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.promore.aop.HAspect;
import com.promore.member.dto.MemberDto;

@Component
public class MemberDaoImp implements MemberDao {
	
	 @Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public MemberDto loginOk(String memId, String memPassword) {
		HashMap<String, String> hmap = new HashMap<String, String>();
		
		HAspect.logger.info(HAspect.logMsg + memId +" : "+ memPassword);
		
		hmap.put("memId", memId);
		hmap.put("memPassword", memPassword);
		return sqlSessionTemplate.selectOne("member_login", hmap);
	}
	
	@Override
	public String getPw(String memId, String memEmail) {
		HashMap<String, String> hmap = new HashMap<String, String>();
		
		HAspect.logger.info(HAspect.logMsg + memId + "\t" + memEmail);
		
		hmap.put("memId", memId);
		hmap.put("memEmail", memEmail);
		return sqlSessionTemplate.selectOne("member_password", hmap);
	}
	
	@Override
	public MemberDto memberSelect(int memNum) {
		return sqlSessionTemplate.selectOne("member_select", memNum);
	}
	
	@Override
	public int memberUpdate(MemberDto memberDto) {
		return sqlSessionTemplate.update("member_update", memberDto);
	}
}
