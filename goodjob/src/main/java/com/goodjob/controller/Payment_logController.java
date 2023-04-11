package com.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.goodjob.plan_up.model.Plan_UpDTO;

@Controller
public class Payment_logController {

	@Autowired
	private Plan_UpDTO planUpDto;

	
}
