package com.promore.manager.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.promore.aop.HAspect;
import com.promore.customer.dto.CustomerDto;
import com.promore.manager.dto.NoticeDto;
import com.promore.member.dto.MemberDto;

@Component
public class ManagerDaoImp implements ManagerDao {
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
		
		List<NoticeDto> list = sqlSessionTemplate.selectList("notice_list");
		
		for(NoticeDto noticeDto : list) {
			if(noticeDto.getNotFileName()!=null) {
				noticeDto.setNotFileName(noticeDto.getNotFileName().substring(noticeDto.getNotFileName().indexOf("_")+1));
			}
		}
		
		return list;
	}
	
	@Override
	public NoticeDto noticeSelect(int notNum) {
		return sqlSessionTemplate.selectOne("notice_select", notNum);
	}
	
	@Override
	public int noticeDelete(int notNum) {
		return sqlSessionTemplate.delete("notice_delete", notNum);
	}
	
	@Override
	public int reportCount() {
		return sqlSessionTemplate.selectOne("report_count");
	}
	
	@Override
	public List<CustomerDto> reportList() {
		
		List<CustomerDto> list = sqlSessionTemplate.selectList("report_list");
		
		for(CustomerDto customerDto : list) {
			if(customerDto.getCusFileName()!=null) {
				customerDto.setCusFileName(customerDto.getCusFileName().substring(customerDto.getCusFileName().indexOf("_")+1));
			}
		}
		
		return list;
	}

	@Override
	public int memberCount() {
		return sqlSessionTemplate.selectOne("member_count");
	}

	@Override
	public List<MemberDto> memberList() {
		return sqlSessionTemplate.selectList("member_list");
	}

	@Override
	public int memberDelete(int memNum) {
		return sqlSessionTemplate.delete("member_delete", memNum);
	}

	@Override
	public MemberDto memberSelect(int memNum) {
		return sqlSessionTemplate.selectOne("member_select", memNum);
	}


	
	
}
