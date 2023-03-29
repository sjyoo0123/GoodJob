package com.goodjob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FAQController {

	
	//FAQ 메인페이지 들어가기
	@RequestMapping("/manFAQList.do")
	public String manFAQList() {
		
		return "FAQ/manFAQList";
	}
}
