package com.promore.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		System.out.println("Ok");

		ModelAndView mav = new ModelAndView("project/main");
		return mav;
	}

	// 프로젝트 작성
	@RequestMapping(value = "/project/writeOk.do", method = RequestMethod.POST)
	public ModelAndView projectWrite(HttpServletRequest request, HttpServletResponse response, ProjectDto projectDto) {
		System.out.println("OK write");
		System.out.println(projectDto); 
	
		ModelAndView mav = new ModelAndView(); 
		mav.addObject("request",request);
		mav.addObject("projectDto", projectDto);
		
		projectservice.projectWrite(mav); 
		return mav;
	}

	// 일감현황
	@RequestMapping(value = "/project/workState.do", method = RequestMethod.GET)
	public ModelAndView projectWorkState(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");

		ModelAndView mav = new ModelAndView("project/workState");
		return mav;
	}

	// 프로젝트 현황
	@RequestMapping(value = "/project/pjtState.do", method = RequestMethod.GET)
	public ModelAndView projectState(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");

		ModelAndView mav = new ModelAndView("project/pjtState");
		return mav;
	}
}
