package com.promore.projectapply.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.promore.projectapply.dto.ProjectApplyDto;

@Component
public class ProjectApplyDaoImp implements ProjectApplyDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<ProjectApplyDto> projectApplyList(String aplMemId) {
		
		List<ProjectApplyDto> apply = sqlSessionTemplate.selectList("project_apply_list", aplMemId);
		System.out.println("mapper" + apply);
		
		return apply;
	}
}
