package com.goodjob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResumeController {
	
	
	@RequestMapping("resumeWrite.do")
	public ModelAndView resumeForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("resume/resumeWrite");
		return mav;
	}
}
