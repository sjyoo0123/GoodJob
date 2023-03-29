package com.goodjob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FAQController {

	
	//FAQ 메인페이지 들어가기
	@GetMapping("/manFAQList.do")
	public String manFAQList() {
		
		return "/FAQ/manFAQList";
	}
}
