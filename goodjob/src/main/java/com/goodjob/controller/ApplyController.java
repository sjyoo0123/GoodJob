package com.goodjob.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.apply.model.ApplyDAO;
import com.goodjob.apply.model.ApplyDTO;

@Controller
public class ApplyController {
	private ApplyDAO adao;
	
	public ApplyController(ApplyDAO adao) {
		super();
		this.adao = adao;
	}

	@RequestMapping("/apComList.do")
	public ModelAndView apComListForm(@RequestParam(value="cp",defaultValue="1")int cp,@RequestParam(value="noticeidx")int nidx,@RequestParam(value="subject")String subject,HttpSession session) {
		int totalCnt=1;//dao.TotalCnt();
		int listSize=5;
		int pageSize=5;
		
		String pageStr=com.goodjob.page.module.PageModule.makePage("apComList.do", totalCnt, listSize, pageSize, cp);
		List<ApplyDTO> lists=adao.apComList(nidx, cp, listSize);
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.addObject("subject",subject);
		mav.addObject("nidx",nidx);
		mav.setViewName("apply/apComList");
		return mav;
	}
}
