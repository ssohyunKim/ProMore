package com.promore.member.dao;

import java.util.Map;

import com.promore.member.dto.MemberDto;

public interface MemberDao {
	
	public String loginOk(String memId, String memPassword);
		
	public String getPw(String memId, String memEmail);
	
	public MemberDto memberSelect(int memNum);
	
	public int memberUpdate(MemberDto memberDto);
}
