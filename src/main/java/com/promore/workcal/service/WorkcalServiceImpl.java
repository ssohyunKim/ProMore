package com.promore.workcal.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.promore.project.dto.ProjectDto;
import com.promore.workcal.dao.WorkcalDao;
import com.promore.workcal.dto.WorkcalDto;

@Service("workcalService")
public class WorkcalServiceImpl implements WorkcalService {
	@Autowired
	@Qualifier("workcalDao")
	private WorkcalDao workcalDao;

	@SuppressWarnings("unchecked")
	@Override
	public void getGiveSche(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();

		WorkcalDto workcalDto = new WorkcalDto();

		workcalDto.setWorkSender((String) model.get("workSender"));
		workcalDto.setProNum(Integer.parseInt((String) model.get("proNum")));

		List<WorkcalDto> list = workcalDao.getGiveSche(workcalDto);
		JSONObject jsonObj = null;
		JSONArray jsonArr = new JSONArray();
		for (WorkcalDto dto : list) {
			jsonObj = new JSONObject();
			jsonObj.put("workNum", dto.getWorkNum());
			jsonObj.put("workState", dto.getWorkState());
			jsonObj.put("workSender", dto.getWorkSender());
			jsonObj.put("workReceiver", dto.getWorkReceiver());
			jsonObj.put("workSubject", dto.getWorkSubject());
			jsonObj.put("workContent", dto.getWorkContent());
			jsonObj.put("workStartDate", dto.getWorkStartDate().getTime());
			jsonObj.put("workEndDate", dto.getWorkEndDate().getTime());
			jsonObj.put("proNum", dto.getProNum());
			jsonArr.add(jsonObj);
		}

		jsonObj = new JSONObject();
		jsonObj.put("result", jsonArr);
		mav.addObject("jsonObj", jsonObj);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void getTakeSche(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();

		WorkcalDto workcalDto = new WorkcalDto();
		workcalDto.setWorkReceiver((String) model.get("workReceiver"));
		workcalDto.setProNum(Integer.parseInt((String) model.get("proNum")));

		List<WorkcalDto> list = workcalDao.getTakeSche(workcalDto);
		JSONObject jsonObj = null;
		JSONArray jsonArr = new JSONArray();
		for (WorkcalDto dto : list) {
			jsonObj = new JSONObject();
			jsonObj.put("workNum", dto.getWorkNum());
			jsonObj.put("workState", dto.getWorkState());
			jsonObj.put("workSender", dto.getWorkSender());
			jsonObj.put("workReceiver", dto.getWorkReceiver());
			jsonObj.put("workSubject", dto.getWorkSubject());
			jsonObj.put("workContent", dto.getWorkContent());
			jsonObj.put("workStartDate", dto.getWorkStartDate().getTime());
			jsonObj.put("workEndDate", dto.getWorkEndDate().getTime());
			jsonObj.put("proNum", dto.getProNum());
			jsonArr.add(jsonObj);
		}

		jsonObj = new JSONObject();
		jsonObj.put("result", jsonArr);
		mav.addObject("jsonObj", jsonObj);
	}

}
