package com.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.gongji.model.GongJiDAO;
import com.goodjob.module.AjaxPageModule;

@Controller
public class GongJiController {
	@Autowired
	GongJiDAO gDao;

	@RequestMapping(value= "userGongJiList.do",method = RequestMethod.GET)
	public ModelAndView userGongJiList(@RequestParam(value = "cp",defaultValue = "1")int cp,
			@RequestParam(value = "subject",defaultValue = "")String subject,
			@RequestParam(value="bAjax", defaultValue = "false")boolean bAjax) {
		ModelAndView mav= new ModelAndView();
		int totalCnt=gDao.userGongJiTotalCnt(subject);
		int pageSize=5;
		int listSize=10;
		int start = (cp - 1) * listSize+1;
		int end = cp * listSize;
		mav.addObject("list",gDao.userGongJiList(subject, start, end));
		mav.addObject("page",AjaxPageModule.makePage(totalCnt, listSize, pageSize, cp));
		if(bAjax) {
			mav.setViewName("goodjobJson");
		}else {
			mav.setViewName("gongji/userGongJiList");
			
		}
		return mav;
	}
	@RequestMapping(value = "gongJiContent.do",method = RequestMethod.GET)
	public ModelAndView gongjiContent(@RequestParam(value = "idx",defaultValue = "0")int idx) {
		ModelAndView mav= new ModelAndView();
		mav.addObject("dto", gDao.gongJiContent(idx));
		mav.setViewName("gongji/userGongJiContent");
		return mav;
	}
}
