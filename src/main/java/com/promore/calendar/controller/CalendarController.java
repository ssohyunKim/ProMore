package com.promore.calendar.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalendarController {

	@RequestMapping(value = "/calendar/holiday", method = RequestMethod.GET)
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
				resp.setHeader("Content-Type", "text/plain; charset=utf-8");
				System.out.println(sb.toString());
				resp.getWriter().println(sb.toString());
				resp.flushBuffer();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
