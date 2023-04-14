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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.career.model.CareerDTO;
import com.goodjob.member.model.MemberDAO;
import com.goodjob.member.model.MemberDTO;
import com.goodjob.module.Module;
import com.goodjob.normalmember.model.NormalMemberDAO;
import com.goodjob.normalmember.model.NormalMemberDTO;
import com.goodjob.notice.model.NoticeDAO;
import com.goodjob.notice.model.NoticeDTO;
import com.goodjob.offer.model.OfferDAO;
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

	@Autowired
	private NoticeDAO ndao;
	
	@Autowired
	private OfferDAO odao;
	
	public ResumeController(MemberDAO memberDao) {
		super();
		this.memberDao = memberDao;
	}

	/** 이력서 조회 */
	@RequestMapping(value = "/writeForm.do", method = RequestMethod.GET)
	public ModelAndView resumeWriteForm(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		int idx=0;
		if(session.getAttribute("sidx")==null||session.getAttribute("sidx")=="") {
			String msg="로그인 후 이용바랍니다.";
			String goUrl="index.do";
			mav.addObject("msg", msg);
			mav.setViewName("notice/noticeMsg");
			return mav;
		}else {
			idx=(int)session.getAttribute("sidx");
		}
		MemberDTO dto = resumeDao.resumeWriteForm(idx);
		ReviewDTO nto = resumeDao.resumeWriteForm1(idx);
		mav.addObject("dto", dto);
		mav.addObject("nto", nto);
		mav.setViewName("resume/resumeWrite");
		return mav;
	}

	/** 이력서 작성 */
	@RequestMapping(value = "/resumeWrite.do", method = RequestMethod.POST)
	public ModelAndView resumeWriteSubmit(@RequestParam(value="member_idx")int midx,
			ResumeDTO dto, CareerDTO cto, String startday_s, String endday_s,
			MemberDTO mto ) {
		ModelAndView mav = new ModelAndView();
		int result = 0;
		Module mo = new Module();
		ResumeDTO getridx = resumeDao.resumeDown(midx);

		if (dto.getCareer_check().equals("신입")) {
			result = resumeDao.resumeWrite(dto);
		} else {
			System.out.println(getridx.getIdx());
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

	/** 이력서 다운로드  업데이트 후 다시 한 번 보기*/
	@RequestMapping(value = "resumeDown.do", method = RequestMethod.GET)
	public ModelAndView resumeDown(@RequestParam(value="member_idx")int ridx ) {
		ModelAndView mav = new ModelAndView();
		ResumeDTO rto = resumeDao.resumeDown(ridx);
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
			CareerDTO cto = resumeDao.resumeCarrerDown(ridx);
			mav.addObject("cto", cto);
		}
		mav.addObject("yy", yy);
		mav.addObject("dto", rto);
		mav.setViewName("resume/resumeDown");
		return mav;
	}

	@RequestMapping(value = "resumeUpdate.do", method = RequestMethod.GET)
	public ModelAndView resumeUpdateForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		
		int idx=0;
		if(session.getAttribute("sidx")==null||session.getAttribute("sidx")=="") {
			String msg="로그인 후 이용바랍니다.";
			String goUrl="index.do";
			mav.addObject("msg", msg);
			mav.setViewName("notice/noticeMsg");
			return mav;
		}else {
			idx=(int)session.getAttribute("sidx");
		}
		ResumeDTO rto = resumeDao.resumeDown(idx);
		
		
		if (rto.getCareer_check().equals("경력")) {
			CareerDTO cto = resumeDao.resumeCarrerDown(idx);
			mav.addObject("cto", cto);
		}
		mav.addObject("dto", rto);
		mav.setViewName("resume/resumeUpdate");
		return mav;
	}
	/**이력서 수정*/
	@RequestMapping(value = "resumeUpdate.do", method = RequestMethod.POST)
	public ModelAndView resumeUpdate(@RequestParam(value="member_idx")int midx, ResumeDTO dto, CareerDTO cto, 
			String startday_s, String endday_s) {
		ModelAndView mav = new ModelAndView();
		int result = 0;
		Module mo = new Module();
		ResumeDTO getridx = resumeDao.resumeDown(midx);
		System.out.println(getridx.toString());
		if (dto.getCareer_check().equals("신입")) {
			result = resumeDao.resumeUpdate(dto);
		} else {
			cto.setResume_idx(getridx.getIdx());
			System.out.println("resumeidx=" + cto.getResume_idx());
			cto.setStartday(mo.datePasing(startday_s));
			cto.setEndday(mo.datePasing(endday_s));
			result = resumeDao.careerUpdate(dto, cto);
		}
		String msg = result > 0 ? "이력서 수정 성공" : "이력서 수정 실패";
		mav.addObject("msg", msg);
		mav.setViewName("review/reviewMsg");
		return mav;
	}
	
	
	/**업종 관련*/
	@RequestMapping("/resumeJobList.do")
	public ModelAndView h_jobForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("resume/resumeJobList");
		return mav;
	}
	
	/**이력서 컨텐츠*/
	@RequestMapping("/resumeContent.do")
	public ModelAndView resumeContent(@RequestParam(value="idx")int ridx,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		ResumeDTO rto = resumeDao.resumeContent(ridx);
		int normalidx=rto.getMember_idx();
		String scategory_resume = session.getAttribute("scategory") != null ? (String) session.getAttribute("scategory") : "";
		int sidx_resume = session.getAttribute("sidx") != null ? (int) session.getAttribute("sidx") : 0;
		int ofcount=0;
		if(scategory_resume.equals("기업")) {
			Map map=new HashMap();
			map.put("com_idx", sidx_resume);
			map.put("nor_idx", normalidx);
			ofcount=odao.offerCount(map);
		}
		mav.addObject("offCount", ofcount);
		NormalMemberDTO normaldto=normalmemberDao.getNorMember(normalidx);
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
			CareerDTO cto = resumeDao.resumeCarrerDown(ridx);
			mav.addObject("cto", cto);
		}
		mav.addObject("yy", yy);
		mav.addObject("dto", rto);
		mav.addObject("normaldto", normaldto);
		mav.setViewName("resume/resumeContent");
		return mav;
	}
	
	@RequestMapping(value="/comNoticeSubject.do",method=RequestMethod.POST)
	@ResponseBody
	public List<NoticeDTO> comNoticeSubject(@RequestParam("idx")int idx){
		List<NoticeDTO> data=ndao.comNoticeSubject(idx);
		return data;
	}

}
