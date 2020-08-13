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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.promore.workspace.dao.WorkspaceDao;
import com.promore.workspace.dto.WorkspaceDto;

@Component
public class WorkspaceServiceImp implements WorkspaceService {
	@Autowired
	private WorkspaceDao workspaceDao;
	
	@Override
	public void workspaceWrite(WorkspaceDto workspaceDto) {
		workspaceDao.workspaceWrite(workspaceDto);
	}
	
	@Override
	public List<WorkspaceDto> workListService(){
		return workspaceDao.workList();
	}
	
	@Override
	public int workInsertService(WorkspaceDto workspaceDto){
		return workspaceDao.workInsert(workspaceDto);
	}
	
	@Override
	public void workWrite(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();
		
		HttpServletRequest request = (HttpServletRequest) model.get("request");
		
		WorkspaceDto workspaceDto = new WorkspaceDto();
		workspaceDto.setWorkSender(request.getParameter("workSender"));
		workspaceDto.setWorkReceiver(request.getParameter("workReceiver"));
		workspaceDto.setWorkSubject(request.getParameter("workSubject"));
		workspaceDto.setWorkContent(request.getParameter("workContent"));
		workspaceDto.setWorkState(Integer.parseInt(request.getParameter("workState")));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			workspaceDto.setWorkStartDate(sdf.parse(request.getParameter("workStartDate")));
			workspaceDto.setWorkStartDate(sdf.parse(request.getParameter("workStartDate")));
		} catch (ParseException e) {
			e.printStackTrace();
		}

		int check = workspaceDao.workInsert(workspaceDto);
		mav.addObject("check", check);		
	}
}
