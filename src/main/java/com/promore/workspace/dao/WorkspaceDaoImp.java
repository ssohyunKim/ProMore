package com.promore.workspace.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.promore.aop.HAspect;
import com.promore.workspace.dto.WorkspaceDto;

public class WorkspaceDaoImp implements WorkspaceDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int workspaceWrite(WorkspaceDto workspaceDto) {
		int check = sqlSessionTemplate.selectOne("workspace_insert", workspaceDto);
		
		return check;
	}
	

}
