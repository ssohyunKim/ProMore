package com.promore.workspace.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.promore.aop.HAspect;
import com.promore.workspace.dto.WorkspaceDto;

@Component
public class WorkspaceDaoImp implements WorkspaceDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int workspaceWrite(WorkspaceDto workspaceDto) {
		HAspect.logger.info(HAspect.logMsg + "workspaceWrite - Dao");

		int check = 0;

		if (workspaceDto.getWorkFileSize() != 0) {
			check = sqlSessionTemplate.insert("workspacet_insert", workspaceDto);
		} else {
			check = sqlSessionTemplate.insert("workspacet_insert_file", workspaceDto);
		}

		return check;
	}

	@Override
	public List<WorkspaceDto> workList() {

		List<WorkspaceDto> list = sqlSessionTemplate.selectList("work_list");

		return list;
	}

	@Override
	public int workInsert(WorkspaceDto workspaceDto) {

		int check = 0;

		if (workspaceDto.getWorkFileSize() != 0) {
			check = sqlSessionTemplate.insert("work_insert", workspaceDto);
		} else {
			check = sqlSessionTemplate.insert("work_insert_without_file", workspaceDto);
		}

		return check;
	}
}