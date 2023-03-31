package com.goodjob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class One_oneController {
	
	
	
	//일대일문의 들어가기
	@RequestMapping("/manOneList.do")
	public ModelAndView manOneList() {
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("/one/manOneList");
		
	}
	
}
