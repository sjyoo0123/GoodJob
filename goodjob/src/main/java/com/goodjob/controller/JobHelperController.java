
package com.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.goodjob.jobhelper.model.JobHelperDAO;

@Controller
public class JobHelperController {
	
	@Autowired
	JobHelperDAO jdao;
	
	@RequestMapping("jobHelperTong.do")
	public String jobHelperTongForm() {
		return "jobHelper/tongForm";
	}
}
