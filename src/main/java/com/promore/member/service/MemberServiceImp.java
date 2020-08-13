package com.promore.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.promore.aop.HAspect;
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
		
		String memId = request.getParameter("memId");
		String memPassword=request.getParameter("memPassword");
		
		String memLevel=memberDao.loginOk(memId, memPassword);
		HAspect.logger.info(HAspect.logMsg + memId);
		HAspect.logger.info(HAspect.logMsg + memPassword);
		HAspect.logger.info(HAspect.logMsg + memLevel);
		
		mav.addObject("memLevel", memLevel);
		mav.addObject("memId", memId);
		mav.addObject("memPassword", memPassword);
		mav.setViewName("member/loginOk");
		
		System.out.println("OK3");
		
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
