package com.goodjob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.goodjob.module.AjaxPageModule;
import com.goodjob.notice.model.NoticeDAO;
import com.goodjob.notice.model.NoticeDTO;
import java.util.*;

@Controller
public class NoticeController {

	private NoticeDAO ndao;
	
	public NoticeController(NoticeDAO ndao) {
		super();
		this.ndao = ndao;
	}

	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.GET)
	public ModelAndView noticeWriteForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/noticeWrite");
		return mav;
	}
	
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.POST)
	public ModelAndView noticeWriteSubmit(NoticeDTO dto,String workstarttime1,String workstarttime2,String workendtime1,String workendtime2) {
		ModelAndView mav=new ModelAndView();
		String starttime=workstarttime1+workstarttime2;
		dto.setStarttime(Integer.parseInt(starttime));
		String finishtime=workendtime1+workendtime2;
		dto.setFinishtime(Integer.parseInt(finishtime));
		if(dto.getPay_category().equals("시급")) {
			int pay_month=(dto.getFinishtime()-dto.getStarttime())*dto.getPay_hour();
			dto.setPay_month(pay_month);
		}else if(dto.getPay_category().equals("월급")) {
			int pay_month=(dto.getFinishtime()-dto.getStarttime())*dto.getPay_hour()*dto.getWorktime();
			dto.setPay_month(pay_month);
		}
		int result=ndao.noticeWrite(dto);
		String msg=result>0?"작성완료":"작성실패";
		mav.addObject("msg", msg);
		mav.setViewName("notice/noticeMsg");
		return mav;
	}
	@RequestMapping("/noticeComList.do")
	public ModelAndView noticeComListForm(@RequestParam(value="cp",defaultValue="1")int cp,HttpSession session) {
		int totalCnt=0;//getTotalCnt();
		int listSize=5;
		int pageSize=5;
		
		String pageStr=com.goodjob.page.module.PageModule.makePage("noticeComList.do", totalCnt, listSize, pageSize, cp);
		int idx=(int)session.getAttribute("sidx");
		List<NoticeDTO> lists=ndao.noticeComList(idx,cp,listSize);
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.setViewName("notice/noticeComList");
		return mav;
	}
	@RequestMapping(value="noticeList.do",method = RequestMethod.GET)
	public ModelAndView noticeList(@RequestParam(value="cp",defaultValue="0")int cp,
			@RequestParam(value="listWeekday",defaultValue = "")String[] listWeekday,
			@RequestParam(value="local3",defaultValue = "")String[] local3,
			@RequestParam(value="local2",defaultValue = "")String[] local2) {
		ModelAndView mav=new ModelAndView();
		for(int i=0;i<listWeekday.length;i++) {
			System.out.println(listWeekday[i]);
		}
		if(cp==0) {
			mav.addObject("page",AjaxPageModule.makePage(0, 10, 5, 1));
			mav.setViewName("notice/noticeList");
			return mav;
		}else {
			mav.addObject("dtos","{\"1\":\"2\"}{\"1\":\"2\"}");
			mav.addObject("page", AjaxPageModule.makePage(0, 10, 5, cp));
			mav.setViewName("goodjobJson");
			
			return mav;
		}
		
	}
}
