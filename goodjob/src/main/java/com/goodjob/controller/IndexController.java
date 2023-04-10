package com.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.banner.model.BannerDAO;
import com.goodjob.gongji.model.GongJiDAO;
import com.goodjob.notice.model.NoticeDAO;

@Controller
public class IndexController {
	@Autowired
	NoticeDAO nDao;
	@Autowired
	GongJiDAO gDao;
	@Autowired
	BannerDAO bDao;
	@RequestMapping("/index.do")
	public ModelAndView index() {
		ModelAndView mav=new ModelAndView();
		mav.addObject("dieList",nDao);
		mav.addObject("goldList",nDao);
		mav.addObject("silList",nDao);
		mav.addObject("gList",gDao.userGongJiList("", 1, 3));
		mav.addObject("banner", bDao.mainBanner());
		
		mav.setViewName("index");
		return mav;
	}
}
