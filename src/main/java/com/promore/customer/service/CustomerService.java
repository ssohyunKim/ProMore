package com.promore.customer.service;

import org.springframework.web.servlet.ModelAndView;

public interface CustomerService {

	public void customerBoardWriteOk(ModelAndView mav);

	public void customerBoardList(ModelAndView mav);

	public void customerBoardDeleteOk(ModelAndView mav);

	public void customerBoardUpdateOk(ModelAndView mav);

	public void noticeBoardList(ModelAndView mav);
	
	public void noticeBoardUpdateCount(ModelAndView mav);
}
