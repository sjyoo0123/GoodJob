package com.goodjob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {

	@RequestMapping("noticeWrite.do")
	public ModelAndView noticeWriteForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/noticeWrite");
		return mav;
	}
	@RequestMapping("noticeComList.do")
	public ModelAndView noticeComListForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/noticeComList");
		return mav;
	}
}
