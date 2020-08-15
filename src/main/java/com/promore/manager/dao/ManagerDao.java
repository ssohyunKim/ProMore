package com.promore.manager.dao;

import java.util.List;

import com.promore.customer.dto.CustomerDto;
import com.promore.manager.dto.NoticeDto;
import com.promore.member.dto.MemberDto;

public interface ManagerDao {
	
	public int noticeWrite(NoticeDto noticeDto);
	
	public int noticeCount();
	
	public List<NoticeDto> noticeList();
	
	public NoticeDto noticeSelect(int notNum);
	
	public int noticeDelete(int notNum);
	
	public int reportCount();
	
	public List<CustomerDto> reportList();
	
	public CustomerDto reportSelect(int cusNum);
	
	public int reportStateChange(int cusNum);

	public int memberCount();

	public List<MemberDto> memberList();

	public int memberDelete(int memNum);

	public MemberDto memberSelect(int memNum);
	
	public int noticeUpdate(NoticeDto noticeDto);
}