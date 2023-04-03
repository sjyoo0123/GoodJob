package com.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.gongji.model.GongJiDAO;
import com.goodjob.notice.model.NoticeDAO;

@Controller
public class IndexController {
	@Autowired
	NoticeDAO nDao;
	GongJiDAO gDao;
//BannerDAO bDao;
	@RequestMapping("/index.do")
	public ModelAndView index() {
		ModelAndView mav=new ModelAndView();
		//mav.addObject("nList",nDao);
		//mav.addObject("gList",gDao.userGongJiList());
		//mav.addObject("banner", bDao);
		mav.setViewName("index");
		return mav;
	}
}
