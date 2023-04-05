package com.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.job.model.JobDAO;

import java.util.*;
@Controller
public class JobController {

	@Autowired
	private JobDAO jdao;
	
	@RequestMapping("/joblist.do")
	public ModelAndView jobListForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("hope_job/joblist");
		return mav;
	}
	
	@RequestMapping("/job.do")
	@ResponseBody
	public List<String> jobList() {

		List<String> data =jdao.jobList();
		

		return data;
	}
	@RequestMapping(value="/job.do",method=RequestMethod.POST)
	@ResponseBody
	public List<String> jobList2(@RequestParam(value="job1")String job1) {

		List<String> data =jdao.jobList2(job1);
		

		return data;
	}
}
