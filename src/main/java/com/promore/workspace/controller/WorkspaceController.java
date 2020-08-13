package com.promore.workspace.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.promore.aop.HAspect;
import com.promore.workspace.dto.WorkspaceDto;
import com.promore.workspace.service.WorkspaceService;

@Controller
public class WorkspaceController {
	@Autowired
	private WorkspaceService workspaceService;

	// 페이지 조회(모든 일감 가져오기)
	@RequestMapping(value = "/workspace/workspace.do", method = RequestMethod.GET)
	public ModelAndView getAllWork(HttpServletRequest req, HttpServletResponse resp) {
		HAspect.logger.info(HAspect.logMsg + "workspace");

		ModelAndView mav = new ModelAndView();
		mav.addObject("req", req);
		workspaceService.getAllWork(mav);

		return mav;
	}

	// 일감 생성
	@RequestMapping(value = "/workspace/add-work.do", method = RequestMethod.POST)
	public void addWork(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("req", req);
		workspaceService.addWork(mav);

		resp.setHeader("Content-Type", "plain/text;charset=utf-8");
		try {
			resp.getWriter().println(mav.getModel().get("num"));
			resp.flushBuffer();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 일감 수정
	@RequestMapping(value = "/workspace/edit-work.do", method = RequestMethod.POST)
	public void editWork(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("req", req);
		workspaceService.editWork(mav);

		resp.setHeader("Content-Type", "plain/text;charset=utf-8");
		try {
			resp.getWriter().println(mav.getModel().get("chk"));
			resp.flushBuffer();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

//	@RequestMapping("/workspace/workList.do") // 댓글 리스트
//	@ResponseBody
//	private List<WorkspaceDto> workServiceList(Model model) throws Exception {
//		return workspaceService.workListService();
//	}

//	@RequestMapping("/workspace/workInsert.do") // 댓글 작성
//	@ResponseBody
//	private int workServiceInsert(@RequestParam HashMap<String, Object> paramMap) throws Exception {
//
//		WorkspaceDto workspaceDto = new WorkspaceDto();
//		workspaceDto.setWorkNum((Integer) (paramMap.get("workNum")));
//		workspaceDto.setWorkContent((String) paramMap.get("workContent"));
//
//		return workspaceService.workInsertService(workspaceDto);
//	}
}
