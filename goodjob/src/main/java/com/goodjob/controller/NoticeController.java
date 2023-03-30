package com.goodjob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {

	@GetMapping("/noticeWrite.do")
	public ModelAndView noticeWriteForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/noticeWrite");
		return mav;
	}
	@PostMapping("/noticeWrite.do")
	public ModelAndView noticeWriteSubmit() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/noticeWrite");
		return mav;
	}
	@RequestMapping("/noticeComList.do")
	public ModelAndView noticeComListForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/noticeComList");
		return mav;
	}
	
}
