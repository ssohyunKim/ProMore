package com.promore.member.service;

import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

public interface MemberService {
	
	public void main(ModelAndView mav);
	
	public void memberLogin(ModelAndView mav);
	
	public void memberLoginOk(ModelAndView mav);
	
	public void memberLogout(ModelAndView mav);
	
	String getPw(Map<String, Object> paramMap);
}
