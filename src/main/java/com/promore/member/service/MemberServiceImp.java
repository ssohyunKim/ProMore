package com.promore.member.service;

import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.promore.aop.HAspect;
import com.promore.member.dao.MemberDao;
import com.promore.member.dto.MemberDto;

@Component
public class MemberServiceImp implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public void memberLoginOk(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String memId = request.getParameter("memId");
		String memPassword=request.getParameter("memPassword");
		
		MemberDto memberDto=memberDao.loginOk(memId, memPassword);
		HAspect.logger.info(HAspect.logMsg + memId);
		HAspect.logger.info(HAspect.logMsg + memPassword);
		HAspect.logger.info(HAspect.logMsg +"우예"+ memberDto);
		
		
		mav.addObject("memberDto", memberDto);
		mav.setViewName("member/loginOk");
	}

	@Override
	public void memberUpdate(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int memNum = Integer.parseInt(request.getParameter("memNum"));
		
		System.out.println(memNum);
		
		MemberDto memberDto = memberDao.memberSelect(memNum);
		
		mav.addObject("memberDto", memberDto);
		mav.setViewName("member/memberUpdate");
	}
	
	@Override
	public void memberUpdateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		
		MemberDto memberDto = (MemberDto) map.get("memberDto");
		HAspect.logger.info(HAspect.logMsg + memberDto);
		
		int check = memberDao.memberUpdate(memberDto);
		HAspect.logger.info(HAspect.logMsg + check);
		
		memberDto = memberDao.memberSelect(Integer.parseInt(request.getParameter("memNum")));
		session.setAttribute("memberDto", memberDto);

		mav.addObject("check", check);
		mav.setViewName("member/memberUpdateOk");
	}
	
	@Override
	public void sendEmail(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String memId = request.getParameter("memId");
		String memEmail=request.getParameter("memEmail");
		String memPassword=memberDao.getPw(memId, memEmail);
		HAspect.logger.info(HAspect.logMsg + memId);
		HAspect.logger.info(HAspect.logMsg + memEmail);
		HAspect.logger.info(HAspect.logMsg + memPassword);
		
		mav.addObject("memId", memId);
		mav.addObject("memEmail", memEmail);
		mav.addObject("memPassword", memPassword);
		
		 try {
			 MimeMessage msg = mailSender.createMimeMessage();
			 MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
		    
			 messageHelper.setSubject(memId+"님 비밀번호 찾기 메일입니다.");
			 messageHelper.setText("비밀번호는 "+memPassword+" 입니다.");
			 messageHelper.setTo(memEmail);
			 msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(memEmail));
			 mailSender.send(msg);
		        
		}catch(MessagingException e) {
			 System.out.println("MessagingException");
		     e.printStackTrace();
		}
		mav.setViewName("member/emailSuccess");
	}
	
	@Override
	public void memberRegister(ModelAndView mav) {
		
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		MemberDto memberDto = new MemberDto();
		
		memberDto.setMemId(request.getParameter("mem_id"));
		memberDto.setMemName(request.getParameter("mem_name"));
		memberDto.setMemNickname(request.getParameter("mem_nickname"));
		memberDto.setMemPassword(request.getParameter("mem_password"));
		memberDto.setMemLevel(request.getParameter("memLevel"));
		memberDto.setMemPhone(request.getParameter("mem_phone"));
		memberDto.setMemEmail(request.getParameter("mem_email"));
		memberDto.setMemMailing(request.getParameter("mailcheck").equals("yes")?1:0);
		memberDto.setMemSkills(request.getParameter("Skill"));
		
		memberDao.memberRegister(memberDto);
		
	}
	
	@Override
	public void memberDelete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int memNum = Integer.parseInt(request.getParameter("memNum"));
		
		System.out.println(memNum);
		
		MemberDto memberDto = memberDao.memberSelect(memNum);
		
		mav.addObject("memberDto", memberDto);
		mav.setViewName("member/memberDelete");
		
	}

	@Override
	public void memberDeleteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		//HttpSession session = request.getSession();
		
		/*
		 * MemberDto memberDto = (MemberDto) map.get("memberDto");
		 * HAspect.logger.info(HAspect.logMsg + memberDto);
		 */
		
		int memNum = Integer.parseInt(request.getParameter("memNum"));
		
		int check = memberDao.memberDelete(memNum);
		HAspect.logger.info(HAspect.logMsg + check);

		mav.addObject("check", check);
		mav.setViewName("member/memberDeleteOk");
		
	}


	
	
	
	
}
