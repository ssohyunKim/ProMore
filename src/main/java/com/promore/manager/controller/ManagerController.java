package com.promore.manager.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.promore.manager.dto.NoticeDto;
import com.promore.manager.service.ManagerService;

@Controller
public class ManagerController extends MultiActionController {
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping(value = "/manager/memberList.do", method = RequestMethod.GET)
	public ModelAndView memberList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("memberList.do");
		
		ModelAndView mav = new ModelAndView("/manager/memberList");
		mav.addObject("request", request);
		managerService.memberList(mav);
		
		return mav;
	}
	
	@RequestMapping(value = "/manager/noticeList.do", method = RequestMethod.GET)
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("noticeList.do");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		managerService.noticeList(mav);
		
		return mav;
	}
	
	@RequestMapping(value = "/manager/noticeWriteOk.do", method = RequestMethod.POST)
	public ModelAndView noticeWriteOk(HttpServletRequest request, HttpServletResponse response, NoticeDto noticeDto) {		
		System.out.println("noticeWriteOk.do");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", multipartRequest);
		mav.addObject("noticeDto", noticeDto);
		
		managerService.noticeWriteOk(mav);
		
		return mav;
	}
	
	@RequestMapping(value = "/manager/noticeUpdateOk.do", method = RequestMethod.POST)
	public ModelAndView noticeUpdateOk(HttpServletRequest request, HttpServletResponse response, NoticeDto noticeDto) {		
		System.out.println("noticeUpdateOk.do");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", multipartRequest);
		mav.addObject("noticeDto", noticeDto);
		
		managerService.noticeUpdateOk(mav);
		
		return mav;
	}
	
	@RequestMapping(value = "/manager/fileDownload.do", method = RequestMethod.GET)
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) {		
		System.out.println("fileDownload.do");

		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		
		managerService.fileDownload(mav);
	}
	
	@RequestMapping(value = "/manager/noticeDeleteOk.do", method = RequestMethod.GET)
	public ModelAndView noticeDelete(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("noticeDeleteOk.do");
		
		ModelAndView mav = new ModelAndView("manager/noticeDeleteOk");
		mav.addObject("request", request);
		
		managerService.noticeDelete(mav);
		
		return mav;
	}
	
	@RequestMapping(value = "/manager/reportList.do", method = RequestMethod.GET)
	public ModelAndView reportList(HttpServletRequest request, HttpServletResponse response) {
		//System.out.println("reportList.do");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		managerService.reportList(mav);
		
		return mav;
	}
	
	@RequestMapping(value = "/manager/memberDeleteOk.do", method = RequestMethod.GET)
	public ModelAndView memberDelete(HttpServletRequest request, HttpServletResponse response) {
		//System.out.println("memberDeleteOk.do");
		
		ModelAndView mav = new ModelAndView("manager/memberDeleteOk");
		mav.addObject("request", request);
		managerService.memberDelete(mav);
		 
		return mav;
	}
	
	
}
