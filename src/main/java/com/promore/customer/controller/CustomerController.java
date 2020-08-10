package com.promore.customer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CustomerController {
		
	@RequestMapping(value = "/customer/inquire.do", method = RequestMethod.GET)
	public ModelAndView customerInquire(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		ModelAndView mav = new ModelAndView("customer/inquire");
		return mav;
	}
	
	@RequestMapping(value = "/customer/notice.do", method = RequestMethod.GET)
	public ModelAndView customerNotice(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");

		ModelAndView mav = new ModelAndView("customer/notice");
		return mav;
	}
	
	@RequestMapping(value = "/customer/modify.do", method = RequestMethod.GET)
	public ModelAndView customerModify(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		ModelAndView mav = new ModelAndView("customer/modify");
		return mav;
	}
}
