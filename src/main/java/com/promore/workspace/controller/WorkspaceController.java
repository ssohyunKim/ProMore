package com.promore.workspace.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.promore.aop.HAspect;
import com.promore.workspace.dto.WorkspaceDto;
import com.promore.workspace.service.WorkspaceService;

@Controller
public class WorkspaceController {
	@Autowired
	private WorkspaceService workspaceService;

	@RequestMapping(value = "/workspace/workspace.do", method = RequestMethod.GET)
	public ModelAndView workspace(HttpServletRequest request, HttpServletResponse response) {
		HAspect.logger.info(HAspect.logMsg+"workspace");
		
		ModelAndView mav = new ModelAndView("/workspace/workspace");

		return mav;
	}
	
	@RequestMapping(value = "/workspace/workWrite.do", method = RequestMethod.GET)
	public void workWrite(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		workspaceService.workWrite(mav);
		
		response.setHeader("Content-Type", "plain/text;charset=utf-8");
	}
	
	
	@RequestMapping("/workspace/workList.do") //댓글 리스트
    @ResponseBody
    private List<WorkspaceDto> workServiceList(Model model) throws Exception{
        
        return workspaceService.workListService();
    }
    
    @RequestMapping("/workspace/workInsert.do") //댓글 작성 
    @ResponseBody
    private int workServiceInsert(@RequestParam HashMap<String, Object> paramMap) throws Exception{
        
    	WorkspaceDto workspaceDto = new WorkspaceDto();
		workspaceDto.setWorkNum((Integer)(paramMap.get("workNum")));
		workspaceDto.setWorkContent((String) paramMap.get("workContent"));
        
        return workspaceService.workInsertService(workspaceDto);
    }

}
