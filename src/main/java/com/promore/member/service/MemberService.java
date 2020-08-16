package com.promore.member.service;

import org.springframework.web.servlet.ModelAndView;

public interface MemberService {	
	
	public void memberLoginOk(ModelAndView mav);
	
	public void memberUpdate(ModelAndView mav);
	
	public void memberUpdateOk(ModelAndView mav);
	
	public void sendEmail(ModelAndView mav);
	
	public void memberRegister(ModelAndView mav);

	public void memberDeleteOk(ModelAndView mav);

	public void memberDelete(ModelAndView mav);
}
