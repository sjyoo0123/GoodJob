package com.goodjob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ComController {

	@RequestMapping("/company.do")
	public ModelAndView comMypageForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("company/comMypage");
		return mav;
	}
}
