package com.promore.manager.service;

import org.springframework.web.servlet.ModelAndView;

public interface NoticeService {
	
	public void noticeWriteOk(ModelAndView mav);
	
	public void noticeList(ModelAndView mav);
	
	public void noticeLoad(ModelAndView mav);
	
}
