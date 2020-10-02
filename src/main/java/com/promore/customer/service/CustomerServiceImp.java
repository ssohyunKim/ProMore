package com.promore.customer.service;

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
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.promore.aop.HAspect;
import com.promore.customer.dao.CustomerDao;
import com.promore.customer.dto.CustomerDto;
import com.promore.manager.dao.ManagerDao;
import com.promore.manager.dto.NoticeDto;

/**
 * @Author	: sohyunkim
 * @Descriptions :고객게시판(1:1문의하기, 공지사항)
 */
@Component
public class CustomerServiceImp implements CustomerService {
	@Autowired
	private CustomerDao customerDao;
	
	@Override
	public void customerBoardWriteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		CustomerDto customerDto = (CustomerDto) map.get("customerDto");
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		
		customerDto.setCusNum(0);
		customerDto.setCusState(0);
		customerDto.setCusDate(new Date());
		customerDto.setCusId(id);
		
		MultipartFile upFile = request.getFile("file");
		
		if(upFile.getSize()!=0) {
			String fileName = Long.toString(System.currentTimeMillis())+ "_" + upFile.getOriginalFilename();
			long fileSize = upFile.getSize();
			
			File path = new File("C:\\promore\\");
			path.mkdir();
			
			if(path.exists() && path.isDirectory()) {
				File file = new File(path, fileName);
				
				try {
					upFile.transferTo(file);
					
					customerDto.setCusFilePath(file.getAbsolutePath());
					customerDto.setCusFileName(fileName);
					customerDto.setCusFileSize(fileSize);
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		HAspect.logger.info(HAspect.logMsg +customerDto);
		
		int check = customerDao.customerBoardWrite(customerDto);
		HAspect.logger.info(HAspect.logMsg + check);
		
		mav.addObject("check", check);
	}
	
	/* 글리스트 보기 */
	@Override
	public void customerBoardList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		//ID 값 넘겨줘서 체크 id
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		List<CustomerDto> boardList = null;
	
		boardList = customerDao.customerBoardList(id);

		mav.addObject("boardList", boardList);
		mav.setViewName("customer/inquireList");
	}
	
	/* 작성한글 삭제 */
	@Override
	public void customerBoardDeleteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int cusNum = Integer.parseInt(request.getParameter("cusNum"));
		
		int check = customerDao.customerBoardDelete(cusNum);
		
		mav.addObject("check", check);
	}
	
	/* 작성한글 수정 */
	@Override
	public void customerBoardUpdateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");

		int cusNum = Integer.parseInt(request.getParameter("cusNum"));
		CustomerDto customerDto = (CustomerDto) map.get("customerDto");
		customerDto.setCusDate(new Date());
		
		MultipartFile upFile = request.getFile("file");
		
		
		if(upFile.getSize()!=0) {
			//저장경로, 파일명, 사이즈
			String fileName = Long.toString(System.currentTimeMillis())+ "_" + upFile.getOriginalFilename();
			long fileSize = upFile.getSize();
			
			File path = new File("C:\\pds\\");
			path.mkdir();
			
			if(path.exists() && path.isDirectory()) {
				File file = new File(path, fileName);
				
				try {
					upFile.transferTo(file);
					
					customerDto.setCusFilePath(file.getAbsolutePath());
					customerDto.setCusFileName(fileName);
					customerDto.setCusFileSize(fileSize);
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			}

		}
		
		int check = customerDao.customerBoardUpdateOk(customerDto);
		
		mav.addObject("check", check);
	}
	
	/* 파일 다운로드 */
	public void fileDownload(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpServletResponse response = (HttpServletResponse) map.get("response");

		int cusNum = Integer.parseInt(request.getParameter("cusNum"));
		//HAspect.logger.info(HAspect.logMsg + cusNum);

		CustomerDto customerDto = customerDao.customerBoardRead(cusNum);

		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;

		try {
			int index = customerDto.getCusFileName().indexOf("_") + 1;
			String fName = customerDto.getCusFileName().substring(index);
			String fileName = new String(fName.getBytes("utf-8"), "ISO-8859-1");

			long fileSize = customerDto.getCusFileSize();
			String path = customerDto.getCusFilePath();

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
	
	/* 공지사항 리스트 */
	@Override
	public void noticeBoardList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		List<NoticeDto> boardList = null;
	
		boardList = customerDao.noticeBoardList();

		mav.addObject("boardList", boardList);
		mav.setViewName("customer/noticeList");
	}
	
	/* 조회수 증가 */
	@Override
	public void noticeBoardUpdateCount(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int noticeNum = Integer.parseInt(request.getParameter("notNum"));
		
		int check = customerDao.noticeBoardUpdateCount(noticeNum);
		
		mav.addObject("check", check);
	}
}
