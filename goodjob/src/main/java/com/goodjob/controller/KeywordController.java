package com.goodjob.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.keyword.model.KeywordDAO;
import com.goodjob.keyword.model.KeywordDTO;

@Controller
public class KeywordController {

	@Autowired
	public KeywordDAO keyworddao;

	// 후기작성으로 이동 작성이 안되면 겟 메소드로 수정
	@RequestMapping(value = "reviewWrite.do", method = RequestMethod.GET)
	public ModelAndView reviewWriteForm(HttpSession session,  KeywordDTO dto) {
		ModelAndView mav = new ModelAndView();
		int idx =0 ;
		if(session.getAttribute("sidx")==null||session.getAttribute("sidx")=="") {
			String msg="로그인 후 이용바랍니다.";
			String goUrl="index.do";
			mav.addObject("msg", msg);
			mav.setViewName("notice/noticeMsg");
			return mav;
		}else {
			idx=(int)session.getAttribute("sidx");
		}
		
		
		
		List<KeywordDTO> list = keyworddao.reviewWriteForm();
		mav.addObject("dto", list);
		System.out.println("키워드컨트롤러="+list);
		mav.setViewName("review/reviewWrite");
		return mav;
	}
	
	//관리자 리뷰 페이지 들어가기
	@RequestMapping("/manReviewPage.do")
	public ModelAndView manReviewPage() {
		
		ModelAndView mav=new ModelAndView();
		
		List<KeywordDTO> lists=keyworddao.manKeywordList();
		
		mav.addObject("lists", lists);
		
		mav.setViewName("manReview/manReviewPage");
		
		return mav;
	}
	
	/**관리자 키워드 추가하기*/
	@RequestMapping("/manKeywordAdd.do")
	public ModelAndView manKeywordAdd(KeywordDTO dto) {
		
		ModelAndView mav=new ModelAndView();
		
		int count=keyworddao.manKeywordAdd(dto);
		
		System.out.println(dto.getContent());
		
		if(count>0) {
			
			mav.addObject("msg", "키워드 추가 성공!");
		}else {
			mav.addObject("msg", "키워드 추가 실패!");
		}
		
		mav.addObject("goUrl", "manReviewPage.do");
		mav.setViewName("manReview/manReviewMsg");
		
		return mav;
	}
	
	/**관리자 키워드 삭제하기*/
	@RequestMapping("/manKeywordDel.do")
	public ModelAndView manKeywordDel(
			@RequestParam(value= "keywordDel")String keywordDel,
			@RequestParam(value="keywordDel2")int keywordDel2) {
		
		ModelAndView mav=new ModelAndView();
		
		int count=keyworddao.manKeywordDel(keywordDel2);
		
		if(count>0) {
			
			mav.addObject("msg", "키워드 삭제 성공");
		}else {
			mav.addObject("msg", "키워드 삭제 실패");
		}
		mav.addObject("goUrl", "manReviewPage.do");
		mav.setViewName("manReview/manReviewMsg");
		
		return mav;
	}
	
}
