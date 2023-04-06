package com.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.career.model.CareerDTO;
import com.goodjob.member.model.MemberDAO;
import com.goodjob.member.model.MemberDTO;
import com.goodjob.module.Module;
import com.goodjob.normalmember.model.NormalMemberDAO;
import com.goodjob.resume.model.ResumeDAO;
import com.goodjob.resume.model.ResumeDTO;
import com.goodjob.review.model.ReviewDTO;

@Controller
public class ResumeController {

	@Autowired
	public ResumeDAO resumeDao;

	@Autowired
	public MemberDAO memberDao;

	@Autowired
	public NormalMemberDAO normalmemberDao;

	public ResumeController(MemberDAO memberDao) {
		super();
		this.memberDao = memberDao;
	}

	/** 이력서 조회 */
	@RequestMapping(value = "/writeForm.do", method = RequestMethod.GET)
	public ModelAndView resumeWriteForm() {
		ModelAndView mav = new ModelAndView();
		MemberDTO dto = memberDao.resumeWriteForm();
		ReviewDTO nto = normalmemberDao.resumeWriteForm1();
		mav.addObject("dto", dto);
		mav.addObject("nto", nto);
		mav.setViewName("resume/resumeWrite");
		return mav;
	}

	/** 이력서 작성 */
	@RequestMapping(value = "/resumeWrite.do", method = RequestMethod.POST)
	public ModelAndView resumeWriteSubmit(ResumeDTO dto, CareerDTO cto, String startday_s, String endday_s,
			MemberDTO mto) {
		ModelAndView mav = new ModelAndView();
		int result = 0;
		Module mo = new Module();
		ResumeDTO getridx = resumeDao.resumeDown();

		if (dto.getCareer_check().equals("신입")) {
			result = resumeDao.resumeWrite(dto);
		} else {
			cto.setResume_idx(getridx.getIdx());
			System.out.println("resumeidx=" + cto.getResume_idx());
			cto.setStartday(mo.datePasing(startday_s));
			cto.setEndday(mo.datePasing(endday_s));
			result = resumeDao.resumeWrite2(dto, cto);
		}
		String msg = result > 0 ? "이력서 작성 성공" : "이력서 작성 실패";
		mav.addObject("msg", msg);
		mav.setViewName("review/reviewMsg");

		return mav;
	}

	/** 이력서 다운로드 */
	@RequestMapping(value = "resumeDown.do", method = RequestMethod.GET)
	public ModelAndView resumeDown() {
		ModelAndView mav = new ModelAndView();
		ResumeDTO rto = resumeDao.resumeDown();
		String yy = "";
		if (rto.getH_workday().charAt(0) == '1') {
			yy += "월";
		}
		if (rto.getH_workday().charAt(1) == '1') {
			yy += "화";
		}
		if (rto.getH_workday().charAt(2) == '1') {
			yy += "수";
		}
		if (rto.getH_workday().charAt(3) == '1') {
			yy += "목";
		}
		if (rto.getH_workday().charAt(4) == '1') {
			yy += "금";
		}
		if (rto.getH_workday().charAt(5) == '1') {
			yy += "토";
		}
		if (rto.getH_workday().charAt(6) == '1') {
			yy += "일";
		}
		if (rto.getH_workday().charAt(7) == '1') {
			yy += "무관";
		}
		if (rto.getCareer_check().equals("경력")) {
			CareerDTO cto = resumeDao.resumeCarrerDown();
			mav.addObject("cto", cto);
		}
		mav.addObject("yy", yy);
		mav.addObject("dto", rto);
		mav.setViewName("resume/resumeDown");
		return mav;
	}

	/** 이력서 수정페이지 이동 */
	@RequestMapping(value = "resumeUpdate.do", method = RequestMethod.GET)
	public ModelAndView resumeUpdateForm() {
		ModelAndView mav = new ModelAndView();
		
		ResumeDTO rto = resumeDao.resumeDown();
		if (rto.getCareer_check().equals("경력")) {
			CareerDTO cto = resumeDao.resumeCarrerDown();
			mav.addObject("cto", cto);
		}
		mav.addObject("dto", rto);
		mav.setViewName("resume/resumeUpdate");
		return mav;
	}
	/**이력서 수정*/
	@RequestMapping(value = "resumeUpdate.do", method = RequestMethod.POST)
	public ModelAndView resumeUpdate(ResumeDTO dto, CareerDTO cto, String startday_s, String endday_s) {
		ModelAndView mav = new ModelAndView();
		int result = 0;
		Module mo = new Module();
		System.out.println("11");
		if (dto.getCareer_check().equals("신입")) {
		result = resumeDao.resumeUpdate(dto);
		} else {
			cto.setStartday(mo.datePasing(startday_s));
			cto.setEndday(mo.datePasing(endday_s));
			result = resumeDao.careerUpdate(dto, cto);
		}
		System.out.println("2");
		String msg = result > 0 ? "이력서 수정 성공" : "이력서 수정 실패";
		mav.addObject("msg", msg);
		mav.setViewName("review/reviewMsg");
		System.out.println("33");
		return mav;
	}
	/**이력서 수정 테스트*/
	@RequestMapping(value = "resumeUpdateTest.do", method = RequestMethod.POST)
	public ModelAndView resumeUpdateTest(ResumeDTO dto) {
		ModelAndView mav = new ModelAndView();
		int result = 0;
		result = resumeDao.resumeUpdate(dto);
		String msg = result > 0 ? "이력서 수정 성공" : "이력서 수정 실패";
		mav.addObject("msg", msg);
		mav.setViewName("review/reviewMsg");
		System.out.println("33");
		return mav;
	}
	/**이력서 테스트 폼*/
	@RequestMapping("/resumeUpdateTest.do")
	public ModelAndView resumeUpdateTestForm() {
		ModelAndView mav = new ModelAndView();
		
		ResumeDTO rto = resumeDao.resumeDown();
		if (rto.getCareer_check().equals("경력")) {
			CareerDTO cto = resumeDao.resumeCarrerDown();
			mav.addObject("cto", cto);
		}
		mav.addObject("dto", rto);
		mav.setViewName("resume/resumeUpdateTest");
		return mav;
	}

	@RequestMapping("/resumeJobList.do")
	public ModelAndView h_jobForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("resume/resumeJobList");
		return mav;
	}

}
