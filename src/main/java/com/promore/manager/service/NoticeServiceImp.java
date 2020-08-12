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
import com.promore.manager.dao.NoticeDao;
import com.promore.manager.dto.NoticeDto;

@Component
public class NoticeServiceImp implements NoticeService {
	@Autowired
	private NoticeDao noticeDao;

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

		int check = noticeDao.noticeWrite(noticeDto);
		HAspect.logger.info(HAspect.logMsg + check);

		mav.addObject("check", check);
		mav.setViewName("manager/noticeWriteOk");
	}

	@Override
	public void noticeList(ModelAndView mav) {
		int noticeCount = noticeDao.noticeCount();
		List<NoticeDto> noticeDtoArray = noticeDao.noticeList();

		mav.addObject("noticeDtoArray", noticeDtoArray); // 전체 게시물
		mav.addObject("noticeCount", noticeCount); // 전체 게시물 개수

		HAspect.logger.info(HAspect.logMsg + noticeDtoArray.size());
	}

	@Override
	public void noticeLoad(ModelAndView mav) {

		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int notNum = Integer.parseInt(request.getParameter("notNum"));
		HAspect.logger.info(HAspect.logMsg + notNum);
		
		NoticeDto noticeDto = noticeDao.noticeLoad(notNum);
		HAspect.logger.info(HAspect.logMsg + noticeDto);
		
		if(noticeDto.getNotFileName()!=null) {
			int index = noticeDto.getNotFileName().indexOf("_")+1;
			noticeDto.setNotFileName(noticeDto.getNotFileName().substring(index));
		}
		
		mav.addObject("noticeDto", noticeDto);
		mav.setViewName("fileBoard/read");
	}
	
	/*
	 * public void fileDownload(ModelAndView mav) { Map<String, Object> map =
	 * mav.getModelMap(); HttpServletRequest request = (HttpServletRequest)
	 * map.get("request"); HttpServletResponse response = (HttpServletResponse)
	 * map.get("response");
	 * 
	 * int notNum = Integer.parseInt(request.getParameter("notNum"));
	 * HAspect.logger.info(HAspect.logMsg + notNum);
	 * 
	 * NoticeDto noticeDto = noticeDao.noticeSelect(notNum);
	 * HAspect.logger.info(HAspect.logMsg + noticeDto);
	 * 
	 * BufferedInputStream bis = null; BufferedOutputStream bos = null;
	 * 
	 * try {
	 * 
	 * int index = noticeDto.getNotFileName().indexOf("_") + 1; String fName =
	 * noticeDto.getNotFileName().substring(index); String fileName = new
	 * String(fName.getBytes("utf-8"), "ISO-8859-1");
	 * 
	 * long fileSize = noticeDto.getNotFileSize(); String path =
	 * noticeDto.getNotFilePath();
	 * 
	 * response.setHeader("Content-Disposition", "attachment;fileName=" + fileName);
	 * response.setContentType("application/octet-stream");
	 * response.setContentLength((int) fileSize);
	 * 
	 * bis = new BufferedInputStream(new FileInputStream(path), 1024); bos = new
	 * BufferedOutputStream(response.getOutputStream(), 1024);
	 * 
	 * while (true) { int data = bis.read(); if (data == -1) break; bos.write(data);
	 * } bos.flush();
	 * 
	 * } catch (IOException e) {
	 * 
	 * e.printStackTrace();
	 * 
	 * } finally {
	 * 
	 * try { if (bis != null) bis.close(); if (bos != null) bos.close();
	 * 
	 * } catch (Exception e) {
	 * 
	 * e.printStackTrace(); } } }
	 */
}
