package com.promore.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.promore.member.dto.MemberDto;
import com.promore.member.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/member/register.do", method = RequestMethod.GET)
	public ModelAndView memberList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("register.do");

		return new ModelAndView("member/register");
	}

	@RequestMapping(value = "/member/registerOk.do", method = RequestMethod.POST)
	public String registerOk(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("registerOk.do");

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		memberService.memberRegister(mav);

		return "redirect:../../" + request.getContextPath();
	}

	@RequestMapping(value = "/member/loginOk.do", method = RequestMethod.POST)
	public ModelAndView loginOk(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("loginOk.do");

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		memberService.memberLoginOk(mav);
		
		return mav;
	}

	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("logout.do");
		
		return new ModelAndView("member/logout");
	}

	@RequestMapping(value = "/member/forgot-password.do", method = RequestMethod.GET)
	public ModelAndView forgotPassword(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		return new ModelAndView("member/forgot-password");
	}

	@RequestMapping(value = "/member/sendPw.do", method = RequestMethod.GET)
	public ModelAndView sendEmail(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("OK1");

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		memberService.sendEmail(mav);

		return mav;
	}

	@RequestMapping(value = "/member/memberUpdate.do", method = RequestMethod.GET)
	public ModelAndView memberUpdate(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("memberUpdate.do");

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);

		memberService.memberUpdate(mav);

		return mav;
	}

	@RequestMapping(value = "/member/memberUpdateOk.do", method = RequestMethod.POST)
	public ModelAndView memberUpdateOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto) {
		System.out.println("memberUpdateOk.do");

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);

		memberService.memberUpdateOk(mav);

		return mav;
	}

}
