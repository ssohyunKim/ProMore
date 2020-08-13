package com.promore.member.dao;

import java.util.Map;

import com.promore.member.dto.MemberDto;

public interface MemberDao {
	
	public String loginOk(String memId, String memPassword);
		
	String getPw(Map<String, Object> paramMap);
	
	public MemberDto memberSelect(int memNum);
	
	public int memberUpdate(int memNum);

}
