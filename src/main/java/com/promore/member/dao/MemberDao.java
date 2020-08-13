package com.promore.member.dao;

import java.util.Map;

public interface MemberDao {
	
	public int loginOk(String mem_id, String mem_password);	
	
	String getPw(Map<String, Object> paramMap);
}
