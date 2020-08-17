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
import com.promore.member.dto.MemberDto;
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

	@RequestMapping(value = "/project/writeOk.do", method = RequestMethod.POST)
	public ModelAndView projectWriteOk(HttpServletRequest request, HttpServletResponse response, ProjectDto projectDto) {
		ModelAndView mav = new ModelAndView(); 
		HttpSession session = request.getSession(); 
		String aplMemId = (String)session.getAttribute("id");
		
		mav.addObject("request",request);
		mav.addObject("projectDto", projectDto);
		mav.addObject("aplMemId", aplMemId);
		
		
		projectservice.projectApplyAdd(mav, aplMemId);
		projectservice.projectWrite(mav, aplMemId);
		
		return mav;
	}
	
	@RequestMapping(value="/project/pjtState.do", method=RequestMethod.GET)
	public ModelAndView projectState(HttpServletRequest request, HttpServletResponse response) {
		  ModelAndView mav = new ModelAndView();
		  HttpSession session = request.getSession(); 
		  String id = (String)session.getAttribute("id");
		  
		  HAspect.logger.info(HAspect.logMsg+"ModelAndView" + id);
		  session.setAttribute("aplMemId", id);
		  mav.addObject("request", request);
		  mav.addObject("aplMemId", id);
		  
		  projectservice.projectCnt(mav, id); 
		  projectservice.projectList(mav);
		  
		  return mav;

	}
	

	@RequestMapping(value="/project/update.do", method=RequestMethod.POST)
	public ModelAndView projectUpdate(HttpServletRequest request, HttpServletResponse response,ProjectDto projectDto) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("projectDto", projectDto);
		
		projectservice.projectUpdateOk(mav);
		return mav;
	}

	@RequestMapping(value="/project/delete.do", method=RequestMethod.GET)
	public ModelAndView projectdDelete(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		projectservice.projectDeleteOk(mav);
			
		return mav;		
	}
	
	
	@RequestMapping(value="/project/projectApply.do", method=RequestMethod.GET)
	public ModelAndView projectApply(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		HttpSession session = request.getSession(); 
		String aplMemId = (String)session.getAttribute("id");
		
		projectservice.projectApplyOk(mav, aplMemId);
			
		return mav;		
	}
	
	@RequestMapping(value="/project/projectSelect.do", method=RequestMethod.GET)
	public ModelAndView projectSelect(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		HttpSession session = request.getSession(); 
		String aplMemId = (String)session.getAttribute("id");
		
		
		projectservice.projectSelect(mav,aplMemId);

		return mav;
		
	}
			
	
	@RequestMapping(value="/project/projectStateUpdate.do", method=RequestMethod.POST)
	public ModelAndView projectStateUpdate(HttpServletRequest request, HttpServletResponse response, ProjectDto projectDto) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("request", request);
		mav.addObject("projectDto", projectDto); 
		  
		projectservice.projectStateUpdateOk(mav); 
		
		return mav;
	}
	
	@RequestMapping(value="/project/projectRead.do", method=RequestMethod.GET)
	public ModelAndView projectRead(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		HttpSession session = request.getSession(); 
		String aplMemId = (String)session.getAttribute("id");
		
		projectservice.projectRead(mav,aplMemId);

		return mav;
		
	}
	
		
	
}
