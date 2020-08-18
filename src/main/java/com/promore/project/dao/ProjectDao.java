package com.promore.project.dao;

import java.util.List;


import com.promore.project.dto.ProjectDto;

public interface ProjectDao {
	public int projectWrite(ProjectDto projectDto);

	public List<String> projectState(String id);

	public int projectCount();

	public List<ProjectDto> projectList();

	public int projectUpdateOk(ProjectDto projectDto);

	public int projectDeleteOk(int proNum);

	public int projectApply(int aplNum, String aplMemId);

	public int projectApplyCnt(int aplNum);

	public int projectApplyAdd(String memId);


	public int projectStateUpdate(int proNum, int proState);

	public List<String> projectState();


	public List<ProjectDto> projectSelectList(int proNum);

	public ProjectDto projectSelectRead(int proNum);

}
