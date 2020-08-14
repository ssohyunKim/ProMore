package com.promore.workspace.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.promore.aop.HAspect;
import com.promore.project.service.ProjectService;
import com.promore.workspace.dto.WorkspaceDto;
import com.promore.workspace.service.WorkspaceService;

@Controller
public class WorkspaceController {
	@Autowired
	private WorkspaceService workspaceService;
	@Autowired
	private ProjectService projectservice;

	// 페이지 조회(모든 일감 가져오기) + 프로젝트 정보가져오기 위해 추가 시켰습니다!(최정윤)
	@RequestMapping(value = "/workspace/workspace.do", method = RequestMethod.GET)
	public ModelAndView getAllWork(HttpServletRequest req, HttpServletResponse resp) {
		HAspect.logger.info(HAspect.logMsg + "workspace");

		ModelAndView mav = new ModelAndView();
		mav.addObject("req", req);
		workspaceService.getAllWork(mav);
		
		
		//프로젝트 정보(추가)
		projectservice.projectList(mav);

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

	// 일감 삭제
	@RequestMapping(value = "/workspace/delete-work.do", method = RequestMethod.GET)
	public void deleteWork(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("req", req);
		workspaceService.deleteWork(mav);

		resp.setHeader("Content-Type", "plain/text;charset=utf-8");
		try {
			resp.getWriter().println(mav.getModel().get("chk"));
			resp.flushBuffer();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 파일 다운로드
	@RequestMapping(value = "/workspace/download.do", method = RequestMethod.GET)
	public void download(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("req", req);
		workspaceService.download(mav);

		WorkspaceDto fileInfo = (WorkspaceDto) mav.getModel().get("fileInfo");
		try {
			String fileNameToLatin1 = new String(
					fileInfo.getWorkFileName().substring(fileInfo.getWorkFileName().indexOf("_") + 1).getBytes("UTF-8"),
					"ISO-8859-1");

			resp.setHeader("Content-Type", "application/octet-stream;charset=utf-8");
			resp.setHeader("Content-Disposition", "attachment; filename=" + fileNameToLatin1);
			resp.setContentLength((int) fileInfo.getWorkFileSize());

			BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream(), 512);
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(fileInfo.getWorkFilePath()), 512);

			byte[] buff = new byte[512];
			while (bis.read(buff) != -1)
				bos.write(buff);
			bos.flush();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// 파일 삭제
	@RequestMapping(value = "/workspace/delete-file.do", method = RequestMethod.GET)
	public void deleteFile(HttpServletRequest req, HttpServletResponse resp) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("req", req);
		workspaceService.deleteFile(mav);

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
	
	
	//추가사항
	//일감 현황
	@RequestMapping(value = "/workspace/workState.do", method = RequestMethod.GET)
	public ModelAndView projectWorkState(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		HAspect.logger.info(HAspect.logMsg + "ModelAndView" + id);
		session.setAttribute("id", id);
		mav.addObject("request", request);
		mav.addObject("id", id);
		
		//일감 정보 가져오기
		workspaceService.workState(mav, id);
		//프로젝트 이름 가져오기
		
		//프로젝트 테이블 가져오기
		projectservice.projectList(mav);

		return mav;
	}
	
	
}
