package com.promore.customer.service;

import org.springframework.web.servlet.ModelAndView;

public interface CustomerService {

	public void customerBoardWriteOk(ModelAndView mav);

	public void customerBoardList(ModelAndView mav);

	public void customerBoardDeleteOk(ModelAndView mav);
	
}
