package com.promore.calendar.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.promore.calendar.service.CalendarService;

@Controller
public class CalendarController {
	
	@Autowired
	@Qualifier("calendarService")	
	private CalendarService calendarService;
	
	// 페이지 조회
	@RequestMapping(value = "/calendar.do", method = RequestMethod.GET)
	public ModelAndView getCalendar(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("calendar/calendar");
		return mav;
	}
	
	// 일정 추가
	@RequestMapping(value="/calendar/add-schedule.do", method=RequestMethod.POST)
	public void addSchedule(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("req", req);
		calendarService.addSchedule(mav);
		
		resp.setHeader("Content-Type", "plain/text;charset=utf-8");
		try {
			resp.getWriter().println(mav.getModel().get("chk"));
			resp.flushBuffer();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 모든 일정 조회
	@RequestMapping(value = "/calendar/read-schedule.do", method = RequestMethod.GET)
	public void getAllSchedule(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("req", req);
		
		calendarService.getAllSchedule(mav);
		
		resp.setHeader("Content-Type", "application/json;charset=utf-8");
		try {
			resp.getWriter().println(((JSONObject)mav.getModel().get("jsonObj")).toJSONString());
			resp.flushBuffer();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 공휴일 조회
	@RequestMapping(value = "/calendar/holiday.do", method = RequestMethod.GET)
	public void getHoliday(HttpServletRequest req, HttpServletResponse resp) {
		String year = req.getParameter("year");
		String month = req.getParameter("month");

		String url = "http://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo";
		String param = "ServiceKey="
				+ "%2Bbg56%2F68ECtZENghpXgUHnjT6TgDrIASdBTKrsUY2FED6ieP0pVj9I2poEplEkPn3qYFidKsqBHhCYNWZb9oQA%3D%3D"
				+ "&_type=json"
				+ "&solYear=" + year + "&solMonth=" + month;

		GetMethod method = new GetMethod(url + "?" + param);

		try {
			HttpClient httpClient = new HttpClient();
			int statusCode = httpClient.executeMethod(method);
			if (statusCode == HttpStatus.SC_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(method.getResponseBodyAsStream()), 512);
				String str;
				StringBuffer sb = new StringBuffer();
				while((str=br.readLine()) != null) 
					sb.append(str);
				resp.setHeader("Content-Type", "application/json; charset=utf-8");
				resp.getWriter().println(sb.toString());
				resp.flushBuffer();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 일정 수정
	@RequestMapping(value = "/calendar/edit-schedule.do", method = RequestMethod.POST)
	public void editSchedule(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("req", req);
		
		calendarService.editSchedule(mav);
		resp.setHeader("Content-Type", "plain/text;charset=utf-8");
		try {
			resp.getWriter().println(mav.getModel().get("chk"));
			resp.flushBuffer();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 일정 삭제
	@RequestMapping(value = "/calendar/delete-schedule.do", method = RequestMethod.GET)
	public void deleteSchedule(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("req", req);
		
		calendarService.deleteSchedule(mav);
		resp.setHeader("Content-Type", "plain/text;charset=utf-8");
		try {
			resp.getWriter().println(mav.getModel().get("chk"));
			resp.flushBuffer();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
