package com.goodjob.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.companymember.model.CompanyMemberDAO;
import com.goodjob.companymember.model.CompanyMemberDTO;
import com.goodjob.notice.model.NoticeDTO;
import com.goodjob.offer.model.OfferDAO;
import com.goodjob.offer.model.OfferDTO;

@Controller
public class OfferController {
	@Autowired
	private OfferDAO odao;
	@Autowired
	private CompanyMemberDAO cdao;
	public OfferController(OfferDAO odao) {
		super();
		this.odao = odao;
	}
	@RequestMapping("/ofComList.do")
	public ModelAndView ofComList(@RequestParam(value="cp",defaultValue="1")int cp,HttpSession session) {
		int cidx=0;
		if(session.getAttribute("sidx")!=null) {
			cidx=(int)session.getAttribute("sidx");
		}
		int totalCnt=odao.offerTotalCnt(cidx);
		int listSize=5;
		int pageSize=5;
		
		String pageStr=com.goodjob.page.module.PageModule.makePage("ofComList.do", totalCnt, listSize, pageSize, cp);
		List<OfferDTO> lists=odao.ofComList(cidx, cp, listSize);
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.addObject("nidx",cidx);
		mav.setViewName("offer/ofComList");
		return mav;
	}
	@RequestMapping(value="ofNorList.do", method = RequestMethod.GET )
	public ModelAndView ofNorList(HttpSession session,@RequestParam(value="cp",defaultValue="1")int cp) {
		ModelAndView mav=new ModelAndView();
		int member_idx = 0;
		if(session.getAttribute("sidx")!=null) {
			member_idx=(int)session.getAttribute("sidx");
		}
		int totalCnt=odao.offerNorTotalCnt(member_idx);
		int listSize=5;
		int pageSize=5;
		
		String pageStr=com.goodjob.page.module.PageModule.makePage("ofComList.do", totalCnt, listSize, pageSize, cp);
		List<NoticeDTO> list = odao.ofNorList(member_idx,  cp, listSize );
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", list);
		mav.setViewName("offer/ofNorList");
		return mav;
	}
	@RequestMapping(value="ofNorGetCheck.do", method = RequestMethod.POST)
	public int ofNorGetCheck(HttpSession session, @RequestParam(value="oidx") int oidx ) {
		int member_idx = 0;
		if(session.getAttribute("sidx")!=null) {
			member_idx=(int)session.getAttribute("sidx");
		}
		int offer_idx = oidx;
		int result = odao.ofNorGetCheck(member_idx, offer_idx);
		return result;
	}
	@RequestMapping(value="/offerSubmit.do", method = RequestMethod.POST)
	@ResponseBody
	public int offerSubmit(OfferDTO dto) {
		int comidx=dto.getCom_idx();
		CompanyMemberDTO cdto=cdao.comInfo(comidx);
		String com_name=cdto.getCom_name();
		dto.setCom_name(com_name);
		int result=odao.offerSubmit(dto);
		return result;
	}
}
