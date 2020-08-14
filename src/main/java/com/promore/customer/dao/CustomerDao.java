package com.promore.customer.dao;

import java.util.HashMap;
import java.util.List;

import com.promore.customer.dto.CustomerDto;
import com.promore.manager.dto.NoticeDto;

public interface CustomerDao {
	
	public int customerBoardWrite(CustomerDto customerDto);

	public List<CustomerDto> customerBoardList(String customerId);

	public int customerBoardDelete(int cusNum);

	public CustomerDto customerBoardRead(int cusNum);

	public int customerBoardUpdateOk(CustomerDto customerDto);

	public List<NoticeDto> noticeBoardList();
	
	public int noticeBoardUpdateCount(int noticeNum);


}
