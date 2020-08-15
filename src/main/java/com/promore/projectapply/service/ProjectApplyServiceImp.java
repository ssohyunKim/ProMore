package com.promore.projectapply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.promore.projectapply.dao.ProjectApplyDao;
import com.promore.projectapply.dto.ProjectApplyDto;

@Component
public class ProjectApplyServiceImp implements ProjectApplyService {
	@Autowired
	private ProjectApplyDao projectapplyDao;

	@Override
	public void proApplyList(ModelAndView mav, String aplMemId) {
		List<ProjectApplyDto> projectapplyDtoArray = projectapplyDao.projectApplyList(aplMemId);
	
		System.out.println("applyDto" + projectapplyDtoArray);
		mav.addObject("projectApplyDto", projectapplyDtoArray);
		
	}
}
