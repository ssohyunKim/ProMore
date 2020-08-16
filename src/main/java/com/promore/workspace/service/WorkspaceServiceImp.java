package com.promore.workspace.service;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.promore.member.dto.MemberDto;
import com.promore.workspace.dao.WorkspaceDao;
import com.promore.workspace.dto.ReplyLikeDto;
import com.promore.workspace.dto.WorkReplyDto;
import com.promore.workspace.dto.WorkspaceDto;

@Component
public class WorkspaceServiceImp implements WorkspaceService {
	@Autowired
	private WorkspaceDao workspaceDao;

	@Override
	@Transactional
	public void getAllWork(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();

		HttpServletRequest req = (HttpServletRequest) model.get("req");
		HttpSession sess = (HttpSession) req.getSession();

		WorkspaceDto workspaceDto = new WorkspaceDto();
		workspaceDto.setProNum(Integer.parseInt(req.getParameter("proNum")));

		List<WorkspaceDto> list = workspaceDao.selectAllWork(workspaceDto);

		for (WorkspaceDto workDto : list) {
			List<WorkReplyDto> replyDtos = workspaceDao.selectAllReply(workDto);
			for (WorkReplyDto replyDto : replyDtos) {
				ReplyLikeDto likeDto = new ReplyLikeDto();
				MemberDto memberDto = (MemberDto) sess.getAttribute("memberDto");
				likeDto.setMemId((String) memberDto.getMemId());
				likeDto.setReplyNum(replyDto.getReplyNum());
				replyDto.setReplyLike(workspaceDao.selectLikeCnt(likeDto));
				replyDto.setCanClickLike(workspaceDao.selectLikeForChk(likeDto) == 1 ? false : true);
			}
			workDto.setWorkReplyDto(replyDtos);
		}

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

		String workNum = null;
		String replyNum = null;
		WorkspaceDto workspaceDto = null;
		WorkReplyDto workReplyDto = null;
		String fileName = null;
		String filePath = null;
		int fileSize = 0;

		if ((workNum = req.getParameter("workNum")) != null) {
			workspaceDto = new WorkspaceDto();
			workspaceDto.setWorkNum(Integer.parseInt(workNum));
			workspaceDto = workspaceDao.selectFileInfo(workspaceDto);

			fileName = workspaceDto.getWorkFileName();
			filePath = workspaceDto.getWorkFilePath();
			fileSize = (int) workspaceDto.getWorkFileSize();
		} else if ((replyNum = req.getParameter("replyNum")) != null) {
			workReplyDto = new WorkReplyDto();
			workReplyDto.setReplyNum(Integer.parseInt(replyNum));
			workReplyDto = workspaceDao.selectFileInfo_2(workReplyDto);

			fileName = workReplyDto.getReplyFileName();
			filePath = workReplyDto.getReplyFilePath();
			fileSize = (int) workReplyDto.getReplyFileSize();
		}

		mav.addObject("fileName", fileName);
		mav.addObject("filePath", filePath);
		mav.addObject("fileSize", fileSize);
	}

	@Override
	@Transactional
	public void deleteFile(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();

		HttpServletRequest req = (HttpServletRequest) model.get("req");

		String workNum = null;
		String replyNum = null;
		WorkspaceDto updatedFileInfo = new WorkspaceDto();
		WorkReplyDto updatedFileInfo_2 = new WorkReplyDto();
		WorkspaceDto deletedFileInfo = null;
		WorkReplyDto deletedFileInfo_2 = null;
		String path = null;
		File file = null;

		if ((workNum = req.getParameter("workNum")) != null) {
			updatedFileInfo.setWorkNum(Integer.parseInt(workNum));
			deletedFileInfo = workspaceDao.selectFileInfo(updatedFileInfo);
			path = deletedFileInfo.getWorkFilePath();
			file = new File(path);
			if (workspaceDao.updateFileInfo(updatedFileInfo) == 1 && file != null && file.delete())
				mav.addObject("chk", 1);
			else
				mav.addObject("chk", 0);
		} else if ((replyNum = req.getParameter("replyNum")) != null) {
			updatedFileInfo_2.setReplyNum(Integer.parseInt(replyNum));
			deletedFileInfo_2 = workspaceDao.selectFileInfo_2(updatedFileInfo_2);
			path = deletedFileInfo_2.getReplyFilePath();
			file = new File(path);
			if (workspaceDao.updateFileInfo_2(updatedFileInfo_2) == 1 && file != null && file.delete())
				mav.addObject("chk", 1);
			else
				mav.addObject("chk", 0);
		}
	}

	@Override
	@Transactional
	public void addReply(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();
		MultipartHttpServletRequest req = (MultipartHttpServletRequest) model.get("req");
		HttpSession sess = req.getSession();

		WorkReplyDto workReplyDto = new WorkReplyDto();
		MemberDto memberDto = (MemberDto) sess.getAttribute("memberDto");
		workReplyDto.setReplyId((String) memberDto.getMemId());
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

		if (workspaceDao.insertReply(workReplyDto) == 1)
			mav.addObject("num", workspaceDao.selectReplyNum());
	}

	@Override
	public void deleteReply(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();
		HttpServletRequest req = (HttpServletRequest) model.get("req");

		WorkReplyDto workReplyDto = new WorkReplyDto();
		workReplyDto.setReplyNum(Integer.parseInt(req.getParameter("replyNum")));

		mav.addObject("chk", workspaceDao.deleteReply(workReplyDto));
	}

	@Override
	public void editReply(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();
		MultipartHttpServletRequest req = (MultipartHttpServletRequest) model.get("req");

		WorkReplyDto workReplyDto = new WorkReplyDto();
		workReplyDto.setReplyContent(req.getParameter("replyContent"));
		workReplyDto.setReplyNum(Integer.parseInt(req.getParameter("replyNum")));

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
					
					workspaceDao.updateFileInfo_2(workReplyDto);
				} catch (Exception e) {
					e.printStackTrace();
					mav.addObject("num", 0);
					return;
				}
			}
		}

		mav.addObject("chk", workspaceDao.updateReply(workReplyDto));
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public void likeReply(ModelAndView mav) {
		Map<String, Object> model = mav.getModel();
		HttpServletRequest req = (HttpServletRequest) model.get("req");
		HttpSession sess = (HttpSession) req.getSession();

		ReplyLikeDto replyLikeDto = new ReplyLikeDto();

		MemberDto memberDto = (MemberDto) sess.getAttribute("memberDto");
		replyLikeDto.setMemId((String) memberDto.getMemId());
		replyLikeDto.setReplyNum(Integer.parseInt(req.getParameter("replyNum")));

		JSONObject jsonObj = new JSONObject();
		JSONObject jsonInObj = new JSONObject();

		int chk = workspaceDao.selectLikeForChk(replyLikeDto);
		jsonInObj.put("chk", chk);
		if (chk == 0) {
			workspaceDao.insertLike(replyLikeDto);
			jsonInObj.put("cnt", workspaceDao.selectLikeCnt(replyLikeDto));
		}
		jsonObj.put("result", jsonInObj);

		mav.addObject("jsonObj", jsonObj);
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
