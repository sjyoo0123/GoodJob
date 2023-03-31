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
		int sidx=0;
//		if(session.getAttribute("sidx")!=null) {
//			sidx=(int)session.getAttribute("sidx");
//		}
		ModelAndView mav=new ModelAndView();
//		CompanyMemberDTO dto=ComDao.comInfo(sidx);
//		mav.addObject("dto", dto);
		mav.setViewName("company/comMypage");
		return mav;
	}
}
