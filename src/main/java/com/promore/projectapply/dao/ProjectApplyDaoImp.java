package com.promore.projectapply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ProjectApplyDaoImp implements ProjectApplyDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<ProjectApplyDao> projectList() {
		return sqlSessionTemplate.selectList("projectapply_list");
	}
	
}
