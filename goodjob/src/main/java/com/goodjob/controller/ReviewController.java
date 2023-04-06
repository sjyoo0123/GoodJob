package com.goodjob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
		
	@RequestMapping("/reviewList.do")
	public String reivewListForm() {
		
		
		return "review/reviewList";
	}
	//관리자 리뷰 페이지 들어가기
	public ModelAndView manReviewPage() {
		
		ModelAndView mav=new ModelAndView();
		
		return mav;
	}
	
}
