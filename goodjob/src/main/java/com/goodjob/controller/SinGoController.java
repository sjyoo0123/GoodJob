package com.goodjob.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.goodjob.blacklist.model.BlackListDAO;
import com.goodjob.module.FileCopy;
import com.goodjob.singo.model.SinGoDAO;
import com.goodjob.singo.model.SinGoDTO;
import com.goodjob.totalfile.model.TotalFileDAO;

@Controller
public class SinGoController {
	@Autowired
	SinGoDAO sgDao;
	@Autowired
	BlackListDAO bDao;
	@Autowired
	TotalFileDAO fDao;
	@ResponseBody
	@RequestMapping(value = "sinGo.do" , method = RequestMethod.POST)
	public int sinGoWrite(SinGoDTO dto,MultipartFile file,
			HttpServletRequest req) {
		int write=sgDao.sinGoWrite(dto);
		bDao.manBlackListUpdateSingoCount(dto.getMember_idx());
		String fcategory="singo";
		if(file!=null) {
			FileCopy fc=new FileCopy();
			fc.copyInto(fcategory, file, req);
			Map<String, String>map=new HashMap<String, String>();
			map.put("category",fcategory);
			map.put("file",fcategory+"/"+ file.getOriginalFilename());
			map.put("table_name", fcategory);
			fDao.manFileAdd(map);
		}
		
		return write;
	}
}
