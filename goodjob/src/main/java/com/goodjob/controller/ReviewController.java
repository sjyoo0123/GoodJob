package com.goodjob.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.review.model.ReviewDAO;
import com.goodjob.review.model.ReviewDTO;

@Controller
public class ReviewController {

	@Autowired
	public ReviewDAO reviewDao;

//	// 후기리스트로 이동
//	@RequestMapping(value = "/review.do", method = RequestMethod.GET)
//	public ModelAndView reivewListForm(ReviewDTO dto) {
//		ModelAndView mav = new ModelAndView();
//		
//		List<ReviewDTO> list = reviewDao.reviewList();
//		System.out.println("회사이름 임플"+dto.getCom_name());
//		String com_name="";
//		for(int i =0; i<list.size();i++) {
//			com_name = list.get(i).getCom_name();
//		}
////		List<ReviewDTO> list2 = reviewDao.reviewList2(dto);
//		mav.addObject("list", list);
//		mav.setViewName("review/reviewList");
//		return mav;
//
//	}
	
	/**너무 미완**/
//		@RequestMapping(value="/review.do", method = RequestMethod.GET)
//	    public ModelAndView getReviewList(@RequestParam(value = "com_name", required = false, defaultValue = "") String com_name, Model model, ReviewDTO dto) {
//	        Map<String, Object> map = new HashMap<>();
//	        ModelAndView mav = new ModelAndView();
//	        
//	        List<ReviewDTO> list = reviewDao.reviewList();
//			System.out.println("회사이름 임플"+dto.getCom_name());
//			com_name = "";
//			List<ReviewDTO> reviewList2 = null;
//			for(int i =0; i<list.size();i++) {
//				com_name = list.get(i).getCom_name();
//				map.put("com_name", com_name);
//				reviewList2 = reviewDao.reviewList2();
//			}
//			mav.addObject("dto", reviewList2);
//			mav.setViewName("review/reviewList");
//
//	        return mav;
//	    }
	
	@RequestMapping(value = "/review.do", method = RequestMethod.GET)
	public ModelAndView reivewListForm(ReviewDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		List<ReviewDTO> list = reviewDao.reviewList2();
		System.out.println("회사이름 임플"+dto.getCom_name());
		mav.addObject("dto", list);
		mav.setViewName("review/reviewList");
		return mav;

	}
	
	
	@RequestMapping(value = "/reviewWrite.do", method = RequestMethod.POST)
	public ModelAndView reviewWriteSumbmit(HttpSession session, ReviewDTO dto) {
		System.out.println("처음");
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
	
	@RequestMapping(value = "/injaeList.do", method = RequestMethod.GET)
	public ModelAndView injaeList(HttpSession session, ReviewDTO dto) {
		ModelAndView mav = new ModelAndView();
		
	List<ReviewDTO> list = reviewDao.injaeList();
	mav.addObject("list", list);
	mav.setViewName("injaeInfo/injaeList");
	return mav;
	}
	
	

}
