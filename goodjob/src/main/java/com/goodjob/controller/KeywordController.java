package com.goodjob.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.keyword.model.KeywordDAO;
import com.goodjob.keyword.model.KeywordDTO;

@Controller
public class KeywordController {
	
	@Autowired
	public KeywordDAO keyworddao;
	
	//	후기작성으로 이동
	@RequestMapping( "/reviewWrite.do")
	public ModelAndView reviewWriteForm(KeywordDTO dto) {
		
		ModelAndView mav = new ModelAndView();
		List<KeywordDTO> list = keyworddao.reviewWriteForm();

		int idsize = list.size();
		int keyidx = dto.getIdx();
		
		mav.addObject("idsize", idsize);
		mav.addObject("keyidx", keyidx);
		System.out.println(keyidx);
		
		mav.addObject("dto", list);
		mav.setViewName("review/reviewWrite");
		return mav;
	}
	
	
	
}
