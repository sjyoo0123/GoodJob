package com.goodjob.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.gongji.model.GongJiDAO;
import com.goodjob.gongji.model.GongJiDTO;
import com.goodjob.module.AjaxPageModule;

@Controller
public class GongJiController {
	@Autowired
	GongJiDAO gDao;

	@RequestMapping(value= "userGongJiList.do",method = RequestMethod.GET)
	public ModelAndView userGongJiList(@RequestParam(value = "cp",defaultValue = "1")int cp,
			@RequestParam(value = "subject",defaultValue = "")String subject,
			@RequestParam(value="bAjax", defaultValue = "false")boolean bAjax) {
		ModelAndView mav= new ModelAndView();
		int totalCnt=gDao.userGongJiTotalCnt(subject);
		int pageSize=5;
		int listSize=10;
		int start = (cp - 1) * listSize+1;
		int end = cp * listSize;
		mav.addObject("list",gDao.userGongJiList(subject, start, end));
		mav.addObject("page",AjaxPageModule.makePage(totalCnt, listSize, pageSize, cp));
		if(bAjax) {
			mav.setViewName("goodjobJson");
		}else {
			mav.setViewName("gongji/userGongJiList");
			
		}
		return mav;
	}
	@RequestMapping(value = "userGongJiContent.do",method = RequestMethod.GET)
	public ModelAndView gongjiContent(@RequestParam(value = "idx",defaultValue = "0")int idx) {
		ModelAndView mav= new ModelAndView();
		mav.addObject("dto", gDao.gongJiContent(idx));
		mav.setViewName("gongji/userGongJiContent");
		return mav;
	}
	
	@RequestMapping(value="/manGongjiList.do")
	public ModelAndView manGongjiList(@RequestParam(value="cp",defaultValue = "1")int cp) {
		ModelAndView mav=new ModelAndView();
		int totalCnt=gDao.manGongjiListTotalCnt();
		int listSize=5;
		int pageSize=5;
		String pagestr=com.goodjob.page.module.PageModule.makePage("manGongjiList.do", totalCnt, listSize, pageSize, cp);
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map<String,Integer> map=new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		List<GongJiDTO> lists=gDao.manGongjiList(map);
		mav.addObject("lists", lists);
		mav.addObject("pagestr",pagestr);
		mav.setViewName("manGongJi/manGongJiList");
		return mav;
	}
	
	
	@RequestMapping(value = "/manGongjiUpdateForm.do")
	public ModelAndView gongJiUpdateForm(int idx) {
		ModelAndView mav=new ModelAndView();
		GongJiDTO dto=gDao.gongJiContent(idx);
		mav.addObject("dto", dto);
		mav.setViewName("manGongJi/manGongJiUpdate");
		return mav;
	}
	
	@RequestMapping(value = "/manGongjiUpdate.do")
	public ModelAndView gongJiUpdate(GongJiDTO dto) {
		ModelAndView mav=new ModelAndView();
		int result=gDao.gongJiUpdate(dto);
		String msg=result>0?"업데이트 성공!":"업데이스 실패";
		mav.addObject("msg",msg);
		mav.setViewName("manGongJi/gongjiMsg");
		return mav;
	}
	
	@RequestMapping(value= "/manGongjiInertForm.do")
	public String gongJiInsertForm() {
		return "manGongJi/manGongJiInsert";
	}
	
	@RequestMapping(value = "/manGongjiInsert.do")
	public ModelAndView gongJiInsert(GongJiDTO dto) {
		ModelAndView mav=new ModelAndView();
		int result=gDao.gongJiInsert(dto);
		String msg=result>0?"글작성 성공!":"글작성 실패";
		mav.addObject("msg", msg);
		mav.setViewName("manGongJi/gongjiMsg");
		return mav;
	}
	@RequestMapping(value = "/manGongjiDel.do")
	public ModelAndView gongJiDel(int idx) {
		ModelAndView mav=new ModelAndView();
		int result=gDao.gongJiDel(idx);
		String msg=result>0?"삭제 성공!":"삭제 실패...";
		mav.addObject("msg", msg);
		mav.setViewName("manGongJi/gongjiMsg");
		return mav;
	}
	@RequestMapping(value="/manGonjiContent.do")
	public ModelAndView manGongJiContent(int idx) {
		ModelAndView mav=new ModelAndView();
		GongJiDTO dto=gDao.gongJiContent(idx);
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		mav.addObject("dto", dto);
		mav.setViewName("manGongJi/manGongJiContent");
		return mav;
	}
}
