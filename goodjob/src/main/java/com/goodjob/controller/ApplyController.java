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

import com.goodjob.apply.model.ApplyDAO;
import com.goodjob.apply.model.ApplyDTO;
import com.goodjob.normalmember.model.NormalMemberDTO;
import com.goodjob.notice.model.NoticeDAO;
import com.goodjob.notice.model.NoticeDTO;

@Controller
public class ApplyController {
	@Autowired
	private ApplyDAO adao;
	@Autowired
	private NoticeDAO ndao;
	public ApplyController(ApplyDAO adao) {
		super();
		this.adao = adao;
	}

	@RequestMapping("/apComList.do")
	public ModelAndView apComListForm(@RequestParam(value="cp",defaultValue="1")int cp,@RequestParam(value="idx")int nidx) {
		int totalCnt=adao.applyTotalCnt(nidx);
		int listSize=5;
		int pageSize=5;
		String pageStr=com.goodjob.page.module.PageModule.makePage("apComList.do", totalCnt, listSize, pageSize, cp);
		List<NoticeDTO> lists=adao.apComList(nidx, cp, listSize);
		ApplyDTO subject=ndao.apNoticeSubject(nidx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.addObject("subject",subject);
		mav.addObject("nidx",nidx);
		mav.setViewName("apply/apComList");
		return mav;
	}
	
	@RequestMapping("/apNorInsert.do")
	public ModelAndView apNorInsert(ApplyDTO dto, @RequestParam(value="notice_idx")int nidx, HttpSession session, NormalMemberDTO mto) {
		ModelAndView mav=new ModelAndView();
		int idx =0 ;
		if (session.getAttribute("sidx") == null || session.getAttribute("sidx") == "") {
			String msg = "로그인 후 이용바랍니다.";
			String goUrl = "index.do";
			mav.addObject("msg", msg);
			mav.addObject("goUrl", "noticeList.do");
			mav.setViewName("notice/noticeMsg");
			return mav;
		} else {
			idx = (int) session.getAttribute("sidx");
		}
		mto = adao.apNorGet(idx);
		dto.setNormal_name(mto.getName());
		dto.setNormal_birth(mto.getBirth());
		dto.setNotice_idx(nidx);
		dto.setMember_idx(idx);
		int result =  adao.apNorInsert(dto);
		String msg = result>0? "지원 성공":"지원 실패";
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "noticeList.do");
		mav.setViewName("notice/noticeMsg");
		return mav;
	}
	@RequestMapping("/apNorList.do")
	public ModelAndView apNorList(HttpSession session, @RequestParam(value="cp",defaultValue="1")int cp,
			@RequestParam(value = "keyword", defaultValue = "")String keyword) {
		ModelAndView mav=new ModelAndView();
		int idx = (int) session.getAttribute("sidx");
		int totalCnt=adao.applyNorTotalCnt(idx);
		int listSize=5;
		int pageSize=5;
		String pageStr=com.goodjob.page.module.PageModule.makePage("apNorList.do", totalCnt, listSize, pageSize, cp);
		List<NoticeDTO> list = adao.apNorlist(idx, cp, listSize, keyword);
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", list);
		mav.setViewName("apply/apNorList");
		return mav; 
	}
	@RequestMapping(value="/applyCheck.do",method=RequestMethod.POST)
	@ResponseBody
	public int applyCheck(int idx) {
		int count=adao.applyCheck(idx);
		return count;
	}
	
}
