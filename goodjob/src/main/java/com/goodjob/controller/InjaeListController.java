package com.goodjob.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.injaelist.model.InjaeListDAO;
import com.goodjob.injaelist.model.InjaeListDTO;
import com.goodjob.module.AjaxPageModule;

@Controller
public class InjaeListController {

	@Autowired
	InjaeListDAO idao;
	
	@RequestMapping("injaeListForm.do")
	public ModelAndView injaeListForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("injaeInfo/injaeList");
		return mav;
	}
	
	@RequestMapping("injaeListGet.do")
	@ResponseBody
	public ModelAndView injaeListGet(@RequestParam(value = "sort" ,defaultValue = "0")int sort,
			@RequestParam(value = "cp",defaultValue = "1")int cp,
			@RequestParam(value = "keyword",defaultValue = "빈")String keyword) {
		ModelAndView mav=new ModelAndView();
		int listSize=5;
		int pageSize=5;
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("sort", sort);
		map.put("keyword", keyword);
		int totalCnt=idao.injaeListTotalCnt(map);
		List<InjaeListDTO> lists=idao.injaeListGet(map);
		mav.addObject("lists", lists);
		mav.addObject("page", AjaxPageModule.makePage(totalCnt, listSize, pageSize, cp));
		mav.setViewName("goodjobJson");
		return mav;
	}
	
}
