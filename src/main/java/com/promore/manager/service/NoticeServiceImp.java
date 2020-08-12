package com.promore.manager.service;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
		
		mav.addObject("noticeDtoArray", noticeDtoArray);	// 전체 게시물
		mav.addObject("noticeCount", noticeCount);			// 전체 게시물 개수
		
		HAspect.logger.info(HAspect.logMsg + noticeDtoArray.size());
	}
	
}
