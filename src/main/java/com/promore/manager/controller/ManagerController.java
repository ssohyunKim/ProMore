package com.promore.manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.promore.aop.HAspect;
import com.promore.manager.dto.NoticeDto;

@Controller
public class ManagerController {
	
	@RequestMapping(value = "/manager/memberList.do", method = RequestMethod.GET)
	public ModelAndView memberList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("memberList.do");
		
		return new ModelAndView("/manager/memberList");
	}
	
	@RequestMapping(value = "/manager/noticeList.do", method = RequestMethod.GET)
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("noticeList.do");
		
		return new ModelAndView("/manager/noticeList");
	}
	
	@RequestMapping(value = "/manager/noticeWriteOk.do", method = RequestMethod.POST)
	public ModelAndView noticeWriteOk(HttpServletRequest request, HttpServletResponse response, NoticeDto noticeDto) {		
		System.out.println("noticeOk");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		
		HAspect.logger.info(HAspect.logMsg + noticeDto.toString());
		
		System.out.println(request.getParameter("notTitle"));
		
		ModelAndView mav = new ModelAndView("/manager/noticeWriteOk");
		mav.addObject("request", multipartRequest);
		//mav.addObject("noticeDto", noticeDto);
		
		//noticeService.noticeWriteOk(mav);
		
		int check = 1;
		mav.addObject("check", check);
		
		return mav;
	}	
	
	@RequestMapping(value = "/manager/reportList.do", method = RequestMethod.GET)
	public ModelAndView reportList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("reportList.do");
		
		return new ModelAndView("/manager/reportList");
	}
}
