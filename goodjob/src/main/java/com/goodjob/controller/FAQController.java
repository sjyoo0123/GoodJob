package com.goodjob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FAQController {

	
	//FAQ 메인페이지 들어가기
	@RequestMapping("/manFAQList")
	public String manFAQList() {
		
		return "FAQ/manFAQList";
	}
	
	//FAQ 등록하는 페이지 들어가기
	@RequestMapping("/manFAQAddPage")
	public String manFAQAddPage() {
		
		return "FAQ/manFAQAddPage";
	}
}
