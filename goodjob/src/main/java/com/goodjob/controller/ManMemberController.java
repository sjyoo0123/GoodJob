package com.goodjob.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.companymember.model.CompanyMemberDTO;
import com.goodjob.manmember.model.ManMemberDAO;
import com.goodjob.member.model.MemberDTO;

@Controller
public class ManMemberController {

	@Autowired
	ManMemberDAO mmdao;
	
	@RequestMapping("manMemberList.do")
	public ModelAndView manMemberList(@RequestParam(value="cp", defaultValue = "1")int cp) {
		ModelAndView mav=new ModelAndView();
			
		int totalCnt=mmdao.manMemberListTotalCnt();
		int listSize=5;
		int pageSize=5;
		String pagestr=com.goodjob.page.module.PageModule.makePage("manMemberList.do", totalCnt, listSize, pageSize, cp);
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<MemberDTO> lists=mmdao.manMemberList(map);
		mav.addObject("lists", lists);
		mav.addObject("pagestr",pagestr);
		mav.setViewName("manMember/memberList");
		return mav;
	}
	
	@RequestMapping("manMemberContent.do")
	public ModelAndView manMemberContent(int idx) {
		ModelAndView mav=new ModelAndView();
		
		CompanyMemberDTO dto=mmdao.manMemberContent(idx);
		mav.addObject("dto", dto);
		mav.setViewName("manMember/memberContent");
		
		return mav;
	}
}























