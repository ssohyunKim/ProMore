package com.promore.project.dao;

import java.util.List;


import com.promore.project.dto.ProjectDto;

public interface ProjectDao {
	public int projectWrite(ProjectDto projectDto);

	public List<Integer> projectState(String memid);

	public List<Object> projectStatenum(Integer proNum);

	public int projectCount();

	public List<ProjectDto> projectList();

}
