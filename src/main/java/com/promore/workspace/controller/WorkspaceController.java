package com.promore.workspace.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.promore.aop.HAspect;
import com.promore.workspace.service.WorkspaceService;

@Controller
public class WorkspaceController {
	
	private WorkspaceService workspaceService;
	
	@RequestMapping(value = "/workspace/workspace.do", method = RequestMethod.GET)
	public ModelAndView workspace(HttpServletRequest request, HttpServletResponse response) {
		HAspect.logger.info(HAspect.logMsg+"workspaceOk");
		
		ModelAndView mav = new ModelAndView("/workspace/workspace");
		
		return mav;
	}
	
	
	
	@RequestMapping(value = "/workspace/manager.do", method = RequestMethod.GET)
	public ModelAndView manager(HttpServletRequest request, HttpServletResponse response) {
		HAspect.logger.info(HAspect.logMsg+"managerOk");
		
		ModelAndView mav = new ModelAndView("/workspace/manager");
		return mav;
	}
	
}
