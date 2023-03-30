package com.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.goodjob.review.model.ReviewDAO;

@Controller
public class ReviewController {
	
	@Autowired
	public ReviewDAO reviewDao;
	
	// 후기리스트로 이동
	@RequestMapping(value = "/review.do", method =RequestMethod.GET)
	public String reivewListForm() {
		return "review/reviewList";
	}
	@RequestMapping(value = "/test.do", method =RequestMethod.GET)
	public String test() {
		return "review/test";
	}

}
