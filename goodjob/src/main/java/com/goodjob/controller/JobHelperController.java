
package com.goodjob.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.goodjob.jobhelper.model.JobHelperDAO;
import com.goodjob.jobhelper.model.JobHelperDTO;

@Controller
public class JobHelperController {
	
	@Autowired
	JobHelperDAO jdao;
	
	@RequestMapping("/jobHelperTong.do")
	public ModelAndView jobHelperTongForm() {
		ModelAndView mav=new ModelAndView();
		
		List<String> lists=jdao.helperJobCategoryGet();
		mav.addObject("lists", lists);
		mav.setViewName("jobHelper/tongForm");
		
		return mav;
	}
	
	@RequestMapping("/helperJobGet.do")
	@ResponseBody
	public ModelAndView helperJobGet(@RequestParam(value = "job")String job) {
		ModelAndView mav=new ModelAndView();
		List<JobHelperDTO> lists=jdao.helperJobGet(job);
		
		List<Map<String, Object>> jsonData = new ArrayList<>();
		for (JobHelperDTO helper : lists) {
		    Map<String, Object> helperData = new HashMap<>();
		    helperData.put("category", helper.getCategory());
		    helperData.put("price", helper.getPrice());
		    jsonData.add(helperData);
		}
		
		ObjectMapper mapper=new ObjectMapper();
		try {
			String jsonString = mapper.writeValueAsString(jsonData);
			mav.addObject("lists", jsonString);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.setViewName("goodjobJson");
		return mav;
		
	}
	@RequestMapping("/helperLocalGet.do")
	@ResponseBody
	public ModelAndView helperLocalGet(@RequestParam(value = "local")String local) {
		ModelAndView mav=new ModelAndView();
		String clocal=com.goodjob.module.Module.local1change(local);
		List<JobHelperDTO> lists=jdao.helperLocalGet(clocal);
		List<Map<String, Object>> jsonData = new ArrayList<>();
		for (JobHelperDTO helper : lists) {
		    Map<String, Object> helperData = new HashMap<>();
		    helperData.put("category", helper.getCategory());
		    helperData.put("price", helper.getPrice());
		    jsonData.add(helperData);
		}
		
		ObjectMapper mapper=new ObjectMapper();
		try {
			String jsonString = mapper.writeValueAsString(jsonData);
			mav.addObject("lists", jsonString);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		mav.setViewName("goodjobJson");
		return mav;
		
	}
	
	@RequestMapping("/helperCalForm.do")
	public String helperCalForm() {
		return "jobHelper/calForm";
	}
}
