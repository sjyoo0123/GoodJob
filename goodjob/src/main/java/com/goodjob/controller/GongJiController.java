package com.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView gongjiContent(@RequestParam(value = "idx",defaultValue = "0")int idx) {
		ModelAndView mav= new ModelAndView();
		mav.addObject("dto", gDao.gongJiContent(idx));
		mav.setViewName("gongji/userGongJiContent");
		return mav;
	}
}
