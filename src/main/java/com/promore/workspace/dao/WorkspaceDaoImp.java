package com.promore.workspace.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

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
		return sqlSessionTemplate.insert("WorkspaceMapper.insert_work", workspaceDto);
	}

	@Override
	public int updateWork(WorkspaceDto workspaceDto) {
		return sqlSessionTemplate.update("WorkspaceMapper.update_work", workspaceDto);
	}

	@Override
	public int deleteWork(WorkspaceDto workspaceDto) {
		return sqlSessionTemplate.delete("WorkspaceMapper.delete_work", workspaceDto);
	}

	@Override
	public WorkspaceDto selectFileInfo(WorkspaceDto workspaceDto) {
		return sqlSessionTemplate.selectOne("WorkspaceMapper.select_file_info", workspaceDto);
	}

	@Override
	public int updateFileInfo(WorkspaceDto workspaceDto) {
		return sqlSessionTemplate.update("WorkspaceMapper.update_file_info", workspaceDto);
	}
	
	//일감 개수
	@Override
	public int workCount(String id) {
		return sqlSessionTemplate.selectOne("work_cnt", id);
	}
	
	//일감 리스트
	@Override
	public List<WorkspaceDto> workList(String id) {
		// TODO Auto-generated method stub
		System.out.println("worklist" + id);
		return sqlSessionTemplate.selectList("work_list", id);
	}
	
}