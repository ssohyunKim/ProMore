package com.promore.workspace.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.promore.workspace.dto.WorkspaceDto;

public interface WorkspaceService {
	
	public void workspaceWrite(WorkspaceDto workspaceDto);
	
	public List<WorkspaceDto> workListService();
	
	public int workInsertService(WorkspaceDto workspaceDto);
	
	public void workWrite(ModelAndView mav);
	
}
