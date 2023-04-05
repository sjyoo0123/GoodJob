package com.goodjob.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.faq.model.FAQDAO;
import com.goodjob.faq.model.FAQDTO;

@Controller
public class FAQController {

	@Autowired
	private FAQDAO faqDao;
	
	
	//FAQ 메인페이지 들어가기
	@RequestMapping("/manFAQList.do")
	public ModelAndView manFAQList(@RequestParam(value = "cp",defaultValue = "1")int cp,
			@RequestParam(value = "category",defaultValue = "전체")String category) {
		
		ModelAndView mav=new ModelAndView();
		
		int totalCnt=0;
		int listSize=5;
		int pageSize=5; 
		List<FAQDTO> lists=null;
		
			totalCnt=faqDao.manFAQAllCnt();
			lists=faqDao.manFAQList(cp, listSize);
	
		
		String pageStr=com.goodjob.page.module.PageModule.makePage("manFAQList.do", totalCnt, listSize, pageSize, cp);
		
		lists=faqDao.manFAQList(cp, listSize);
		
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);
		mav.addObject("cp", cp);
		mav.setViewName("FAQ/manFAQList");
		System.out.println(totalCnt);
		
		return mav;
	}
	@RequestMapping("userFAQList")
	public ModelAndView userFaqList(@RequestParam(value="cp",defaultValue = "1") int cp) {
		ModelAndView mav= new ModelAndView();
		mav.addObject("fList",faqDao.manFAQList(cp, 15));
		mav.setViewName("FAQ/userFAQList");
		return mav;
	}


	//FAQ 등록하는 페이지 들어가기
	@RequestMapping("/manFAQAddPage.do")
	public String manFAQAddPage() {
		
		return "FAQ/manFAQAddPage";
	}
	
	
	//FAQ 게시글 등록하기
	@RequestMapping(value = "/manFAQAdd.do", method = RequestMethod.POST)
	public ModelAndView manFAQAdd(FAQDTO dto) {
		
		String msg="";
		int count=0;
		
		ModelAndView mav=new ModelAndView();
		if(dto.getCategory().equals("") || dto.getCategory()==null || dto.getContent().equals("") || dto.getContent()==null || dto.getSubject().equals("") || dto.getSubject()==null) {
			msg="등록에 실패하셨습니다.";
			mav.addObject("goUrl", "manFAQAddPage.do");
		}else {
			count=faqDao.manFAQAdd(dto);
			msg="등록에 성공하셨습니다.";
			mav.addObject("goUrl", "manFAQList.do");
			
		}
		
		mav.addObject("msg", msg);
		mav.setViewName("FAQ/manFAQMsg");
	
		System.out.println(dto.toString());
		System.out.println(count);
		return mav;
	}
	//FAQ 본문 들어가기
	@RequestMapping("/manFAQContent.do")
	public ModelAndView manFAQContent(@RequestParam(value = "idx")int idx) {
		
		FAQDTO dto=faqDao.manFAQContent(idx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dto", dto);
		mav.setViewName("FAQ/manFAQContent");
		
		return mav;
	}
	//FAQ 수정 페이지 들어가기
	@RequestMapping("/manFAQUpdatePage.do")
	public ModelAndView manFAQUpdatePage(@RequestParam(value = "idx")int idx) {
		
		FAQDTO dto=faqDao.manFAQContent(idx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("dto", dto);
		mav.setViewName("FAQ/manFAQUpdatePage");
		
		return mav;
	}
	
	//FAQ 수정하기
	@RequestMapping(value = "/manFAQUpdate.do", method = RequestMethod.POST)
	public ModelAndView manFAQUpdate(FAQDTO dto) {
		
		String msg="";
		int count=0;
		ModelAndView mav=new ModelAndView();
		
		if(dto.getCategory().equals("") || dto.getCategory()==null || dto.getContent().equals("") || dto.getContent()==null || dto.getSubject().equals("") || dto.getSubject()==null) {
			msg="수정에 실패하셨습니다.";
			mav.addObject("goUrl", "manFAQUpdatePage.do");
			mav.addObject("msg", msg);
		}else {
			
			count=faqDao.manFAQUpdate(dto);
			msg="수정에 성공하셨습니다.";
			mav.addObject("goUrl", "manFAQList.do");	
			mav.addObject("msg", msg);
		}
		mav.setViewName("FAQ/manFAQMsg");
		
		return mav;
	
	}
	
	//FAQ 글 삭제하기
	@RequestMapping("/manFAQDel.do")
	public ModelAndView manFAQDel(@RequestParam(value= "idx")int idx) {
		
	
		ModelAndView mav=new ModelAndView();
	
		int count=faqDao.manFAQDel(idx);
		
		mav.addObject("msg","삭제에 성공하셨습니다.");
		mav.addObject("goUrl", "manFAQList.do");
		mav.setViewName("FAQ/manFAQMsg");
		
		return mav;
		
	}
	
	//FAQ 검색하기
	@RequestMapping("/manFAQSearch.do")
	public ModelAndView manFAQSearch(@RequestParam(value= "cp", defaultValue = "1")int cp,
			@RequestParam(value = "search", required = false)String search ) {
		
		ModelAndView mav=new ModelAndView();
		
		int totalCnt=faqDao.manFAQAllCnt();
		int listSize=5;
		int pageSize=5;
			
		List<FAQDTO> lists=faqDao.manFAQSearch(cp, pageSize,search);
		
		String pageStr=com.goodjob.page.module.PageModule.makePage("manFAQSearch.do", totalCnt, listSize, pageSize, cp);
		
		mav.addObject("lists", lists);
		
		mav.addObject("pageStr", pageStr);
		
		mav.setViewName("FAQ/manFAQSearch");
		return mav;
	}
	
}
