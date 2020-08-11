package com.promore.workspace;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WorkspaceController {
	
	@RequestMapping(value = "/workspace/workspace.do", method = RequestMethod.GET)
	public ModelAndView workspace(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ok");
		
		ModelAndView mav = new ModelAndView("/workspace/workspace");
		return mav;
	}
}
