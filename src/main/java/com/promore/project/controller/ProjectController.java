package com.promore.project.controller;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.promore.aop.HAspect;
import com.promore.customer.dto.CustomerDto;
import com.promore.project.dto.ProjectDto;
import com.promore.project.service.ProjectService;

@Controller
public class ProjectController {
	@Autowired
	private ProjectService projectservice;
	
	
	@RequestMapping(value = "/project/main.do", method = RequestMethod.GET)
	public ModelAndView projectMain(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("request",request);
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("id");
		 System.out.println("mainid" + id); 
		mav.addObject("aplMemId", id);
		
		projectservice.projectList(mav);
		projectservice.projectCnt(mav, id); 
		return mav;
	}

	// 프로젝트 작성 완료
	@RequestMapping(value = "/project/writeOk.do", method = RequestMethod.POST)
	public ModelAndView projectWriteOk(HttpServletRequest request, HttpServletResponse response, ProjectDto projectDto) {
		ModelAndView mav = new ModelAndView(); 
		HttpSession session = request.getSession(); 
		String aplMemId = (String)session.getAttribute("id");
		
		mav.addObject("request",request);
		mav.addObject("projectDto", projectDto);
		mav.addObject("aplMemId", aplMemId);
		
		projectservice.projectWrite(mav, aplMemId);
		System.out.println("신청 완료했습니다.");
		projectservice.projectApplyAdd(mav, aplMemId);
		return mav;
	}
	
	//프로젝트 현황
	@RequestMapping(value="/project/pjtState.do", method=RequestMethod.GET)
	public ModelAndView projectState(HttpServletRequest request, HttpServletResponse response) {
		  ModelAndView mav = new ModelAndView();
		  HttpSession session = request.getSession(); 
		  String id = (String)session.getAttribute("id");
		  
		  HAspect.logger.info(HAspect.logMsg+"ModelAndView" + id);
		  session.setAttribute("aplMemId", id);
		  mav.addObject("request", request);
		  mav.addObject("aplMemId", id);
		  
		  //회원 pjt_번호
		  projectservice.projectCnt(mav, id); 
		  //pjt 테이블 전체 가져오기
		  projectservice.projectList(mav);
		  
		  return mav;

	}
	
	//프로젝트 수정
	@RequestMapping(value="/project/update.do", method=RequestMethod.POST)
	public ModelAndView projectUpdate(HttpServletRequest request, HttpServletResponse response,ProjectDto projectDto) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("projectDto", projectDto);
		
		projectservice.projectUpdateOk(mav);
		return mav;
	}
	//프로젝트 삭제
	@RequestMapping(value="/project/delete.do", method=RequestMethod.GET)
	public ModelAndView projectdDelete(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		projectservice.projectDeleteOk(mav);
			
		return mav;		
	}
	
	//프로젝트 신청
	@RequestMapping(value="/project/projectApply.do", method=RequestMethod.GET)
	public ModelAndView projectApply(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		HttpSession session = request.getSession(); 
		String aplMemId = (String)session.getAttribute("id");
		System.out.println("프로젝트 신청자 :" + aplMemId);
		
		projectservice.projectApplyOk(mav, aplMemId);
			
		return mav;		
	}
	
}
