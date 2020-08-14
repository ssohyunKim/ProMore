package com.promore.manager.dao;

import java.util.List;

import com.promore.customer.dto.CustomerDto;
import com.promore.manager.dto.NoticeDto;

public interface ManagerDao {
	
	public int noticeWrite(NoticeDto noticeDto);
	
	public int noticeCount();
	
	public List<NoticeDto> noticeList();
	
	public NoticeDto noticeSelect(int notNum);
	
	public int noticeDelete(int notNum);
	
	public int reportCount();
	
	public List<CustomerDto> reportList();

	public int memberCount();
	
	
}