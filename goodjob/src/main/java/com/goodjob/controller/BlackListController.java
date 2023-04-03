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
import com.goodjob.blacklist.model.BlackListDTO;
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
	@ResponseBody
	public  ModelAndView manBlackListGet(@RequestParam(value="cp", defaultValue = "1")int cp,
			@RequestParam(value="category")String category) {
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
		mav.addObject("pagestr",pagestr);
		mav.setViewName("goodjobJson");
		return mav;
	}
	
	@RequestMapping(value = "/manBlackListContentForm.do")
	public ModelAndView manBlackListContentForm(@RequestParam(value="idx")int idx) {
		ModelAndView mav=new ModelAndView();
		String name=bdao.manBlackListGetName(idx);
		mav.addObject("name", name);
		mav.addObject("idx", idx);
		mav.setViewName("blackList/manBlackListContent");
		return mav;
	}
	
	@RequestMapping(value = "/manBlackListContent.do",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView manBlackListContent(@RequestParam(value="cp", defaultValue = "1")int cp,
			@RequestParam(value="idx")int idx) {
		ModelAndView mav=new ModelAndView();
		int totalCnt=bdao.manBlackListContentTotalCnt(idx);
		int listSize=5;
		int pageSize=5;
		String pagestr=com.goodjob.page.module.PageModule.makePage("manBlackList.do", totalCnt, listSize, pageSize, cp);
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("idx", idx);
		List<BlackListDTO> lists=bdao.manBlackListContent(map);
		mav.addObject("lists", lists);
		mav.addObject("pagestr",pagestr);
		mav.setViewName("goodjobJson");
		return mav;
	}
	@RequestMapping(value="/manBlackListDelForm.do")
	public ModelAndView manBlackListDelForm(int idx,int sort) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("idx", idx);
		mav.addObject("sort", sort);
		mav.setViewName("blackList/blackListDel");
		return mav;
	}
	
	@RequestMapping(value="/manBlackListDel.do")
	public ModelAndView manBlackListDel(int idx,int sort) {
		ModelAndView mav=new ModelAndView();
		String msg="";
		int result=0;
		if(sort==1) {
			result=bdao.manBlackListSingoDel(idx);
		}else if(sort==2) {
			result=bdao.manBlackListDel(idx);
		}
		if(result>0) {
			msg="삭제 성공";
		}else {
			msg="삭제 실패";
		}
		mav.addObject("msg",msg);
		mav.addObject("sort",sort);
		mav.setViewName("blackList/blackListMsg");
		return mav;
	}
	
	@RequestMapping(value="/manBlackListSingoList.do")
	public String manBlackListSingoListForm() {
		return "blackList/singoList";
	}
	
	@RequestMapping(value="/manBlackListSingoListGet.do")
	public ModelAndView manBlackListSingoList(@RequestParam(value="cp", defaultValue = "1")int cp,
			@RequestParam(value="category")String category) {
		ModelAndView mav=new ModelAndView();
		
		int totalCnt=bdao.manBlackListSingoTotalCnt(category);
		int listSize=5;
		int pageSize=5;
		String pagestr=com.goodjob.page.module.PageModule.makePage("manBlackList.do", totalCnt, listSize, pageSize, cp);
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("category", category);
		List<BlackListDTO> lists=bdao.manBlackListSingoList(map);
		mav.addObject("lists", lists);
		mav.addObject("pagestr",pagestr);
		mav.setViewName("goodjobJson");
		return mav;
	}
}













