package com.goodjob.controller;

import java.util.List;
import java.util.Map;

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
		final int SILVER7 =4;
		final int SILVER15=5;
		final int SILVER30=6;
		final int GOLD7=7;
		final int GOLD15=8;
		final int GOLD30=9;
		final int DIAMOND7=10;
		final int DIAMOND15=11;
		final int DIAMOND30=12;
		mav.addObject("dieList",nDao.mainPlan(DIAMOND7,DIAMOND15,DIAMOND30));
		mav.addObject("goldList",nDao.mainPlan(GOLD7,GOLD15,GOLD30));
		mav.addObject("silList",nDao.mainPlan(SILVER7,SILVER15,SILVER30));
		mav.addObject("gList",gDao.userGongJiList("", 1, 4));
		mav.addObject("banner", bDao.mainBanner());
		
		mav.setViewName("index");
		return mav;
	}
}
