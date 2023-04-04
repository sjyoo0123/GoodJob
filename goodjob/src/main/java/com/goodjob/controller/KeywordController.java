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

	// 후기작성으로 이동 작성이 안되면 겟 메소드로 수정
	@RequestMapping("/reviewWrite.do")
	public ModelAndView reviewWriteForm(KeywordDTO dto) {

		ModelAndView mav = new ModelAndView();
		List<KeywordDTO> list = keyworddao.reviewWriteForm();
		mav.addObject("dto", list);
		System.out.println(list);
		mav.setViewName("review/reviewWrite");
		return mav;
	}

}
