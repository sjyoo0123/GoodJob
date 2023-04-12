package com.goodjob.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.resume.model.ResumeDTO;
import com.goodjob.review.model.ReviewDAO;
import com.goodjob.review.model.ReviewDTO;


@Controller
public class ReviewController {

	@Autowired
	public ReviewDAO reviewDao;
	
	/**키워드 리스트 조회*/
	@RequestMapping(value = "/review.do", method = RequestMethod.GET)
	public ModelAndView reivewListForm() {
		ModelAndView mav = new ModelAndView();
		List<ReviewDTO> list = reviewDao.reviewList();
		Map map =new HashMap();
		for(int i=0; i<list.size();i++) {
			ResumeDTO dto =  reviewDao.reviewList2(list.get(i).getCom_name());
			map.put(list.get(i).getCom_name(), dto);
		}
		mav.addObject("map", map);
		mav.addObject("list", list);
		mav.setViewName("review/reviewList");
		
		return mav;
		
	}
	/**키워드 작성*/
	@RequestMapping(value = "/reviewWrite.do", method = RequestMethod.POST)
	public ModelAndView reviewWriteSumbmit(HttpSession session, ReviewDTO dto) {
		ModelAndView mav = new ModelAndView();
		int idx = 0;

		if (session.getAttribute("sidx") == null || session.getAttribute("sidx") == "") {
			String msg = "로그인 후 이용바랍니다.";
			String goUrl = "index.do";
			mav.addObject("msg", msg);
			mav.setViewName("notice/noticeMsg");
			return mav;
		} else {
			idx = (int) session.getAttribute("sidx");
		}
		dto.setMember_idx(idx);
		int test = reviewDao.reviewSetReviewNum() + 1;
		dto.setReview_num(test);
		int result = reviewDao.reviewWrite(dto);

		String msg = result > 0 ? "후기 작성성공" : "후기 작성실패";
		mav.addObject("msg", msg);
		mav.setViewName("review/reviewMsg");
		return mav;
	}
	/**인재정보*/
	@RequestMapping(value = "/injaeList.do", method = RequestMethod.GET)
	public ModelAndView injaeList(HttpSession session, ReviewDTO dto) {
		ModelAndView mav = new ModelAndView();

		List<ReviewDTO> list = reviewDao.injaeList();
		mav.addObject("list", list);
		mav.setViewName("injaeInfo/injaeList");
		return mav;
	}
	/**나의 후기*/
	@RequestMapping(value = "myReview.do", method = RequestMethod.GET)
	public ModelAndView myReview(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Map map =new HashMap();
		int idx =0 ;
		if (session.getAttribute("sidx") == null || session.getAttribute("sidx") == "") {
			String msg = "로그인 후 이용바랍니다.";
			String goUrl = "index.do";
			mav.addObject("msg", msg);
			mav.addObject("url", "reviewList.do");
			mav.setViewName("notice/noticeMsg");
			return mav;
		} else {
			idx = (int) session.getAttribute("sidx");
		}
		
		List<ReviewDTO> list = reviewDao.myReview(idx);
		
		for(int i=0; i<list.size();i++) {
			ResumeDTO dto =  reviewDao.reviewList2(list.get(i).getCom_name());
			dto.setWritedate(list.get(i).getWritedate());
			map.put(list.get(i).getCom_name(), dto);
		}
		mav.addObject("map", map);
		mav.addObject("list", list);
		mav.setViewName("review/myReview");
		
		return mav;
	}
	/**리뷰 삭제*/
	@RequestMapping(value="reviewDel.do", method = RequestMethod.POST) 
	public ModelAndView reviewDel(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
}
