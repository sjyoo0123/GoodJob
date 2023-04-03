package com.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.gongji.model.GongJiDAO;

public class GongJiController {
	@Autowired
	GongJiDAO gDao;

	@RequestMapping(value= "userGongJiList",method = RequestMethod.GET)
	public ModelAndView userGongJiList() {
		ModelAndView mav= new ModelAndView();
		mav.addObject("list",gDao.userGongJiList());
		mav.setViewName("gongji/userGongJiList");
		return mav;
	}
	@RequestMapping(value = "gongJiContent",method = RequestMethod.GET)
	public ModelAndView gongjiContent() {
		ModelAndView mav= new ModelAndView();
		mav.setViewName("gongji/");
		return mav;
	}
}
