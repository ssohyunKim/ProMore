package com.promore.calendar.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.promore.calendar.dto.CalendarDto;

@Repository("calendarDao")
public class CalendarDaoImpl implements CalendarDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int insertSchedule(CalendarDto calendarDto) {
		return sqlSessionTemplate.insert("CalendarMapper.insert_schedule", calendarDto);
	}

	@Override
	public List<CalendarDto> selectSchedule(CalendarDto calendarDto) {
		return sqlSessionTemplate.selectList("CalendarMapper.select_schedule", calendarDto);
	}

	@Override
	public int updateSchedule(CalendarDto calendarDto) {
		return sqlSessionTemplate.update("CalendarMapper.update_schedule", calendarDto);
	}

	@Override
	public int deleteSchedule(CalendarDto calendarDto) {
		return sqlSessionTemplate.delete("CalendarMapper.delete_schedule", calendarDto);
	}

}
