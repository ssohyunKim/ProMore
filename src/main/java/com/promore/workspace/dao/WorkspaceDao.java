package com.promore.workspace.dao;

import java.util.List;

import com.promore.workspace.dto.WorkspaceDto;

public interface WorkspaceDao {
	public List<WorkspaceDto> selectAllWork(WorkspaceDto workspaceDto);

	public WorkspaceDto selectFileInfo(WorkspaceDto workspaceDto);

	public int updateFileInfo(WorkspaceDto workspaceDto);

	public int selectWorkNum();

	public int insertWork(WorkspaceDto workspaceDto);

	public int updateWork(WorkspaceDto workspaceDto);

	public int deleteWork(WorkspaceDto workspaceDto);

	public int workCount(String id);

	public List<WorkspaceDto> workList(String id);
}
