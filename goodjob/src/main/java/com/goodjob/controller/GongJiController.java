package com.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.gongji.model.GongJiDAO;
import com.goodjob.gongji.model.GongJiDTO;

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
	
	@RequestMapping(value = "/gongJiUpdateForm.do")
	public ModelAndView gongJiUpdateForm(int idx) {
		ModelAndView mav=new ModelAndView();
		
		return mav;
	}
	
	@RequestMapping(value = "/gongJiUpdate.do")
	public ModelAndView gongJiUpdate(GongJiDTO dto) {
		ModelAndView mav=new ModelAndView();
		
		return mav;
	}
	
	@RequestMapping(value= "/gongJiInertForm")
	public String gongJiInsertForm() {
		return "manGongJi/gongJiInsert";
	}
	
	@RequestMapping(value = "/gongJiInsert.do")
	public ModelAndView gongJiInsert(GongJiDTO dto) {
		ModelAndView mav=new ModelAndView();
		
		return mav;
	}
	@RequestMapping(value = "/gongJiDel.do")
	public ModelAndView gongJiDel(int idx) {
		ModelAndView mav=new ModelAndView();
		
		return mav;
	}
}
