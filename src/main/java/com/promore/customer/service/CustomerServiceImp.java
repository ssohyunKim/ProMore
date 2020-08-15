package com.promore.customer.service;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.promore.aop.HAspect;
import com.promore.customer.dao.CustomerDao;
import com.promore.customer.dto.CustomerDto;
import com.promore.manager.dto.NoticeDto;
import com.promore.manager.dao.ManagerDao;

@Component
public class CustomerServiceImp implements CustomerService {
	@Autowired
	private CustomerDao customerDao;
	private ManagerDao noticeDao;

	/* 글작성 하기 */
	@Override
	public void customerBoardWriteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		CustomerDto customerDto = (CustomerDto) map.get("customerDto");
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		
		customerDto.setCusNum(0);
		customerDto.setCusState(0);
		customerDto.setCusDate(new Date());
		customerDto.setCusId("test");
		
		MultipartFile upFile = request.getFile("file");
		HAspect.logger.info(HAspect.logMsg + customerDto);
		
		
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
		mav.setViewName("customer/inquireWrite");
	}
	
	/* 글리스트 보기 */
	@Override
	public void customerBoardList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		//ID 값 넘겨줘서 체크 String customerId = request.getParameter("id");
		String customerId = "test";

		List<CustomerDto> boardList = null;
	
		boardList = customerDao.customerBoardList(customerId);
		HAspect.logger.info(HAspect.logMsg + boardList.size());

		mav.addObject("boardList", boardList);
		mav.setViewName("customer/inquireList");
	}
	
	/* 작성한글 삭제 */
	@Override
	public void customerBoardDeleteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int cusNum = Integer.parseInt(request.getParameter("cusNum"));
		HAspect.logger.info(HAspect.logMsg + cusNum);
		
		int check = customerDao.customerBoardDelete(cusNum);
		HAspect.logger.info(HAspect.logMsg + check);
		
		mav.addObject("check", check);
		mav.setViewName("customer/inquireDelete");
	}
	
	/* 작성한글 수정 */
	@Override
	public void customerBoardUpdateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");

		int cusNum = Integer.parseInt(request.getParameter("cusNum"));
		System.out.println(cusNum + "###");
		CustomerDto customerDto = (CustomerDto) map.get("customerDto");
		System.out.println(customerDto);
		customerDto.setCusDate(new Date());
		
		MultipartFile upFile = request.getFile("file");
		HAspect.logger.info(HAspect.logMsg + upFile.getOriginalFilename());
		
		
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
		HAspect.logger.info(HAspect.logMsg +customerDto);
		
		int check = customerDao.customerBoardUpdateOk(customerDto);
		HAspect.logger.info(HAspect.logMsg + check);
		
		mav.addObject("check", check);
		mav.setViewName("customer/inquireUpdate");
	}
	
	@Override
	public void noticeBoardList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		List<NoticeDto> boardList = null;
	
		boardList = customerDao.noticeBoardList();
		HAspect.logger.info(HAspect.logMsg + boardList.size());

		mav.addObject("boardList", boardList);
		mav.setViewName("customer/noticeList");
	}
	
	@Override
	public void noticeBoardUpdateCount(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModel();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int noticeNum = Integer.parseInt(request.getParameter("notNum"));
		
		HAspect.logger.info(HAspect.logMsg + noticeNum);
		
		int check = customerDao.noticeBoardUpdateCount(noticeNum);
		
		HAspect.logger.info(HAspect.logMsg + check);

		mav.addObject("check", check);
	}
}
