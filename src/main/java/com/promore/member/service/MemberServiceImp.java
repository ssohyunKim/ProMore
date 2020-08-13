package com.promore.member.service;

import java.util.Date;
import java.util.Map;
import java.util.logging.LogManager;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.promore.aop.HAspect;
import com.promore.manager.dto.NoticeDto;
import com.promore.member.dao.MemberDao;
import com.promore.member.dto.MemberDto;

@Component
public class MemberServiceImp implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public void main(ModelAndView mav) {
		mav.setViewName("project/main");
		
	}
	
	@Override
	public void memberLogin(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void memberLoginOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String mem_id = request.getParameter("mem_id");
		String mem_password=request.getParameter("mem_password");
		String mem_level=request.getParameter("mem_level");
		int check = memberDao.loginOk(mem_id, mem_password);
		HAspect.logger.info(HAspect.logMsg + mem_id);
		HAspect.logger.info(HAspect.logMsg + mem_password);
		HAspect.logger.info(HAspect.logMsg + mem_level);
		
		mav.addObject("mem_id", mem_id);
		mav.addObject("mem_password", mem_password);
		mav.addObject("mem_level", "0");	//일반회원 0
		mav.setViewName("member/loginOk");
		
		System.out.println("OK2");
		
	}
	
	@Override
	public void memberLogout(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String mem_id = request.getParameter("mem_id");
		String mem_password=request.getParameter("mem_password");
//		int check = memberDao.loginOk(mem_id, mem_password);
//		HAspect.logger.info(HAspect.logMsg + check);
		
		mav.addObject("mem_id", mem_id);
		mav.addObject("mem_password", mem_id);
		//mav.addObject("mem_level", "0");
		mav.setViewName("member/logout");
		
	}
	
	@Override
	public String getPw(Map<String, Object> paramMap) {
		return memberDao.getPw(paramMap);
	}
	
	@Override
	public void memberUpdate(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int memNum = Integer.parseInt(request.getParameter("memNum"));
		
		MemberDto memberDto = memberDao.memberSelect(memNum);
		
		mav.addObject("memberDto", memberDto);
		mav.setViewName("member/memberUpdate");
	}
	
}
