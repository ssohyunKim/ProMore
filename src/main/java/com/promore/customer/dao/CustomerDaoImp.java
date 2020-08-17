package com.promore.customer.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.promore.customer.dto.CustomerDto;
import com.promore.manager.dto.NoticeDto;

@Component
public class CustomerDaoImp implements CustomerDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public CustomerDaoImp() { }

	public CustomerDaoImp(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	@Override
	public int customerBoardWrite(CustomerDto customerDto) {
		if(customerDto.getCusFileName()==null) {
			System.out.println("customer_board_insert");
			return sqlSessionTemplate.insert("customer_board_insert", customerDto);
		}else {
			System.out.println("customer_board_insert_file");
			return sqlSessionTemplate.update("customer_board_insert_file", customerDto);
		}
	}
	
	@Override
	public List<CustomerDto> customerBoardList(String id) {
		return sqlSessionTemplate.selectList("customer_board_list", id);
	}
	
	@Override
	public int customerBoardDelete(int cusNum) {
		return sqlSessionTemplate.delete("customer_board_delete", cusNum);
	}
	
	@Override
	public CustomerDto customerBoardRead(int cusNum) {
		return sqlSessionTemplate.selectOne("customer_board_read", cusNum);
	}

	@Override
	public int customerBoardUpdateOk(CustomerDto customerDto) {
		Map<String, Object> hMap = new HashMap<String, Object>();
		hMap.put("cusNum", customerDto.getCusNum());
		hMap.put("customerDto", customerDto);
		
		if(customerDto.getCusFileName()==null) {
			System.out.println("customer_board_update");
			return sqlSessionTemplate.update("customer_board_update", hMap);
		}else {
			System.out.println("customer_board_update_file");
			return sqlSessionTemplate.update("customer_board_update_file", hMap);
		}
	}
	
	@Override
	public List<NoticeDto> noticeBoardList() {
		return sqlSessionTemplate.selectList("notice_board_list");
	}
	
	//조회수 증가
	@Override
	public int noticeBoardUpdateCount(int notNum) {
		return sqlSessionTemplate.update("notice_board_update", notNum);
	}
}
