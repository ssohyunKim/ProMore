package com.promore.member.dao;

import java.util.Map;

import com.promore.member.dto.MemberDto;

public interface MemberDao {
	
	public int loginOk(String mem_id, String mem_password);	
	
	String getPw(Map<String, Object> paramMap);
	
	public MemberDto memberSelect(int memNum);
	
	public int memberUpdate(int memNum);
}
