package com.promore.customer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.promore.aop.HAspect;
import com.promore.customer.dto.CustomerDto;
import com.promore.customer.service.CustomerService;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService customerService;
	
	public CustomerController() {}

	public CustomerController(CustomerService customerService) {
		this.customerService = customerService;
	}

	public void setCustomerServicee(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	@RequestMapping(value = "/customer/inquireList.do", method = RequestMethod.GET)
	public ModelAndView customerBoardList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		customerService.customerBoardList(mav);
		return mav;		
	}
	
	@RequestMapping(value = "/customer/inquireWrite.do", method = RequestMethod.POST)
	public ModelAndView customerBoardWrite(HttpServletRequest request, HttpServletResponse response, CustomerDto customerDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("customerDto", customerDto);
		
		customerService.customerBoardWriteOk(mav);
		return mav;
	}
	
	@RequestMapping(value = "/customer/inquireDelete.do", method = RequestMethod.GET)
	public ModelAndView noticeBoardDelete(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		customerService.customerBoardDeleteOk(mav);
			
		return mav;		
	}
	
	@RequestMapping(value = "/customer/noticeList.do", method = RequestMethod.GET)
	public ModelAndView noticeBoardList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		return mav;		
	}
}
