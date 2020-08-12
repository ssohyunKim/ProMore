package com.promore.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.promore.project.dto.ProjectDto;

@Component
public class ProjectDaoImp implements ProjectDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int projectWrite(ProjectDto projectDto) {
		return sqlSessionTemplate.insert("project_insert", projectDto);
		
	}
	
}
