package com.goodjob.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.resume.model.ResumeDAO;
import com.goodjob.resume.model.ResumeDTO;

@Controller
public class NorController {

	@Autowired
	public ResumeDAO resumeDao;

	@RequestMapping("/norMyPage.do")
	public ModelAndView mypage(HttpSession session, @RequestParam(value = "idx") int ridx) {
		ModelAndView mav = new ModelAndView();
		int idx = 0;
		if (session.getAttribute("sidx") == null || session.getAttribute("sidx") == "") {
			String msg = "로그인 후 이용바랍니다.";
			String goUrl = "index.do";
			mav.addObject("msg", msg);
			mav.addObject("goUrl", goUrl);
			mav.setViewName("notice/noticeMsg");
			return mav;
		} else {
			idx = (int) session.getAttribute("sidx");
		}
		ResumeDTO dto = resumeDao.resumeDown(ridx);
		mav.addObject("dto", dto);
		mav.setViewName("norMyPage/norMyPage");
		return mav;
	}

}
