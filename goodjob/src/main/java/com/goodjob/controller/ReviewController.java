package com.goodjob.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.review.model.ReviewDAO;
import com.goodjob.review.model.ReviewDTO;

@Controller
public class ReviewController {
	
	@Autowired
	public ReviewDAO reviewDao;
	
	// 후기리스트로 이동
	@RequestMapping(value = "/review.do", method =RequestMethod.GET)
	public ModelAndView reivewListForm() {
		ModelAndView mav = new ModelAndView();
		
		List<ReviewDTO> list = reviewDao.reviewList();
		mav.addObject("dto",list);
		mav.setViewName("review/review.do");
		
		
		return mav;
	}
	@RequestMapping(value = "/test.do", method =RequestMethod.GET)
	public String test() {
		return "review/test";
	}
	
	
	
}
