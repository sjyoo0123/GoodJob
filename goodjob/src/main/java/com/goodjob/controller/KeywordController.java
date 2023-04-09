package com.goodjob.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.keyword.model.KeywordDAO;
import com.goodjob.keyword.model.KeywordDTO;

@Controller
public class KeywordController {

	@Autowired
	public KeywordDAO keyworddao;

	// 후기작성으로 이동 작성이 안되면 겟 메소드로 수정
	@RequestMapping(value = "reviewWrite.do", method = RequestMethod.GET)
	public ModelAndView reviewWriteForm(HttpSession session,  KeywordDTO dto) {
		ModelAndView mav = new ModelAndView();
		int idx =0 ;
		if(session.getAttribute("sidx")==null||session.getAttribute("sidx")=="") {
			String msg="로그인 후 이용바랍니다.";
			String goUrl="index.do";
			mav.addObject("msg", msg);
			mav.setViewName("notice/noticeMsg");
			return mav;
		}else {
			idx=(int)session.getAttribute("sidx");
		}
		
		
		
		List<KeywordDTO> list = keyworddao.reviewWriteForm();
		mav.addObject("dto", list);
		System.out.println("키워드컨트롤러="+list);
		mav.setViewName("review/reviewWrite");
		return mav;
	}

}
