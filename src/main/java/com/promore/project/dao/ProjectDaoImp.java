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
	public int projectUpdateOk(ProjectDto projectDto) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("projectDto", projectDto);
		
		return sqlSessionTemplate.update("project_update", hMap);
	}
	
	@Override
	public int projectDeleteOk(int proNum) {
		return sqlSessionTemplate.delete("project_delete", proNum);
		
	}
	
	@Override
	public int projectCount() {
		return sqlSessionTemplate.selectOne("project_count");
	}
	
	@Override
	public List<ProjectDto> projectList() {
		return sqlSessionTemplate.selectList("project_list");
	}
	
	@Override
	public List<String> projectState(String id) {
		//번호
		return sqlSessionTemplate.selectList("project_cnt", id);
	}
	
	@Override
	public int projectApply(int aplNum, String aplMemId) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("aplNum", aplNum);
		hMap.put("aplMemId", aplMemId);
		//map으로 넘겨주기
		return sqlSessionTemplate.insert("project_apply", hMap);
	}
	
	@Override
	public int projectApplyCnt(int aplNum) {
		return sqlSessionTemplate.update("project_apply_cnt", aplNum);
	}
	
	@Override
	public int projectApplyAdd(String aplMemId) {
		return sqlSessionTemplate.insert("project_apply_add", aplMemId);
		
	}
	/*
	 * @Override public int projectStateUpdate(int proNum, int proState) { int check
	 * = 0; check = sqlSessionTemplate.update("project_state_update", projectDto);
	 * System.out.println("check" + check); return check;
	 * 
	 * }
	 */
	
	@Override
	public int projectStateUpdate(int proNum, int proState) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("proNum", proNum);
		hMap.put("proState", proState);
		
		return sqlSessionTemplate.update("project_state_update", hMap);
	}
}
