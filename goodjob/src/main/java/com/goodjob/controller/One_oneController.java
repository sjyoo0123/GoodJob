package com.goodjob.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.one_one.model.One_OneDAO;
import com.goodjob.one_one.model.One_OneDTO;

@Controller
public class One_OneController {
	
	@Autowired
	private One_OneDAO oneDao;
	
	//일대일문의 들어가기
	@RequestMapping("/manOneList.do")
	public ModelAndView manOneList(@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		ModelAndView mav=new ModelAndView();
		
		int totalCnt=oneDao.manOneAllCnt();
		int pazeSize=5;
		int listSize=5;

		List<One_OneDTO> lists=oneDao.manOneList(cp, listSize);
		
		String pageStr=com.goodjob.page.module.PageModule.makePage("manOneList.do", totalCnt, listSize, pazeSize, cp);
		
		System.out.println(totalCnt);
	
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("one/manOneList");
		
		return mav;
		
	}
	
	//일대일 문의 본문 들어가기
	@RequestMapping("/manOneContent.do")
	public ModelAndView manOneContent(@RequestParam (value="idx")int idx) {
		
		ModelAndView mav=new ModelAndView();
		
		One_OneDTO dto=oneDao.manOneContent(idx);
		
		mav.addObject("dto", dto);
		mav.setViewName("one/manOneContent");
		
		return mav;
	}
	
	//일대일 문의 수정 페이지 들어가기
	@RequestMapping("/manOneAnswerPage.do")
	public ModelAndView manOneAnswerPage(@RequestParam(value="idx")int idx) {
		
		ModelAndView mav=new ModelAndView();
		
		One_OneDTO dto=oneDao.manOneContent(idx);
		
		mav.addObject("dto", dto);
		mav.setViewName("one/manOneAnswerPage");
		
		return mav;
		
	}
	
	//일대일 문의 답변하기 누르기
	@RequestMapping("/manOneAnswer.do")
	public ModelAndView manOneAnswer(One_OneDTO dto) {
		
		ModelAndView mav=new ModelAndView();
		
		
		
		if(dto==null || dto.equals("")) {
			mav.addObject("msg", "수정에 실패하셨습니다");
			mav.addObject("goUrl", "manOneList.do");
		}else {
			int count=oneDao.manFAQAnswer(dto);
			mav.addObject("msg", "수정에 성공하셨습니다.");
			mav.addObject("goUrl", "manOneList.do");
		}
			mav.setViewName("one/manOneMsg");
		
		
		
		return mav;
	}
	
}
