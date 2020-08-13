package com.promore.customer.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.promore.customer.dto.CustomerDto;

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
	public int customerBoardGroupNumberMax() {
		return sqlSessionTemplate.selectOne("customer_board_group_number_max");
	}
	
	@Override
	public int customerBoardWriteNumber(HashMap<String, Integer> hMap) {
		return sqlSessionTemplate.update("customer_board_writer_number", hMap);
	}
	
	@Override
	public int customerBoardWrite(CustomerDto customerDto) {
		return sqlSessionTemplate.insert("customer_board_insert", customerDto);
	}
	
	@Override
	public List<CustomerDto> customerBoardList(String customerId) {
		return sqlSessionTemplate.selectList("customer_board_list", customerId);
	}
	
	@Override
	public int customerBoardDelete(int cusNum) {
		return sqlSessionTemplate.delete("customer_board_delete", cusNum);
	}
}
