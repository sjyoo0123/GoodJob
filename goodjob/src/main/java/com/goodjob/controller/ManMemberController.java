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
		Map<String,Integer> map=new HashMap<String,Integer>();
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
	
	@RequestMapping("manMemberUpdate.do")
	public ModelAndView manMemberUpdate(@RequestParam(value="idx")int idx,@RequestParam(value="category")String category) {
		ModelAndView mav=new ModelAndView();
		

		int result=0;
		if(category.equals("활성")) {
			result=mmdao.manMemberUpdate(idx);
		}else if(category.equals("거절")){
			result=mmdao.manMemberDel(idx);
		}
		String msg=result>0?"작업완료":"작업 실패";
		mav.addObject("msg",msg);
		mav.setViewName("manMember/memberMsg");
		return mav;
	}
}