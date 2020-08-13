package com.promore.calendar.dao;

import java.util.List;

import com.promore.calendar.dto.CalendarDto;

public interface CalendarDao {
	public int insertSchedule(CalendarDto calendarDto);
	public int updateSchedule(CalendarDto calendarDto);
	public int deleteSchedule(CalendarDto calendarDto);
	public List<CalendarDto> selectSchedule(CalendarDto calendarDto);
}
