package com.promore.customer.service;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
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

@Component
public class CustomerServiceImp implements CustomerService {
	@Autowired
	private CustomerDao customerDao;

	/* 글작성 하기 */
	@Override
	public void customerBoardWriteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		CustomerDto customerDto = (CustomerDto) map.get("customerDto");
		MultipartHttpServletRequest request = (MultipartHttpServletRequest)map.get("request");
		
		
		writeNumber(customerDto);
		customerDto.setCusDate(new Date());
		customerDto.setCusId("test");
		
		MultipartFile upFile = request.getFile("file");
		HAspect.logger.info(HAspect.logMsg + customerDto);
		
		
		if(upFile!=null) {
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
		
		int check = customerDao.customerBoardWrite(customerDto);
		HAspect.logger.info(HAspect.logMsg + check);
		
		mav.addObject("check", check);
		mav.setViewName("customer/inquireWrite");
	}
	
	/* 글번호 가져오기 */
	public void writeNumber(CustomerDto customerDto) {

		// 그룹번호(ROOT), 글순서(자식), 글레벨(자식)
		int cusNum = customerDto.getCusNum(); // 0
		int cusGroupNumber = customerDto.getCusGroupNumber(); // 1
		int cusSequenceNumber = customerDto.getCusSequenceNumber(); // 0
		int cusSequenceLevel = customerDto.getCusSequenceLevel(); // 0

		if (cusNum == 0) { // ROOT : 그룹번호
			int max = customerDao.customerBoardGroupNumberMax();

			if (max != 0)
				customerDto.setCusGroupNumber(max + 1);

		} else { // 답글 : 글 순서, 글 레벨
			HashMap<String, Integer> hMap = new HashMap<String, Integer>();
			hMap.put("cusGroupNumber", cusGroupNumber);
			hMap.put("cusSequenceNumber", cusSequenceNumber);

			int check = customerDao.customerBoardWriteNumber(hMap);

			cusSequenceNumber = cusSequenceNumber + 1;
			cusSequenceLevel = cusSequenceLevel + 1;

			customerDto.setCusSequenceNumber(cusSequenceNumber);
			customerDto.setCusSequenceLevel(cusSequenceLevel);
		}
	}
	
	/* 글리스트 보기 */
	@Override
	public void customerBoardList(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		//ID 값 넘겨줘서 체크 String customerId = request.getParameter("id");
		String customerId = "test";
		
		/* 글쓰기를 위한 글번호, 그룹번호, 시퀀스 번호, 시퀀스 레벨 가져오기 */
		//부모글(ROOT)
		int cusNum = 0;	//ROOT글이면 0
		int cusGroupNumber = 1;	//그룹번호
		int cusSequenceNumber = 0;	//글순서
		int cusSequenceLevel = 0;	//글레벨
		
		
		//답글인경우 부모글의  DB 글번호, 그룹번호, 글순서, 글레벨
		if(request.getParameter("cusNum")!=null) {  
			cusNum = Integer.parseInt(request.getParameter("cusNum"));
			cusGroupNumber = Integer.parseInt(request.getParameter("cusGroupNumber"));
			cusSequenceNumber = Integer.parseInt(request.getParameter("cusSequenceNumber"));
		    cusSequenceLevel = Integer.parseInt(request.getParameter("cusSequenceLevel"));
		}
		
		mav.addObject("cusNum", cusNum);
		mav.addObject("cusGroupNumber", cusGroupNumber);
		mav.addObject("cusSequenceNumber", cusSequenceNumber);
		mav.addObject("cusSequenceLevel", cusSequenceLevel);
		
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
}
