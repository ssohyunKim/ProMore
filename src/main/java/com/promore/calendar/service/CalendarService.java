package com.promore.calendar.service;

import org.springframework.web.servlet.ModelAndView;

public interface CalendarService {
	public void addSchedule(ModelAndView mav);
	public void getAllSchedule(ModelAndView mav);
}
