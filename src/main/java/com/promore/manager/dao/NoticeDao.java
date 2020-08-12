package com.promore.manager.dao;

import java.util.List;

import com.promore.manager.dto.NoticeDto;

public interface NoticeDao {
	
	public int noticeWrite(NoticeDto noticeDto);
	
	public int noticeCount();
	
	public List<NoticeDto> noticeList();
	
}