package com.goodjob.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.companymember.model.CompanyMemberDAO;
import com.goodjob.companymember.model.CompanyMemberDTO;
import com.goodjob.notice.model.NoticeDAO;
import com.goodjob.notice.model.NoticeDTO;
import com.goodjob.offer.model.OfferDAO;
import com.goodjob.offer.model.OfferDTO;

@Controller
public class ComController {

	@Autowired
	private CompanyMemberDAO ComDao;
	@Autowired
	private NoticeDAO ndao;
	@Autowired
	private OfferDAO odao;

	public ComController() {
		// TODO Auto-generated constructor stub
	}
	public CompanyMemberDAO getComDao() {
		return ComDao;
	}

	public void setComDao(CompanyMemberDAO comDao) {
		ComDao = comDao;
	}

	public ComController(OfferDAO odao) {
		super();
		this.odao = odao;
	}

	public ComController(NoticeDAO ndao) {
		super();
		this.ndao = ndao;
	}

	public NoticeDAO getNdao() {
		return ndao;
	}

	public void setNdao(NoticeDAO ndao) {
		this.ndao = ndao;
	}

	public OfferDAO getOdao() {
		return odao;
	}

	public void setOdao(OfferDAO odao) {
		this.odao = odao;
	}

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
		int ntotalCnt=0;
		if(ndao.noticeTotalCnt(idx)!=0) {
			ntotalCnt=ndao.noticeTotalCnt(idx);
		}
		List<NoticeDTO> nlists=ndao.noticeComList(idx,1,5);
		int ototalCnt=0;
		if(odao.offerTotalCnt(idx)!=0) {
			ototalCnt=odao.offerTotalCnt(idx);
		}
		List<OfferDTO> olists=odao.ofComList(idx, 1, 5);
		mav.addObject("ntotalCnt", ntotalCnt);
		mav.addObject("ototalCnt", ototalCnt);
		mav.addObject("nlists", nlists);
		mav.addObject("olists", olists);
		mav.setViewName("company/comMypage");
		return mav;
	}
}
