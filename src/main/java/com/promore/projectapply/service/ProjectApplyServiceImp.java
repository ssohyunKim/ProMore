package com.promore.projectApply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.promore.project.dto.ProjectDto;
import com.promore.projectApply.dao.ProjectApplyDao;

@Component
public class ProjectApplyServiceImp implements ProjectApplyService {
	@Autowired
	private ProjectApplyDao projectapplyDao;
	
	@Override
	public void proApplyList(ModelAndView mav) {
		List<ProjectApplyDao> projectDtoArray = projectapplyDao.projectList();
		
	}
	
}
