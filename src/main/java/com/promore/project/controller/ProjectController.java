package com.promore.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProjectController {
	
	@RequestMapping(value="/project/main.do", method=RequestMethod.GET)
	public ModelAndView projectMain(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		ModelAndView mav = new ModelAndView("project/main");
		return mav;
	}
	
	//프로젝트 쓰기
	@RequestMapping(value="/project/write.do", method=RequestMethod.GET)
	public ModelAndView projectWrite(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		ModelAndView mav = new ModelAndView("project/write");
		return mav;
	}
	
	//프로젝트 쓰기 완료
	@RequestMapping(value="/project/writeOk.do", method=RequestMethod.GET)
	public ModelAndView projectWriteOk(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		ModelAndView mav = new ModelAndView("project/writeOk");
		return mav;
	}
	
	//마이페이지
	@RequestMapping(value="/project/myPage.do", method=RequestMethod.GET)
	public ModelAndView projectMypage(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		ModelAndView mav = new ModelAndView("project/myPage");
		return mav;
	}
	
	//프로젝트 읽기
	@RequestMapping(value="/project/read.do", method=RequestMethod.GET)
	public ModelAndView projectRead(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		ModelAndView mav = new ModelAndView("project/read");
		return mav;
	}
	
	//프로젝트 수정
	@RequestMapping(value="/project/update.do", method=RequestMethod.GET)
	public ModelAndView projectUpdate(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		ModelAndView mav = new ModelAndView("project/update");
		return mav;
	}
	//프로젝트 수정 완료
	@RequestMapping(value="/project/updateOk.do", method=RequestMethod.GET)
	public ModelAndView projectUpdateOk(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		ModelAndView mav = new ModelAndView("project/updateOk");
		return mav;
	}
	
	//프로젝트 삭제
	@RequestMapping(value="/project/delete.do", method=RequestMethod.GET)
	public ModelAndView projectDelete(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		ModelAndView mav = new ModelAndView("project/delete");
		return mav;
	}
	
	//프로젝트 삭제 완료
	@RequestMapping(value="/project/pjtDeleteOk.do", method=RequestMethod.GET)
	public ModelAndView projectDeleteOk(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		ModelAndView mav = new ModelAndView("project/pjtDeleteOk");
		return mav;
	}
	
	//프로젝트 신청
	@RequestMapping(value="/project/pjtApplyOk.do", method=RequestMethod.GET)
	public ModelAndView projectApplyOk(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		ModelAndView mav = new ModelAndView("project/pjtApplyOk");
		return mav;
	}
	
	//일감현황
		@RequestMapping(value="/project/workState.do", method=RequestMethod.GET)
	public ModelAndView projectWorkState(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		ModelAndView mav = new ModelAndView("project/workState");
		return mav;
	}
	
	
	//프로젝트 현황
	@RequestMapping(value="/project/pjtState.do", method=RequestMethod.GET)
	public ModelAndView projectState(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		ModelAndView mav = new ModelAndView("project/pjtState");
		return mav;
	}
}
