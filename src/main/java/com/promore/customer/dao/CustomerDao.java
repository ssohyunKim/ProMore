package com.promore.customer.dao;

import java.util.HashMap;
import java.util.List;

import com.promore.customer.dto.CustomerDto;

public interface CustomerDao {

	public int customerBoardGroupNumberMax();

	public int customerBoardWriteNumber(HashMap<String, Integer> hMap);
	
	public int customerBoardWrite(CustomerDto customerDto);

	public List<CustomerDto> customerBoardList(String customerId);

	public int customerBoardDelete(int cusNum);


}
