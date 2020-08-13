package com.promore.calendar.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.promore.calendar.dao.CalendarDao;
import com.promore.calendar.dto.CalendarDto;

@Service("calendarService")
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	@Qualifier("calendarDao")
	private CalendarDao calendarDao;

	@Override
	public void addSchedule(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();
		
		HttpServletRequest req = (HttpServletRequest) model.get("req");
		CalendarDto calendarDto = new CalendarDto();
		calendarDto.setScheNum(Long.parseLong(req.getParameter("scheNum")));
		calendarDto.setScheTitle(req.getParameter("scheTitle"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			calendarDto.setScheStartDate(sdf.parse(req.getParameter("scheStartDate")));
			calendarDto.setScheEndDate(sdf.parse(req.getParameter("scheEndDate")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		calendarDto.setScheContent(req.getParameter("scheContent"));
		calendarDto.setProNum(Integer.parseInt(req.getParameter("proNum")));

		int chk = calendarDao.insertSchedule(calendarDto);
		mav.addObject("chk", chk);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void getAllSchedule(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();

		CalendarDto calendarDto = new CalendarDto();
		HttpServletRequest req = (HttpServletRequest) model.get("req");
		calendarDto.setProNum(Integer.parseInt(req.getParameter("proNum")));

		List<CalendarDto> list = calendarDao.selectSchedule(calendarDto);
		JSONObject jsonObj = null;
		JSONArray jsonArr = new JSONArray();
		for (CalendarDto dto : list) {
			jsonObj = new JSONObject();
			jsonObj.put("scheNum", dto.getScheNum());
			jsonObj.put("scheTitle", dto.getScheTitle());
			jsonObj.put("scheStartDate", dto.getScheStartDate().getTime());
			jsonObj.put("scheEndDate", dto.getScheEndDate().getTime());
			jsonObj.put("scheContent", dto.getScheContent());
			jsonArr.add(jsonObj);
		}

		jsonObj = new JSONObject();
		jsonObj.put("result", jsonArr);
		mav.addObject("jsonObj", jsonObj);
	}

	@Override
	public void editSchedule(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();
		
		HttpServletRequest req = (HttpServletRequest) model.get("req");
		CalendarDto calendarDto = new CalendarDto();
		calendarDto.setScheNum(Long.parseLong(req.getParameter("scheNum")));
		calendarDto.setScheTitle(req.getParameter("scheTitle"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			calendarDto.setScheStartDate(sdf.parse(req.getParameter("scheStartDate")));
			calendarDto.setScheEndDate(sdf.parse(req.getParameter("scheEndDate")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		calendarDto.setScheContent(req.getParameter("scheContent"));
		
		int chk = calendarDao.updateSchedule(calendarDto);
		mav.addObject("chk", chk);
	}

	@Override
	public void deleteSchedule(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();
		
		HttpServletRequest req = (HttpServletRequest) model.get("req");
		CalendarDto calendarDto = new CalendarDto();
		calendarDto.setScheNum(Long.parseLong(req.getParameter("scheNum")));
		
		int chk = calendarDao.deleteSchedule(calendarDto);
		mav.addObject("chk", chk);
	}
}
