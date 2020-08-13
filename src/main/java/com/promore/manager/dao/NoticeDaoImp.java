package com.promore.manager.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.promore.aop.HAspect;
import com.promore.manager.dto.NoticeDto;

@Component
public class NoticeDaoImp implements NoticeDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int noticeWrite(NoticeDto noticeDto) {
		
		HAspect.logger.info(HAspect.logMsg + "noticeWriteOk - Dao");
		
		int check = 0;
		
		if(noticeDto.getNotFileSize()!=0) {
			check = sqlSessionTemplate.insert("notice_insert", noticeDto);
		} else {
			check = sqlSessionTemplate.insert("notice_insert_without_file", noticeDto);
		}		
		
		return check;
	}
	
	@Override
	public int noticeCount() {
		return sqlSessionTemplate.selectOne("notice_count");
	}
	
	@Override
	public List<NoticeDto> noticeList() {
		return sqlSessionTemplate.selectList("notice_list");
	}
	
	@Override
	public NoticeDto noticeSelect(int notNum) {
		return sqlSessionTemplate.selectOne("notice_select", notNum);
	}
	
	@Override
	public int noticeDelete(int notNum) {
		return sqlSessionTemplate.delete("notice_delete", notNum);
	}
	
}
