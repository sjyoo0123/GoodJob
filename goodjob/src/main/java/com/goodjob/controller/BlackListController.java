package com.goodjob.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.blacklist.model.BlackListDAO;
import com.goodjob.member.model.MemberDTO;

@Controller
public class BlackListController {

	@Autowired
	private BlackListDAO bdao;
	
	@RequestMapping("/manBlackList.do")
	public ModelAndView manBlackList(@RequestParam(value="cp", defaultValue = "1")int cp,
			@RequestParam(value="category", defaultValue = "개인")String category) {
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("blackList/manBlackList");
		return mav;
	}
	
	@RequestMapping(value = "/manBlackListGet.do",method = RequestMethod.POST)
	public @ResponseBody List<MemberDTO> manBlackListGet(@RequestParam(value="cp", defaultValue = "1")int cp,
			@RequestParam(value="category", defaultValue = "개인")String category) {
		ModelAndView mav=new ModelAndView();
		
		int totalCnt=bdao.manBlackListTotalCnt(category);
		int listSize=5;
		int pageSize=5;
		String pagestr=com.goodjob.page.module.PageModule.makePage("manBlackList.do", totalCnt, listSize, pageSize, cp);
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("category", category);
		List<MemberDTO> lists=bdao.manBlackListGet(map);
		mav.addObject("lists", lists);
		//mav.addObject("pagestr",pagestr);
		//mav.setViewName("goodjobJson");
		return lists;
	}
}













