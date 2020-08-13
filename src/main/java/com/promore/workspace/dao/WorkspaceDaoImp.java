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
	public List<WorkspaceDto> selectAllWork(WorkspaceDto workspaceDto) {
		return sqlSessionTemplate.selectList("WorkspaceMapper.select_all_work", workspaceDto);
	}

	@Override
	public int selectWorkNum() {
		return sqlSessionTemplate.selectOne("WorkspaceMapper.select_work_num");
	}

	@Override
	public int insertWork(WorkspaceDto workspaceDto) {
		if (workspaceDto.getWorkFileSize() != 0)
			return sqlSessionTemplate.insert("WorkspaceMapper.insert_work", workspaceDto);
		else
			return sqlSessionTemplate.insert("WorkspaceMapper.insert_work_without_file", workspaceDto);
	}

	@Override
	public int updateWork(WorkspaceDto workspaceDto) {
		if (workspaceDto.getWorkFileSize() != 0)
			return sqlSessionTemplate.update("WorkspaceMapper.update_work", workspaceDto);
		else
			return sqlSessionTemplate.update("WorkspaceMapper.update_work_without_file", workspaceDto);
	}
}