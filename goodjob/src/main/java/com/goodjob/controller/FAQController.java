package com.goodjob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FAQController {

	
	//FAQ 메인페이지 들어가기
	@RequestMapping("/manFAQList.do")
	public String manFAQList() {
		
		return "FAQ/manFAQList";
	}
	@RequestMapping("userFAQList")
	public ModelAndView userFaqList() {
		ModelAndView mav= new ModelAndView();
		mav.addObject("fList",null);
		mav.setViewName("FAQ/userFAQList");
		return mav;
	}
	
}
