package com.promore.manager.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.promore.manager.dto.NoticeDto;

public class NoticeDaoImp implements NoticeDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int noticeWrite(NoticeDto noticeDto) {
		
		int check = 0;
		
		if(noticeDto.getNotFileSize()!=0) {
			check = sqlSessionTemplate.insert("notice_insert", noticeDto);
		} else {
			check = sqlSessionTemplate.insert("notice_insert_without_file", noticeDto);
		}		
		
		return check;
	}
}
