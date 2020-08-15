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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.promore.workspace.dao.WorkspaceDao;
import com.promore.workspace.dto.WorkReplyDto;
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

		MultipartHttpServletRequest req = (MultipartHttpServletRequest) model.get("req");

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

		MultipartFile uploadFile = req.getFile("inputFile");

		if (uploadFile != null && uploadFile.getSize() > 0) {
			String fileName = Long.toString(System.currentTimeMillis()) + "_" + uploadFile.getOriginalFilename();
			Long fileSize = uploadFile.getSize();

			File store = new File("C:\\pds\\");
			store.mkdir();

			if (store.exists() && store.isDirectory()) {
				File dstFile = new File(store, fileName);

				try {
					uploadFile.transferTo(dstFile);

					workspaceDto.setWorkFilePath(dstFile.getAbsolutePath());
					workspaceDto.setWorkFileName(fileName);
					workspaceDto.setWorkFileSize(fileSize);
				} catch (Exception e) {
					e.printStackTrace();
					mav.addObject("num", 0);
					return;
				}
			}
		}

		System.out.println(workspaceDto);

		int chk = workspaceDao.insertWork(workspaceDto);
		if (chk == 1)
			mav.addObject("num", workspaceDao.selectWorkNum());
	}

	@Override
	@Transactional
	public void editWork(ModelAndView mav) {
		int chk = 1;
		Map<String, Object> model = mav.getModel();

		MultipartHttpServletRequest req = (MultipartHttpServletRequest) model.get("req");

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

		MultipartFile uploadFile = req.getFile("inputFile");

		if (uploadFile != null && uploadFile.getSize() > 0) {
			// 기존 파일 삭제
			WorkspaceDto existingFileInfo = new WorkspaceDto();
			existingFileInfo.setWorkNum(workspaceDto.getWorkNum());
			existingFileInfo = workspaceDao.selectFileInfo(workspaceDto);
			if (existingFileInfo.getWorkFileSize() > 0)
				deleteFile(mav);

			String fileName = Long.toString(System.currentTimeMillis()) + "_" + uploadFile.getOriginalFilename();
			Long fileSize = uploadFile.getSize();

			File store = new File("C:\\pds\\");
			store.mkdir();

			if (store.exists() && store.isDirectory()) {
				File dstFile = new File(store, fileName);

				try {
					uploadFile.transferTo(dstFile);

					workspaceDto.setWorkFilePath(dstFile.getAbsolutePath());
					workspaceDto.setWorkFileName(fileName);
					workspaceDto.setWorkFileSize(fileSize);

					chk = workspaceDao.updateFileInfo(workspaceDto);
				} catch (Exception e) {
					e.printStackTrace();
					mav.addObject("num", 0);
					return;
				}
			}
		}
		
		System.out.println(workspaceDto);

		if (chk == 1)
			mav.addObject("chk", workspaceDao.updateWork(workspaceDto));
	}

	@Override
	public void deleteWork(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();

		HttpServletRequest req = (HttpServletRequest) model.get("req");

		WorkspaceDto workspaceDto = new WorkspaceDto();
		workspaceDto.setWorkNum(Integer.parseInt(req.getParameter("workNum")));

		mav.addObject("chk", workspaceDao.deleteWork(workspaceDto));
	}

	@Override
	public void download(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();

		HttpServletRequest req = (HttpServletRequest) model.get("req");

		WorkspaceDto workspaceDto = new WorkspaceDto();
		workspaceDto.setWorkNum(Integer.parseInt(req.getParameter("workNum")));

		mav.addObject("fileInfo", workspaceDao.selectFileInfo(workspaceDto));
	}

	@Override
	@Transactional
	public void deleteFile(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();

		HttpServletRequest req = (HttpServletRequest) model.get("req");

		WorkspaceDto updatedFileInfo = new WorkspaceDto();
		updatedFileInfo.setWorkNum(Integer.parseInt(req.getParameter("workNum")));

		WorkspaceDto deletedFileInfo = workspaceDao.selectFileInfo(updatedFileInfo);
		String path = deletedFileInfo.getWorkFilePath();
		System.out.println(path);
		File file = new File(path);

		if (workspaceDao.updateFileInfo(updatedFileInfo) == 1 && file != null && file.delete())
			mav.addObject("chk", 1);
		else
			mav.addObject("chk", 0);
	}

	@Override
	@Transactional
	public void addReply(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();
		MultipartHttpServletRequest req = (MultipartHttpServletRequest) model.get("req");

		WorkReplyDto workReplyDto = new WorkReplyDto();
//		workReplyDto.setReplyId(session.getAttribute("id"));
		workReplyDto.setReplyId(req.getParameter("replyId"));
		workReplyDto.setReplyContent(req.getParameter("replyContent"));
		workReplyDto.setWorkNum(Integer.parseInt(req.getParameter("workNum")));

		MultipartFile uploadFile = req.getFile("inputFile");

		if (uploadFile != null && uploadFile.getSize() > 0) {
			String fileName = Long.toString(System.currentTimeMillis()) + "_" + uploadFile.getOriginalFilename();
			long fileSize = uploadFile.getSize();

			File store = new File("C:\\pds\\");
			store.mkdir();

			if (store.exists() && store.isDirectory()) {
				File dstFile = new File(store, fileName);

				try {
					uploadFile.transferTo(dstFile);

					workReplyDto.setReplyFilePath(dstFile.getAbsolutePath());
					workReplyDto.setReplyFileName(fileName);
					workReplyDto.setReplyFileSize(fileSize);
				} catch (Exception e) {
					e.printStackTrace();
					mav.addObject("num", 0);
					return;
				}
			}
		}
		System.out.println(workReplyDto);

		if (workspaceDao.insertReply(workReplyDto)== 1)
			mav.addObject("num", workspaceDao.selectReplyNum());
	}

	@Override
	public void workState(ModelAndView mav, String id) {
		int workCount = workspaceDao.workCount(id);
		System.out.println("workStatOk" + workCount);

		List<WorkspaceDto> workDtoArr = workspaceDao.workList(id);
		System.out.println("workstate" + workDtoArr);

		mav.addObject("workDtoArray", workDtoArr);
		mav.addObject("workCount", workCount);
		mav.setViewName("workspace/workState");

	}

}
