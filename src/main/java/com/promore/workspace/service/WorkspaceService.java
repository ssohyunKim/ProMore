package com.promore.workspace.service;

import org.springframework.web.servlet.ModelAndView;

public interface WorkspaceService {
	public void addWork(ModelAndView mav);
	public void editWork(ModelAndView mav);
	public void deleteWork(ModelAndView mav);
	public void getAllWork(ModelAndView mav);
}
