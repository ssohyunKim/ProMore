package com.promore.workspace.service;

import org.springframework.web.servlet.ModelAndView;

public interface WorkspaceService {
	public void addWork(ModelAndView mav);

	public void download(ModelAndView mav);

	public void deleteFile(ModelAndView mav);

	public void editWork(ModelAndView mav);

	public void deleteWork(ModelAndView mav);

	public void getAllWork(ModelAndView mav);

	public void workState(ModelAndView mav, String id);

	public void addReply(ModelAndView mav);

	public void deleteReply(ModelAndView mav);

	public void editReply(ModelAndView mav);

	public void likeReply(ModelAndView mav);
	
	public void moveNthWork(ModelAndView mav);
}
