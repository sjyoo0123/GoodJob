package com.goodjob.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.apply.model.ApplyDAO;
import com.goodjob.member.model.MemberDTO;
import com.goodjob.notice.model.NoticeDTO;
import com.goodjob.offer.model.OfferDAO;
import com.goodjob.resume.model.ResumeDAO;
import com.goodjob.resume.model.ResumeDTO;
import com.goodjob.review.model.ReviewDTO;

@Controller
public class NorController {

	@Autowired
	public ResumeDAO resumeDao;
	@Autowired
	public ApplyDAO applyDao;
	@Autowired
	public OfferDAO offerDao;
	/**마이페이지 폼*/
	@RequestMapping("/norMyPage.do") 
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int idx = 0;
		String scategory = "";
		if (session.getAttribute("sidx") == null || session.getAttribute("sidx") == "") {
			String msg = "로그인 후 이용바랍니다.";
			String goUrl = "index.do";
			mav.addObject("msg", msg);
			mav.addObject("goUrl", goUrl);
			mav.setViewName("notice/noticeMsg");
			return mav;
		} else {
			idx = (int) session.getAttribute("sidx");
			scategory = (String) session.getAttribute("scategory");
		}
		ResumeDTO rto = resumeDao.resumeDown(idx); // 이력서 select* 
		MemberDTO dto = resumeDao.resumeWriteForm(idx);
		ReviewDTO nto = resumeDao.resumeWriteForm1(idx);
		String addr = dto.getAddr();
		String getAddr = addr.replaceAll(",", " ");
		dto.setAddr(getAddr);
		List<NoticeDTO> alist = applyDao.apNorlist(idx, 1, 5);
		List<NoticeDTO> olist = offerDao.ofNorList(idx, 1, 5);
		mav.addObject("alist", alist);
		mav.addObject("olist", olist);
		mav.addObject("nto", nto);
		mav.addObject("rto", rto);
		mav.addObject("dto", dto);
		mav.addObject("scategory", scategory);
		mav.addObject("idx", idx);
		mav.setViewName("norMyPage/norMyPage");
		return mav;
	}
	
	
	
}
