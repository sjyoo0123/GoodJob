package com.goodjob.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.notice.model.NoticeDTO;
import com.goodjob.plan_used_up.model.Plan_Used_UpDAO;
import com.goodjob.plan_used_vip.model.Plan_Used_VipDAO;
import com.goodjob.plan_used_vip.model.Plan_Used_VipDTO;


@Controller
public class PlanComController {
	
	@Autowired
	private Plan_Used_VipDAO vdao;
	@Autowired
	private Plan_Used_UpDAO udao;
	
	@RequestMapping("/comPlanList.do")
	public ModelAndView comPlanList(@RequestParam(value="cp",defaultValue="1")int cp,@RequestParam(value="plan_type",defaultValue = "VIP")String plan_type,HttpSession session) {
		ModelAndView mav=new ModelAndView();
		int cidx=0;
		if(session.getAttribute("sidx")!=null) {
			cidx=(int)session.getAttribute("sidx");
		}
		int totalCnt=1;//vdao.TotalCnt(cidx);
		int listSize=5;
		int pageSize=5;
		List<NoticeDTO> list=null;
		if(plan_type.equals("VIP")) {
			list=vdao.comUsedVIP(cidx, cp, listSize);
		}else if(plan_type.equals("UP")) {
			list=udao.comUsedUP(cidx, cp, listSize);
		}
		String pageStr=com.goodjob.page.module.PageModule.makePage("comPlanList.do", totalCnt, listSize, pageSize, cp);
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.addObject("plan_type", plan_type);
		mav.setViewName("plan/comPlanList");
		return mav;
	}
	
	@RequestMapping(value="/comUpCount.do",method=RequestMethod.POST)
	@ResponseBody
	public int comUpCount(int idx) {
		int count=udao.comUpCount(idx);
		return count;
	}
	@RequestMapping(value="/comUpCountUse.do",method=RequestMethod.POST)
	@ResponseBody
	public int comUpCountUse(int idx) {
		int result=udao.comUpCountUse(idx);
		return result;
	}

}
