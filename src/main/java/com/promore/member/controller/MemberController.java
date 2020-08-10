package com.promore.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@RequestMapping(value = "/member/register.do", method = RequestMethod.GET)
	public ModelAndView memberList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		ModelAndView mav = new ModelAndView("member/register");
		return mav;
	}
}
