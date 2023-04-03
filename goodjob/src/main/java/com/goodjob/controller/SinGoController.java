package com.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.goodjob.singo.model.SinGoDAO;
import com.goodjob.singo.model.SinGoDTO;

@Controller
public class SinGoController {
	@Autowired
	SinGoDAO sgDao;
	
	@RequestMapping(value = "sinGo.do" , method = RequestMethod.POST)
	public void sinGoWrite(SinGoDTO dto) {
		sgDao.sinGoWrite(dto);
	}
}
