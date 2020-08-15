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

}
