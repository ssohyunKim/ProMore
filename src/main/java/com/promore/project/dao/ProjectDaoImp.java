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
	public List<Integer> projectState(String aplMemId) {
		// TODO Auto-generated method stub
		System.out.println("마지막 memid" + aplMemId);
		return sqlSessionTemplate.selectList("project_state", aplMemId);
		// project table로 한 번 더 접근
		// pro_num과 같은 것 중 state, name가져오기

		/*
		 * List<Object> list = null; for(Integer proNum : projectState) { list =
		 * sqlSessionTemplate.selectList("project_select", proNum);
		 * System.out.println(proNum + " : " + list); return list;
		 * 
		 * }
		 * 
		 * return list;
		 */

		// state && Name 함께 key,value값으로 담음
		// 값 보내줌
	}
	@Override
	public List<Object> projectStatenum(Integer proNum) {
		return sqlSessionTemplate.selectList("project_select", proNum);
	}
	
}
