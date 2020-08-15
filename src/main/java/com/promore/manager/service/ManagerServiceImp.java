package com.promore.manager.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.promore.aop.HAspect;
import com.promore.customer.dto.CustomerDto;
import com.promore.manager.dao.ManagerDao;
import com.promore.manager.dto.NoticeDto;
import com.promore.member.dao.MemberDao;
import com.promore.member.dto.MemberDto;

@Component
public class ManagerServiceImp implements ManagerService {
	@Autowired
	private ManagerDao managerDao;

	@Override
	public void noticeList(ModelAndView mav) {
		int noticeCount = managerDao.noticeCount();
		List<NoticeDto> noticeDtoArray = managerDao.noticeList();

		mav.addObject("noticeDtoArray", noticeDtoArray); // 전체 게시물
		mav.addObject("noticeCount", noticeCount); // 전체 게시물 개수

		HAspect.logger.info(HAspect.logMsg + noticeDtoArray.size());
	}

	@Override
	public void noticeWriteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		NoticeDto noticeDto = (NoticeDto) map.get("noticeDto");
		MultipartHttpServletRequest multipartResolver = (MultipartHttpServletRequest) map.get("request");

		noticeDto.setNotWriteDate(new Date());
		noticeDto.setNotReadCount(0);

		MultipartFile upFile = multipartResolver.getFile("file");

		if (upFile.getSize() != 0) {
			// 저장경로, 파일명, 사이즈
			String fileName = Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();
			Long fileSize = upFile.getSize();

			File path = new File("C:\\pds\\");
			path.mkdir();

			if (path.exists() && path.isDirectory()) {
				File file = new File(path, fileName);

				try {
					upFile.transferTo(file);

					noticeDto.setNotFilePath(file.getAbsolutePath());
					noticeDto.setNotFileName(fileName);
					noticeDto.setNotFileSize(fileSize);

				} catch (Exception e) {

					e.printStackTrace();
				}
			}
		}

		HAspect.logger.info(HAspect.logMsg + noticeDto);

		int check = managerDao.noticeWrite(noticeDto);
		HAspect.logger.info(HAspect.logMsg + check);

		mav.addObject("check", check);
		mav.setViewName("manager/noticeWriteOk");
	}

	@Override
	public void noticeUpdateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		NoticeDto noticeDto = (NoticeDto) map.get("noticeDto");
		MultipartHttpServletRequest request = (MultipartHttpServletRequest) map.get("request");

		MultipartFile upFile = request.getFile("file");

		if (upFile.getSize() != 0) {
			// 저장경로, 파일명, 사이즈
			String fileName = Long.toString(System.currentTimeMillis()) + "_" + upFile.getOriginalFilename();
			Long fileSize = upFile.getSize();

			File path = new File("C:\\pds\\");
			path.mkdir();

			if (path.exists() && path.isDirectory()) {
				File file = new File(path, fileName);

				try {
					upFile.transferTo(file);

					noticeDto.setNotFilePath(file.getAbsolutePath());
					noticeDto.setNotFileName(fileName);
					noticeDto.setNotFileSize(fileSize);

				} catch (Exception e) {

					e.printStackTrace();

				}
			}
		}

		HAspect.logger.info(HAspect.logMsg + noticeDto);

		int check = managerDao.noticeUpdate(noticeDto);
		HAspect.logger.info(HAspect.logMsg + check);

		mav.addObject("check", check);
		mav.setViewName("manager/noticeUpdateOk");
	}

	public void noticeFileDownload(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");

		int notNum = Integer.parseInt(request.getParameter("notNum"));
		HAspect.logger.info(HAspect.logMsg + notNum);

		NoticeDto noticeDto = managerDao.noticeSelect(notNum);
		HAspect.logger.info(HAspect.logMsg + noticeDto);

		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;

		try {
			int index = noticeDto.getNotFileName().indexOf("_") + 1;
			String fName = noticeDto.getNotFileName().substring(index);
			String fileName = new String(fName.getBytes("utf-8"), "ISO-8859-1");

			long fileSize = noticeDto.getNotFileSize();
			String path = noticeDto.getNotFilePath();

			response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);
			response.setContentType("application/octet-stream");
			response.setContentLength((int) fileSize);

			bis = new BufferedInputStream(new FileInputStream(path), 1024);
			bos = new BufferedOutputStream(response.getOutputStream(), 1024);

			while (true) {
				int data = bis.read();
				if (data == -1) break;
				bos.write(data);
			}
			bos.flush();

		} catch (IOException e) {

			e.printStackTrace();

		} finally {

			try {
				if (bis != null)
					bis.close();
				if (bos != null)
					bos.close();

			} catch (Exception e) {

				e.printStackTrace();
			}
		}
	}

	@Override
	public void noticeDelete(ModelAndView mav) {

		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int notNum = Integer.parseInt(request.getParameter("notNum"));
		HAspect.logger.info(HAspect.logMsg + notNum);

		NoticeDto noticeDto = managerDao.noticeSelect(notNum);
		HAspect.logger.info(HAspect.logMsg + noticeDto);

		int check = managerDao.noticeDelete(notNum);

		if (check > 0 && noticeDto.getNotFilePath() != null) {

			File file = new File(noticeDto.getNotFilePath());

			if (file.exists() && file.isFile()) {
				file.delete();
			}
		}

		mav.addObject("check", check);
		mav.setViewName("manager/noticeDeleteOk");
	}

	@Override
	public void reportList(ModelAndView mav) {
		int reportCount = managerDao.reportCount();
		List<CustomerDto> reportArray = managerDao.reportList();

		mav.addObject("reportArray", reportArray); // 전체 게시물
		mav.addObject("reportCount", reportCount); // 전체 게시물 개수

		HAspect.logger.info(HAspect.logMsg + reportArray.size());
	}
	
	public void reportFileDownload(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");

		int cusNum = Integer.parseInt(request.getParameter("cusNum"));
		HAspect.logger.info(HAspect.logMsg + cusNum);

		CustomerDto reportDto = managerDao.reportSelect(cusNum);
		HAspect.logger.info(HAspect.logMsg + reportDto);

		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;

		try {
			int index = reportDto.getCusFileName().indexOf("_") + 1;
			String fName = reportDto.getCusFileName().substring(index);
			String fileName = new String(fName.getBytes("utf-8"), "ISO-8859-1");

			long fileSize = reportDto.getCusFileSize();
			String path = reportDto.getCusFilePath();

			response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);
			response.setContentType("application/octet-stream");
			response.setContentLength((int) fileSize);

			bis = new BufferedInputStream(new FileInputStream(path), 1024);
			bos = new BufferedOutputStream(response.getOutputStream(), 1024);

			while (true) {
				int data = bis.read();
				if (data == -1) break;
				bos.write(data);
			}
			bos.flush();

		} catch (IOException e) {

			e.printStackTrace();

		} finally {

			try {
				if (bis != null)
					bis.close();
				if (bos != null)
					bos.close();

			} catch (Exception e) {

				e.printStackTrace();
			}
		}
	}
	
	@Override
	public void reportStateChange(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int cusNum = Integer.parseInt(request.getParameter("cusNum"));
		HAspect.logger.info(HAspect.logMsg + cusNum);

		int check = managerDao.reportStateChange(cusNum);

		mav.addObject("check", check);
		mav.setViewName("manager/reportStateChangeOk");
		
	}

	@Override
	public void memberList(ModelAndView mav) {
		int memberCount = managerDao.memberCount();
		HAspect.logger.info(HAspect.logMsg + memberCount);

		List<MemberDto> memberDtoArray = managerDao.memberList();

		mav.addObject("memberCount", memberCount);
		mav.addObject("memberDtoArray", memberDtoArray);

		HAspect.logger.info(HAspect.logMsg + memberDtoArray);

	}

	@Override
	public void memberDelete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int memNum = Integer.parseInt(request.getParameter("memNum"));
		HAspect.logger.info(HAspect.logMsg + memNum);

		MemberDto memberDto = managerDao.memberSelect(memNum);
		HAspect.logger.info(HAspect.logMsg + memberDto);

		int check = managerDao.memberDelete(memNum);

		mav.addObject("check", check);
		mav.setViewName("manager/memberDeleteOk");
	}
	
	
}
