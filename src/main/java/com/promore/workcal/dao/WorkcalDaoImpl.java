package com.promore.workcal.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.promore.workcal.dto.WorkcalDto;

@Repository("workcalDao")
public class WorkcalDaoImpl implements WorkcalDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<WorkcalDto> getGiveSche(WorkcalDto workcalDto) {
		return sqlSessionTemplate.selectList("WorkcalMapper.select_giver_schedule", workcalDto);
	}

	@Override
	public List<WorkcalDto> getTakeSche(WorkcalDto workcalDto) {
		return sqlSessionTemplate.selectList("WorkcalMapper.select_taker_schedule", workcalDto);
	}

}
