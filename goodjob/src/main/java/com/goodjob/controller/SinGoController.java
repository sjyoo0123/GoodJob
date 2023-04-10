package com.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goodjob.blacklist.model.BlackListDAO;
import com.goodjob.singo.model.SinGoDAO;
import com.goodjob.singo.model.SinGoDTO;

@Controller
public class SinGoController {
	@Autowired
	SinGoDAO sgDao;
	@Autowired
	BlackListDAO bDao;
	@ResponseBody
	@RequestMapping(value = "sinGo.do" , method = RequestMethod.POST)
	public String sinGoWrite(SinGoDTO dto) {
		String msg=sgDao.sinGoWrite(dto)>0?"작성성공":"작성실패";
		int count=bDao.manBlackListUpdateSingoCount(0);
		return msg;
	}
}
