package com.promore.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyPageController {
	
	@RequestMapping(value = "/mypage/memberUpdate.do", method = RequestMethod.GET)
	public ModelAndView memberUpdate(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		ModelAndView mav = new ModelAndView("/mypage/memberUpdate");
		return mav;
	}
	
	@RequestMapping(value = "/mypage/myPage.do", method = RequestMethod.GET)
	public ModelAndView myPage(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		ModelAndView mav = new ModelAndView("/mypage/myPage");
		return mav;
	}
	
	
}
