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
		
		projectservice.projectList(mav);
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
		return mav;
	}
	
	//프로젝트 현황
		@RequestMapping(value="/project/pjtState.do", method=RequestMethod.GET)
		public ModelAndView projectState(HttpServletRequest request, HttpServletResponse response) {
			  ModelAndView mav = new ModelAndView();
			  HttpSession session = request.getSession(); 
			  String aplMemId = (String)session.getAttribute("aplMemId");
			  
			  HAspect.logger.info(HAspect.logMsg+"ModelAndView" + aplMemId);
			  session.setAttribute("aplMemId", aplMemId);
			  mav.addObject("request", request);
			  mav.addObject("aplMemId", aplMemId);
			  
			  projectservice.projectState(mav, aplMemId); 
			  return mav;

		}
		
		
	
	
}
