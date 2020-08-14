package com.promore.project.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
		int check = 0;
		check = sqlSessionTemplate.insert("project_insert", projectDto);
		return check;
	}
	
	@Override
	public int projectCount() {
		return sqlSessionTemplate.selectOne("project_count");
	}
	
	@Override
	public List<ProjectDto> projectList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("project_list");
	}
	
	@Override
	public List<String> projectState(String id) {
		// TODO Auto-generated method stub
		//번호
		return sqlSessionTemplate.selectList("project_cnt", id);
	}
}
