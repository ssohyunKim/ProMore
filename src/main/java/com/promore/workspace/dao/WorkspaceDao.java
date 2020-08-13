package com.promore.workspace.dao;

import java.util.List;

import com.promore.workspace.dto.WorkspaceDto;

public interface WorkspaceDao {
	
	public int workspaceWrite(WorkspaceDto workspaceDto);
	
	public List<WorkspaceDto> workList();
	
	public int workInsert(WorkspaceDto workspaceDto);
	
}
