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

	/* 이력서 조회 */
	@RequestMapping(value = "/resumeWrite.do", method = RequestMethod.GET)
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
	public ModelAndView resumeWriteSubmit(ResumeDTO dto, CareerDTO cto, String startday_s, String endday_s) {
		ModelAndView mav = new ModelAndView();
		int result = 0;
		Module mo=new Module();
		System.out.println(dto.getCareer_check());
		if (dto.getCareer_check().equals("신입")) {
			result = resumeDao.resumeWrite(dto);
		} else {
			System.out.println("경력용1");
			cto.setStartday(mo.datePasing(startday_s));
			cto.setEndday(mo.datePasing(endday_s));
			System.out.println("경력용2");
			result = resumeDao.resumeWrite2(dto, cto);
		}
		System.out.println("경력용3");
		String msg = result > 0 ? "이력서 작성 성공" : "이력서 작성 실패";
		mav.addObject("msg", msg);
		mav.setViewName("review/reviewMsg");
		return mav;
	}

	@RequestMapping("/h_job.do")
	public ModelAndView h_jobForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("resume/h_job");
		return mav;
	}

}
