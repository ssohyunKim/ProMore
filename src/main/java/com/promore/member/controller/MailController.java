package com.promore.member.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.promore.member.email.Email;
import com.promore.member.email.EmailSender;
import com.promore.member.service.MemberService;

@Controller
public class MailController {

	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private Email email;
	
	@RequestMapping(value = "member/sendPw.do", method=RequestMethod.GET)
	public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, ModelMap model) throws Exception {
		System.out.println("mail");
		ModelAndView mav;
	    String memId=(String) paramMap.get("memId");
	    String memEmail=(String) paramMap.get("memEmail");
	    String pw=memberService.getPw(paramMap);
	    System.out.println(pw);
	    if(pw!=null) {
			email.setContent("비밀번호는 "+pw+" 입니다.");
	        email.setReceiver(memEmail);
	        email.setSubject(memId+"님 비밀번호 찾기 메일입니다.");
	        emailSender.SendEmail(email);
	        mav= new ModelAndView("redirect:/emailSuccess.do");
	        return mav;
	    }else {
	        mav=new ModelAndView("redirect:/logout.do");
	        return mav;
	    }


	}
}
