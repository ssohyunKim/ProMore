package com.promore.project.service;

import org.springframework.web.servlet.ModelAndView;

public interface ProjectService {
	
	public void projectList(ModelAndView mav);


	void projectWrite(ModelAndView mav, String memid);


	public void projectCnt(ModelAndView mav, String id);



	public void projectUpdateOk(ModelAndView mav);


	public void projectDeleteOk(ModelAndView mav);


	public void projectApplyOk(ModelAndView mav, String aplMemId);


}
