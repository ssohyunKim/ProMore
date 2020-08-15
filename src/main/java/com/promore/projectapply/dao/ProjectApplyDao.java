package com.promore.projectapply.dao;

import java.util.List;

import com.promore.projectapply.dto.ProjectApplyDto;

public interface ProjectApplyDao {

	List<ProjectApplyDto> projectApplyList(String aplMemId);

}
