package com.promore.project.service;

import org.springframework.web.servlet.ModelAndView;

public interface ProjectService {
	
	public void projectState(ModelAndView mav, String memid);


	public void projectList(ModelAndView mav);


	void projectWrite(ModelAndView mav, String memid);

}
