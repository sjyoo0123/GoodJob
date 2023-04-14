package com.goodjob.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView reivewListForm(HttpSession session, @RequestParam(value="cp",defaultValue="1")int cp, 
			@RequestParam(value = "com_name", defaultValue = "")String keyword) {
		ModelAndView mav = new ModelAndView();
		int idx = (int) session.getAttribute("sidx");
		int totalCnt=reviewDao.reviewTotalCnt(keyword);
		System.out.println(totalCnt);
		int listSize=5;
		int pageSize=5;
		String pageStr=com.goodjob.page.module.PageModule.makePage("review.do", totalCnt, listSize, pageSize, cp);
		
		
		
		List<ReviewDTO> list = reviewDao.reviewList();
		Map map =new HashMap();
		for(int i=0; i<list.size();i++) {
			ResumeDTO dto =  reviewDao.reviewList2(list.get(i).getCom_name(),idx, cp, listSize);
			map.put(list.get(i).getCom_name(), dto);
		}
		mav.addObject("pageStr", pageStr);
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
			mav.addObject("gourl", goUrl);
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
			mav.addObject("goUrl", "reviewList.do");
			mav.setViewName("notice/noticeMsg");
			return mav;
		} else {
			idx = (int) session.getAttribute("sidx");
		}
		
		List<ReviewDTO> list = reviewDao.myReview(idx);
		
		for(int i=0; i<list.size();i++) {
			ResumeDTO dto =  reviewDao.myReviewList(list.get(i).getCom_name());
			dto.setWritedate(list.get(i).getWritedate());
			dto.setAge(list.get(i).getReview_num());
			map.put(list.get(i).getCom_name(), dto);
			mav.addObject("review_num", list.get(i).getReview_num());
		}
		mav.addObject("map", map);
		mav.addObject("list", list);
		mav.setViewName("review/myReview");
		return mav;
	}

	/**리뷰 삭제*/
	@RequestMapping(value="reviewDel.do", method = RequestMethod.POST) 
	public ModelAndView reviewDel(HttpSession session,@RequestParam(value = "ridx")int ridx) {
		ModelAndView mav = new ModelAndView();
		int idx =0;
		idx = (int) session.getAttribute("sidx");
		int result = reviewDao.reviewDel(idx, ridx);
		String msg = result>0 ? "삭제완료":"삭제실패";
		String goUrl = "myReview.do";
		mav.addObject("msg", msg);
		mav.addObject("goUrl",goUrl);
		mav.setViewName("notice/noticeMsg");
		return mav;
	}
}
