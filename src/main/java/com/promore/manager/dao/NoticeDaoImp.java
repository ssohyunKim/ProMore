package com.promore.manager.dao;

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
}
