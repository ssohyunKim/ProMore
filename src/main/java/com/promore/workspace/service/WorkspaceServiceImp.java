package com.promore.workspace.service;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.promore.workspace.dao.WorkspaceDao;
import com.promore.workspace.dto.WorkspaceDto;

@Component
public class WorkspaceServiceImp implements WorkspaceService {
	@Autowired
	private WorkspaceDao workspaceDao;

	@Override
	public void getAllWork(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();

		HttpServletRequest req = (HttpServletRequest) model.get("req");
		WorkspaceDto workspaceDto = new WorkspaceDto();
		workspaceDto.setProNum(Integer.parseInt(req.getParameter("proNum")));

		List<WorkspaceDto> list = workspaceDao.selectAllWork(workspaceDto);
		mav.addObject("proNum", workspaceDto.getProNum());
		mav.addObject("list", list);

		mav.setViewName("workspace/workspace");
	}

	@Override
	@Transactional
	public void addWork(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();

		HttpServletRequest req = (HttpServletRequest) model.get("req");

		WorkspaceDto workspaceDto = new WorkspaceDto();
		workspaceDto.setWorkSender(req.getParameter("workSender"));
		workspaceDto.setWorkReceiver(req.getParameter("workReceiver"));
		workspaceDto.setWorkSubject(req.getParameter("workSubject"));
		workspaceDto.setWorkContent(req.getParameter("workContent"));
		workspaceDto.setWorkState(Integer.parseInt(req.getParameter("workState")));
		workspaceDto.setProNum(Integer.parseInt(req.getParameter("proNum")));

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			workspaceDto.setWorkStartDate(sdf.parse(req.getParameter("workStartDate")));
			workspaceDto.setWorkEndDate(sdf.parse(req.getParameter("workEndDate")));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		int chk = workspaceDao.insertWork(workspaceDto);
		if (chk == 1)
			mav.addObject("num", workspaceDao.selectWorkNum());
	}

	@Override
	public void editWork(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();

		HttpServletRequest req = (HttpServletRequest) model.get("req");

		WorkspaceDto workspaceDto = new WorkspaceDto();
		workspaceDto.setWorkNum(Integer.parseInt(req.getParameter("workNum")));
		workspaceDto.setWorkReceiver(req.getParameter("workReceiver"));
		workspaceDto.setWorkSubject(req.getParameter("workSubject"));
		workspaceDto.setWorkContent(req.getParameter("workContent"));
		workspaceDto.setWorkState(Integer.parseInt(req.getParameter("workState")));

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			workspaceDto.setWorkStartDate(sdf.parse(req.getParameter("workStartDate")));
			workspaceDto.setWorkEndDate(sdf.parse(req.getParameter("workEndDate")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		mav.addObject("chk", workspaceDao.updateWork(workspaceDto));
	}

//	@Override
//	public void workListService() {
//		// TODO Auto-generated method stub
//
//	}
//
//	@Override
//	public void workInsertService(WorkspaceDto workspaceDto) {
//		// TODO Auto-generated method stub
//		
//	}
}
