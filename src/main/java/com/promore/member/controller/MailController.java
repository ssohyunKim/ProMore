package com.promore.member.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.promore.member.email.Email;
import com.promore.member.email.EmailSender;
import com.promore.member.service.MemberService;

public class MailController {
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private Email email;
	
	@RequestMapping(value = "member/sendPw.do", method=RequestMethod.GET)
	public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
		ModelAndView mav;
	    String id=(String) paramMap.get("MEM_id");
	    String e_mail=(String) paramMap.get("MEM_email");
	    String pw=memberService.getPw(paramMap);
	    System.out.println(pw);
	    if(pw!=null) {
			email.setContent("비밀번호는 "+pw+" 입니다.");
	        email.setReceiver(e_mail);
	        email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
	        emailSender.SendEmail(email);
	        mav= new ModelAndView("redirect:/emailSuccess.do");
	        return mav;
	    }else {
	        mav=new ModelAndView("redirect:/logout.do");
	        return mav;
	    }


	}
}
