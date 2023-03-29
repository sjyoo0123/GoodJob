package com.goodjob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {
		
	@RequestMapping("/reviewList.do")
	public String reivewListForm() {
		
		
		return "review/reviewList";
	}
	
	
}
