package com.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.goodjob.module.AjaxPageModule;
import com.goodjob.apply.model.ApplyDAO;
import com.goodjob.apply.model.ApplyDTO;
import com.goodjob.companymember.model.CompanyMemberDAO;
import com.goodjob.companymember.model.CompanyMemberDTO;
import com.goodjob.notice.model.NoticeDAO;
import com.goodjob.notice.model.NoticeDTO;
import java.util.*;

@Controller
public class NoticeController {

	@Autowired
	private NoticeDAO ndao;
	@Autowired
	private CompanyMemberDAO cdao;
	
public NoticeController() {
	// TODO Auto-generated constructor stub
}
	public NoticeDAO getNdao() {
		return ndao;
	}

	public void setNdao(NoticeDAO ndao) {
		this.ndao = ndao;
	}

	public CompanyMemberDAO getCdao() {
		return cdao;
	}

	public void setCdao(CompanyMemberDAO cdao) {
		this.cdao = cdao;
	}

	public NoticeController(CompanyMemberDAO cdao) {
		super();
		this.cdao = cdao;
	}
	public NoticeController(NoticeDAO ndao) {
		super();
		this.ndao = ndao;
	}

	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.GET)
	public ModelAndView noticeWriteForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/noticeWrite");
		return mav;
	}
	
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.POST)
	public ModelAndView noticeWriteSubmit(NoticeDTO dto,String workstarttime1,String workstarttime2,String workendtime1,String workendtime2) {
		ModelAndView mav=new ModelAndView();
		String starttime=workstarttime1+workstarttime2;
		dto.setStarttime(Integer.parseInt(starttime));
		String finishtime=workendtime1+workendtime2;
		dto.setFinishtime(Integer.parseInt(finishtime));
		if(dto.getPay_category().equals("시급")) {
			int pay_month=(dto.getFinishtime()-dto.getStarttime())*dto.getPay_hour();
			dto.setPay_month(pay_month);
		}else if(dto.getPay_category().equals("월급")) {
			int pay_month=(dto.getFinishtime()-dto.getStarttime())*dto.getPay_hour()*dto.getWorktime();
			dto.setPay_month(pay_month);
		}else if(dto.getPay_category().equals("협의")) {
			dto.setPay_month(0);
		}
		int result=ndao.noticeWrite(dto);
		String msg=result>0?"작성완료":"작성실패";
		mav.addObject("msg", msg);
		mav.setViewName("notice/noticeMsg");
		return mav;
	}
	@RequestMapping("/noticeComList.do")
	public ModelAndView noticeComListForm(@RequestParam(value="cp",defaultValue="1")int cp,HttpSession session) {
		int idx=0;
		ModelAndView mav=new ModelAndView();
		if(session.getAttribute("sidx")==null||session.getAttribute("sidx")=="") {
			String msg="잘못된 접근입니다";
			String goUrl="index.do";
			mav.addObject("msg", msg);
			mav.addObject("goUrl", goUrl);
			mav.setViewName("notice/noticeMsg");
			return mav;
		}else {
			idx=(int)session.getAttribute("sidx");
		}
		int totalCnt=ndao.noticeTotalCnt(idx);
		int listSize=5;
		int pageSize=5;
		
		String pageStr=com.goodjob.page.module.PageModule.makePage("noticeComList.do", totalCnt, listSize, pageSize, cp);
		List<NoticeDTO> lists=ndao.noticeComList(idx,cp,listSize);
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("notice/noticeComList");
		return mav;
	}
	@RequestMapping("/noticeContent.do")
	public ModelAndView noticeContent(@RequestParam(value="idx")int nidx,HttpSession session) {
		NoticeDTO dto=ndao.noticeContent(nidx);
		String workday=dto.getWorkday();
		String yy = "";
		if(workday.charAt(0)=='1') {
			yy+="월";
		}if(workday.charAt(1)=='1') {
			yy+="화";
		}if(workday.charAt(2)=='1') {
			yy+="수";
		}if(workday.charAt(3)=='1') {
			yy+="목";
		}if(workday.charAt(4)=='1') {
			yy+="금";
		}if(workday.charAt(5)=='1') {
			yy+="토";
		}if(workday.charAt(6)=='1') {
			yy+="일";
		}if(workday.charAt(7)=='1') {
			yy+="무관";
		}
		String scategory=null;
		scategory=(String)session.getAttribute("scategory");
		int sidx = session.getAttribute("sidx") != null ? (int) session.getAttribute("sidx") :0;
		
		String starttime1=dto.getStarttime()%100==0?"00":dto.getStarttime()%100+"";
		String starttime=""+dto.getStarttime()/100+ ":" +starttime1;
		String endtime1=dto.getFinishtime()%100==0?"00":dto.getFinishtime()%100+"";
		String endtime=""+dto.getFinishtime()/100+ ":" +endtime1;
		String startendtime=starttime+" ~ "+endtime;
		int com_idx=dto.getCom_idx();
		CompanyMemberDTO cdto=cdao.comInfo(com_idx);
		System.out.println(cdto.toString());
		ModelAndView mav=new ModelAndView();
		mav.addObject("cdto", cdto);
		mav.addObject("dto", dto);
		mav.addObject("yy", yy);
		mav.addObject("startendtime", startendtime);
		mav.addObject("scategory", scategory);
		mav.addObject("sidx", sidx);
		mav.setViewName("notice/noticeContent");
		return mav;
	}

	@RequestMapping("/noticeDel.do")
	public ModelAndView noticeDel(@RequestParam(value="idx")int nidx) {
		int count=ndao.noticeDel(nidx);
		String msg=count>0?"삭제완료":"삭제실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "company.do");
		mav.setViewName("notice/noticeMsg");
		return mav;
	}

	@RequestMapping(value = "noticeList.do", method = RequestMethod.GET)
	public ModelAndView noticeList(@RequestParam(value = "cp", defaultValue = "1") int cp,
			@RequestParam(value = "listworkday", defaultValue = "") String[] listworkday,
			@RequestParam(value = "local2", defaultValue = "") String[] local2,
			@RequestParam(value = "local3", defaultValue = "") String[] local3,
			@RequestParam(value="job",defaultValue = "")String[] job,
			@RequestParam(value = "bAjax", defaultValue = "false") boolean bAjax) {
		ModelAndView mav = new ModelAndView();
		StringBuffer workday = null;
		if (listworkday.length==0) {
			workday = new StringBuffer("________");
		} else {
			workday = new StringBuffer("________");
			for (int i = 0; i < listworkday.length; i++) {
				switch (listworkday[i]) {
				case "월": workday.setCharAt(0, '1'); break;
				case "화": workday.setCharAt(1, '1'); break;
				case "수": workday.setCharAt(2, '1'); break;
				case "목": workday.setCharAt(3, '1'); break;
				case "금": workday.setCharAt(4, '1'); break;
				case "토": workday.setCharAt(5, '1'); break;
				case "일": workday.setCharAt(6, '1'); break;
				case "무관": workday.setCharAt(7, '1'); break;
				}
			}
		}
		System.out.println(workday);
		int totalCnt = ndao.whereNoticeTotalCnt(workday.toString(), local2,local3,job);
		int ls = 10;
		System.out.println(totalCnt);
		int pageSize = 5;
		int start = (cp - 1) * ls+1;
		int end = cp * ls;
		mav.addObject("list", ndao.whereNoticeList(workday.toString(), local2, local3,job, start, end));
		mav.addObject("page", AjaxPageModule.makePage(totalCnt, ls, pageSize, cp));
		if (bAjax) {
			mav.setViewName("goodjobJson");
		} else {
			mav.setViewName("notice/noticeList");
		}
		return mav;
	}
	@RequestMapping("/noticeUpdate.do")
	public ModelAndView noticeUpdateForm(@RequestParam(value="idx")int nidx) {
		ModelAndView mav=new ModelAndView();
		NoticeDTO dto=ndao.noticeContent(nidx);
		
		return mav;
	}
	@RequestMapping(value="/noticeUpdate.do",method=RequestMethod.POST)
	public ModelAndView noticeUpdateSubmit(NoticeDTO dto) {

		ModelAndView mav=new ModelAndView();
		
		return mav;
	}
	
	

	
	/**관리자 공고 메인 페이지 나중에 함*/
	/*@RequestMapping("/manNoticeStatusPage.do")
	public ModelAndView manNoticeStatsuPage(
			@RequestParam(value="cp")int cp) {
		
		
	}*/
	/**관리자 공고 승인 대기 페이지*/
	@RequestMapping("/manNoticeAcceptPage.do")
	public ModelAndView manNoticeAcceptPage(
			@RequestParam(value="cp", defaultValue = "1")int cp) {
		
		int pageSize=5;
		int listSize=5;
		int totalCnt=ndao.manNoticeStatusCnt();
		
		String pageStr=com.goodjob.page.module.PageModule.makePage("manNoticeAcceptPage.do", totalCnt, listSize, pageSize, cp);
		
		List<NoticeDTO> lists=ndao.manNoticeAcceptList(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);
		
		mav.setViewName("manNotice/manNoticeAcceptPage");
		
		return mav;
	}
	
	/**관리자 공고 승인 페이지*/
	@RequestMapping("/manNoticeAcceptContent.do")
	public ModelAndView manNoticeAcceptContent(
			@RequestParam(value = "idx")int idx) {
		
		ModelAndView mav=new ModelAndView();
		
		NoticeDTO dto=ndao.manNoticeAcceptContent(idx);
		
		mav.addObject("dto", dto);
		
		mav.setViewName("manNotice/manNoticeAcceptContent");
	
		return mav;
	}
	/**관리자 공고 삭제 페이지*/
	@RequestMapping("/manNoticeDelPage.do")
	public ModelAndView manNoticeDelPage(
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		int pageSize=5;
		int listSize=5;
		int totalCnt=ndao.manNoticeCnt();
		
		String pageStr=com.goodjob.page.module.PageModule.makePage("manNoticeAcceptPage.do", totalCnt, listSize, pageSize, cp);
		
		List<NoticeDTO> lists=ndao.manNoticeDelList(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);
		
		mav.setViewName("manNotice/manNoticeDelPage");
		
		return mav;
	}
	
	
	/**관리자 공고 삭제하기*/
	@RequestMapping("/manNoticeDel.do")
	public ModelAndView manNoticeDel(
			@RequestParam(value = "idx")int idx) {
		
		int count=ndao.manNoticeDel(idx);
		
		ModelAndView mav=new ModelAndView();
		
		if(count>0) {
			mav.addObject("msg", "삭제에 성공하셨습니다");
		}else {
			mav.addObject("msg", "삭제에 실패하셨습니다");
		}
		
			mav.addObject("goUrl", "manNoticeDelPage.do");
			
			mav.setViewName("manNotice/manNoticeMsg");
			
			return mav;
		
		
			
	}
	

}
