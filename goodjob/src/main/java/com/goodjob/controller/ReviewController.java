package com.goodjob.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.review.model.ReviewDAO;
import com.goodjob.review.model.ReviewDTO;


@Controller
public class ReviewController {

	@Autowired
	public ReviewDAO reviewDao;

	// 후기리스트로 이동
	@RequestMapping(value = "/review.do", method = RequestMethod.GET)
	public ModelAndView reivewListForm() {
		ModelAndView mav = new ModelAndView();
		List<ReviewDTO> list = reviewDao.reviewList();

		mav.addObject("list", list);
		String name = "";
		Object count = "";

//		for (int i = 0; i < list.size(); i++) {
//
//			name = (String) list.get(i).get("com_name");
//			count = list.get(i).get("count");
//			System.out.println(count);
//		}
		
		System.out.println();
		mav.setViewName("review/reviewList");

		return mav;
	}
	//관리자 리뷰 페이지 들어가기
	public ModelAndView manReviewPage() {
		
		ModelAndView mav=new ModelAndView();
		
		return mav;
	}


	@RequestMapping(value = "/reviewWrite.do", method = RequestMethod.POST)
	public ModelAndView reviewWriteSumbmit(ReviewDTO dto) {
		int result = reviewDao.reviewWrite(dto);
		String msg = result > 0 ? "후기 작성성공" : "후기 작성실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("review/reviewMsg");

		return mav;
	}

	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String test() {
		return "review/test";
	}

}
