package com.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.goodjob.totalfile.model.TotalFileDAO;

@Controller
public class TotalFileController {

	@Autowired
	private TotalFileDAO totalFileDao;
	
	
	
}
