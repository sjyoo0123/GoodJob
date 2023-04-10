package com.goodjob.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.notice.model.NoticeDTO;
import com.goodjob.plan_used_vip.model.Plan_Used_VipDAO;
import com.goodjob.plan_used_vip.model.Plan_Used_VipDTO;


@Controller
public class PlanComController {
	
	@Autowired
	private Plan_Used_VipDAO vdao;

	@RequestMapping("/comPlanList.do")
	public ModelAndView comPlanList(@RequestParam(value="cp",defaultValue="1")int cp,HttpSession session) {
		int cidx=0;
		if(session.getAttribute("sidx")!=null) {
			cidx=(int)session.getAttribute("sidx");
		}
		int totalCnt=1;//vdao.TotalCnt(cidx);
		int listSize=5;
		int pageSize=5;
		String pageStr=com.goodjob.page.module.PageModule.makePage("comPlanList.do", totalCnt, listSize, pageSize, cp);
		List<NoticeDTO> list=vdao.comUsedVIP(cidx, cp, listSize);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("plan/comPlanList");
		return mav;
	}

}
