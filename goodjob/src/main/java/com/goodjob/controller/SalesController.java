package com.goodjob.controller;

import java.sql.Date;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.goodjob.sales.model.SalesDAO;
import com.goodjob.sales.model.SalesDTO;

@Controller
public class SalesController {

	@Autowired
	SalesDAO sdao;
	
	@RequestMapping("/salesForm.do")
	public String salesForm() {
		return "sales/salesForm";
	}
	
	@RequestMapping("/salesGetPeriod.do")
	@ResponseBody
	public ModelAndView salesGetPeriod(@RequestParam(value = "startdate")String startdate,
			@RequestParam(value="enddate")String enddate) {
		ModelAndView mav=new ModelAndView();
		Map<String,String> map=new HashMap<String,String>();
		map.put("startdate", startdate);
		map.put("enddate", enddate);
		List<SalesDTO> lists=sdao.salesGetPeriod(map);
		List<Map<String, Object>> jsonData = new ArrayList<>();
		
		for (SalesDTO sales : lists) {
		    Map<String, Object> salesData = new HashMap<>();
		    salesData.put("date", sales.getPaydate());
		    salesData.put("price", sales.getPrice());
		    jsonData.add(salesData);
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
	@RequestMapping("/salesGetMonth.do")
	@ResponseBody
	public ModelAndView salesGetPeriod(@RequestParam(value = "monthdate")String monthdate) {
		ModelAndView mav=new ModelAndView();
		Map<String,String> map=new HashMap<String,String>();
		map.put("month1", monthdate);
		map.put("month2", monthdate);
		List<SalesDTO> lists=sdao.salesGetMonth(map);
		List<Map<String, Object>> jsonData = new ArrayList<>();
		
		for (SalesDTO sales : lists) {
		    Map<String, Object> salesData = new HashMap<>();
		    salesData.put("date", sales.getPaydate());
		    salesData.put("price", sales.getPrice());
		    jsonData.add(salesData);
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
}
