package com.goodjob.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.companymember.model.CompanyMemberDAO;
import com.goodjob.companymember.model.CompanyMemberDTO;

@Controller
public class ComController {

	@Autowired
	private CompanyMemberDAO ComDao;
	
	@RequestMapping("/company.do")
	public ModelAndView comMypageForm(HttpSession session) {
		int idx=0;
		ModelAndView mav=new ModelAndView();
		if(session.getAttribute("sidx")==null||session.getAttribute("sidx")=="") {
			String msg="로그인 후 이용바랍니다.";
			String goUrl="index.do";
			mav.addObject("msg", msg);
			mav.addObject("goUrl", goUrl);
			mav.setViewName("notice/noticeMsg");
			return mav;
		}else {
			idx=(int)session.getAttribute("sidx");
		}
		CompanyMemberDTO dto=ComDao.comInfo(idx);
		mav.addObject("dto", dto);
		mav.setViewName("company/comMypage");
		return mav;
	}
}
