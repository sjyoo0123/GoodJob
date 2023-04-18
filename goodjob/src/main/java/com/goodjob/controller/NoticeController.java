package com.goodjob.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.apply.model.ApplyDAO;
import com.goodjob.apply.model.ApplyDTO;
import com.goodjob.companymember.model.CompanyMemberDAO;
import com.goodjob.companymember.model.CompanyMemberDTO;
import com.goodjob.module.AjaxPageModule;
import com.goodjob.notice.model.NoticeDAO;
import com.goodjob.notice.model.NoticeDTO;
import com.goodjob.plan_used_vip.model.Plan_Used_VipDAO;
import com.goodjob.plan_used_vip.model.Plan_Used_VipDTO;
import com.goodjob.resume.model.ResumeDAO;
import com.goodjob.totalfile.model.TotalFileDAO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeDAO ndao;
	@Autowired
	private CompanyMemberDAO cdao;
	@Autowired
	private TotalFileDAO totalFileDao;
	@Autowired
	private ApplyDAO adao;
	@Autowired
	private Plan_Used_VipDAO plandao;
	@Autowired
	private ResumeDAO resumeDao;
public TotalFileDAO getTotalFileDao() {
		return totalFileDao;
	}
	public void setTotalFileDao(TotalFileDAO totalFileDao) {
		this.totalFileDao = totalFileDao;
	}
public NoticeController(TotalFileDAO totalFileDao) {
		super();
		this.totalFileDao = totalFileDao;
	}
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
	/*공고작성 폼*/
	@RequestMapping(value="/noticeWrite.do")
	public ModelAndView noticeWriteForm(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		int idx=0;
		String com_name_1="";
		if(session.getAttribute("sidx")==null||session.getAttribute("sidx")=="") {
			String msg="잘못된 접근입니다";
			String goUrl="index.do";
			mav.addObject("msg", msg);
			mav.addObject("goUrl", goUrl);
			mav.setViewName("notice/noticeMsg");
			return mav;
		}else {
			idx=(int)session.getAttribute("sidx");
			com_name_1 = session.getAttribute("com_name") != null ? (String) session.getAttribute("com_name") : "";
		}
		mav.addObject("idx", idx);
		mav.addObject("com_name_1", com_name_1);
		mav.setViewName("notice/noticeWrite");
		return mav;
	}
	/*공고작성 등록*/
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.POST)
	public ModelAndView noticeWriteSubmit(NoticeDTO dto,String workstarttime1,String workstarttime2,String workendtime1,String workendtime2,int pay_hour1,@RequestParam("formFileMultiple")MultipartFile file,HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		String starttime=workstarttime1+workstarttime2;
		dto.setStarttime(Integer.parseInt(starttime));
		String finishtime=workendtime1+workendtime2;
		dto.setFinishtime(Integer.parseInt(finishtime));
		if(dto.getPay_category().equals("시급")) {
			int pay_month=(dto.getFinishtime()-dto.getStarttime())*dto.getPay_hour();
			dto.setPay_month(pay_month);
		}else if(dto.getPay_category().equals("월급")) {
			dto.setPay_hour(pay_hour1);
			int pay_month=(dto.getFinishtime()-dto.getStarttime())*dto.getPay_hour()*dto.getWorktime();
			dto.setPay_month(pay_month);
		}else if(dto.getPay_category().equals("협의")) {
			dto.setPay_month(0);
		}
		int result=ndao.noticeWrite(dto);
		Map map=new HashMap();
		String path ="/goodjob/notice"+"/"+file.getOriginalFilename();
		String filest=file.getOriginalFilename();
		map.put("file", path);
		map.put("category", "notice");
		map.put("table_name", "notice");
		int count=totalFileDao.manFileAdd(map);
		copyInto("notice", file, req);
		String msg=result>0?"작성완료":"작성실패";
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "/goodjob/company.do");
		mav.setViewName("notice/noticeMsg");
		return mav;
	}
	/*기업계정 내 공고 조회*/
	@RequestMapping("/noticeComList.do")
	public ModelAndView noticeComListForm(@RequestParam(value="cp",defaultValue="1")int cp,@RequestParam(value="status",defaultValue ="0")int status,HttpSession session) {
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
		String status1="";
		switch(status) {
		case 0: status1="활성"; break;
		case 1: status1="대기"; break;
		case 2: status1="비활성"; break;
		}
		int totalCnt=1;
		int totalCnt1=ndao.noticeTotalCnt(idx,status1);
		if(totalCnt1!=0) {
			totalCnt=totalCnt1;
		}
		int listSize=5;
		int pageSize=5;
		
		String pageStr=com.goodjob.page.module.PageModule.makePage("noticeComList.do", totalCnt, listSize, pageSize, cp);
		List<NoticeDTO> lists=ndao.noticeComList(idx,cp,listSize,status1);
		mav.addObject("status1", status1);
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("notice/noticeComList");
		return mav;
	}
	/*공고컨텐츠 조회*/
	@RequestMapping("/noticeContent.do")
	public ModelAndView noticeContent(@RequestParam(value="idx")int nidx,HttpSession session, ApplyDTO ato) {
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

		String scategory = session.getAttribute("scategory") != null ? (String) session.getAttribute("scategory") : "";
		int sidx = session.getAttribute("sidx") != null ? (int) session.getAttribute("sidx") : 0;
		String starttime1=dto.getStarttime()%100==0?"00":dto.getStarttime()%100+"";
		String starttime=""+dto.getStarttime()/100+ ":" +starttime1;
		String endtime1=dto.getFinishtime()%100==0?"00":dto.getFinishtime()%100+"";
		String endtime=""+dto.getFinishtime()/100+ ":" +endtime1;
		String startendtime=starttime+" ~ "+endtime;
		int com_idx=dto.getCom_idx();
		CompanyMemberDTO cdto=cdao.comInfo(com_idx);
		ModelAndView mav=new ModelAndView();
		int atoNum =  adao.apNorButtonHide(nidx, sidx);
		int resumeNum = resumeDao.resumeCheck(sidx); //이력서 없을 시 공고 지원 불가능
		System.out.println(resumeNum);
		String filepath=totalFileDao.noticeFile(nidx);
		mav.addObject("filepath", filepath);
		mav.addObject("cdto", cdto);
		mav.addObject("dto", dto);
		mav.addObject("yy", yy);
		mav.addObject("startendtime", startendtime);
		mav.addObject("scategory", scategory);
		mav.addObject("sidx", sidx);
		mav.addObject("atoNum", atoNum);
		mav.addObject("resumeNum", resumeNum);
		mav.setViewName("notice/noticeContent");
		return mav;
	}
	/*공고삭제*/
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
			@RequestParam(value = "bAjax", defaultValue = "false") boolean bAjax,
			@RequestParam(value="query" ,defaultValue = "")String query) {
		ModelAndView mav = new ModelAndView();
		StringBuffer workday = null;
		if (listworkday.length==0) {
			workday = new StringBuffer("________");
		} else {
			workday = new StringBuffer("00000000");
			for (int i = 0; i < listworkday.length; i++) {
				switch (listworkday[i]) {
				case "월": workday.setCharAt(0, '_'); break;
				case "화": workday.setCharAt(1, '_'); break;
				case "수": workday.setCharAt(2, '_'); break;
				case "목": workday.setCharAt(3, '_'); break;
				case "금": workday.setCharAt(4, '_'); break;
				case "토": workday.setCharAt(5, '_'); break;
				case "일": workday.setCharAt(6, '_'); break;
				case "무관": workday.setCharAt(7, '_'); break;
				}
			}
		}
		int totalCnt = ndao.whereNoticeTotalCnt(workday.toString(), local2,local3,job);
		int ls = 10;
		int pageSize = 5;
		int start = (cp - 1) * ls+1;
		int end = cp * ls;
		mav.addObject("list", ndao.whereNoticeList(workday.toString(), local2, local3,job, start, end));
		mav.addObject("page", AjaxPageModule.makePage(totalCnt, ls, pageSize, cp));
		if(query.equals("occupation")) {
			mav.addObject("query", "$('.occupation').removeClass('d-none');");
		}else if(query.equals("addr")) {
			mav.addObject("query", " $('.addr').removeClass('d-none');");
		}else if(query.equals("weekday")) {
			mav.addObject("query", "$('.weekday').removeClass('d-none');");
		}
		if (bAjax) {
			mav.setViewName("goodjobJson");
		} else {
			mav.setViewName("notice/noticeList");
		}
		
		return mav;
	}
	/*공고 수정 폼*/
	@RequestMapping("/noticeUpdate.do")
	public ModelAndView noticeUpdateForm(@RequestParam(value="idx")int nidx) {
		ModelAndView mav=new ModelAndView();
		NoticeDTO dto=ndao.noticeContent(nidx);
		int workstarttime1 = dto.getStarttime()/100;
		int workstarttime2 = dto.getStarttime()%100;
		int workendtime1 = dto.getFinishtime()/100;
		int workendtime2 = dto.getFinishtime()%100;
		String filepath=null;
		filepath=totalFileDao.noticeFile(nidx);
		if(filepath!=null) {
			mav.addObject("filepath", filepath);
		}else {
			mav.addObject("filepath", "");
		}
		mav.addObject("dto", dto);
		mav.addObject("workstarttime1", workstarttime1);
		mav.addObject("workstarttime2", workstarttime2);
		mav.addObject("workendtime1", workendtime1);
		mav.addObject("workendtime2", workendtime2);
		mav.setViewName("notice/noticeUpdate");
		return mav;
	}
	/*공고 수정 등록*/
	@RequestMapping(value="/noticeUpdate.do",method=RequestMethod.POST)
	public ModelAndView noticeUpdateSubmit(NoticeDTO dto,String filepath,String workstarttime1,String workstarttime2,String workendtime1,String workendtime2,int pay_hour1,@RequestParam("formFileMultiple")MultipartFile file,HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		String starttime=workstarttime1+workstarttime2;
		dto.setStarttime(Integer.parseInt(starttime));
		String finishtime=workendtime1+workendtime2;
		dto.setFinishtime(Integer.parseInt(finishtime));
		if(dto.getPay_category().equals("시급")) {
			int pay_month=(dto.getFinishtime()-dto.getStarttime())*dto.getPay_hour();
			dto.setPay_month(pay_month);
		}else if(dto.getPay_category().equals("월급")) {
			dto.setPay_hour(pay_hour1);
			int pay_month=(dto.getFinishtime()-dto.getStarttime())*dto.getPay_hour()*dto.getWorktime();
			dto.setPay_month(pay_month);
		}else if(dto.getPay_category().equals("협의")) {
			dto.setPay_month(0);
		}
		System.out.println(dto);
		int result=ndao.noticeUpdate(dto);
		Map map=new HashMap();
		if(!file.isEmpty()) {
			String path ="/goodjob/notice"+"/"+file.getOriginalFilename();
			String filest=file.getOriginalFilename();
			map.put("file", path);
			map.put("category", "notice");
			map.put("table_name", "notice");
			map.put("table_idx", dto.getIdx());
			int count=totalFileDao.noticeFileUpdate(map);
			copyInto("notice", file, req);
		}
		String msg=result>0?"수정완료":"수정실패";
		mav.addObject("msg", msg);
		mav.addObject("goUrl", "/goodjob/company.do");
		mav.setViewName("notice/noticeMsg");
		return mav;
	}
	
	

	
	/**관리자 공고 메인 페이지*/
	@RequestMapping("/manNoticeStatusPage.do")
	public ModelAndView manNoticeStatusPage(
			@RequestParam(value="cp", defaultValue = "1")int cp,@RequestParam(value="bAjax" ,defaultValue = "false")boolean bAjax,
			@RequestParam(value="category",defaultValue = "")String category,
			@RequestParam(value="search", defaultValue = "")String search) {
		
		ModelAndView mav=new ModelAndView();
		
		
		int totalCnt=0;
		int pageSize=5;
		int listSize=5;
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		List<NoticeDTO>lists=null;
		if(category.length()==0 || search.length()==0) {
			totalCnt=ndao.manNoticeTotalCnt();
			lists=ndao.manNoticeStatusList(cp, listSize);
		}else {
			
			Map<String,Object> map=new HashMap<String, Object>();
			map.put("category", category);
			map.put("keyword", search);
			map.put("start", start);
			map.put("end", end);
			totalCnt=ndao.manNoticeSearchCnt(map);
			lists=ndao.manNoticeSearch(map);
		}
		
		
		
		String page=AjaxPageModule.makePage(totalCnt, listSize, pageSize, cp);
		mav.addObject("lists", lists);
		mav.addObject("page", page);
		
		if(bAjax) {
		mav.setViewName("goodjobJson");	
		}else {
		mav.setViewName("manNotice/manNoticeStatusPage");
		}
		return mav;
		
		
	}

	public void copyInto(String category, MultipartFile file,HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("/"+category);
		try {
			byte bytes[] = file.getBytes();
			File outfile = new File(path+"/" + file.getOriginalFilename());
			System.out.println(outfile.getName());
			FileOutputStream fos = new FileOutputStream(outfile);
			fos.write(bytes);// 복사
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

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
		
		mav.setViewName("notice/noticeContent");
	
		return mav;
	}
	
	/**관리자 공고 승인하기*/
	@RequestMapping("/manNoticeAccept_Ok.do")
	public ModelAndView manNoticeAccept_Ok(
			@RequestParam(value = "idx")int idx) {
		
		ModelAndView mav=new ModelAndView();
		
		int count=ndao.manNoticeAcceptContent_Ok(idx);
		
		if(count>0) {
			mav.addObject("msg", "승인이 완료되었습니다.");	
		}else {
			mav.addObject("msg", "승인이 실패하였습니다.");
		}
		mav.addObject("goUrl", "manNoticeAcceptPage.do");
		mav.setViewName("manNotice/manNoticeMsg");
		return mav;
	}
	
	/**관리자 공고 거부하기*/
	@RequestMapping("/manNoticeAccept_No.do")
	public ModelAndView manNoticeAccept_No(
			@RequestParam(value = "idx")int idx) {
		
		ModelAndView mav=new ModelAndView();
		
		int count=ndao.manNoticeAcceptContent_No(idx);
		
		if(count>0) {
			mav.addObject("msg", "거부가 완료되었습니다.");	
		}else {
			mav.addObject("msg", "거부가 실패하였습니다.");
		}
		mav.addObject("goUrl", "manNoticeAcceptPage.do");
		mav.setViewName("manNotice/manNoticeMsg");
		
		return mav;
		}
		
		
	
	
	/**관리자 공고 삭제 페이지*/
	@RequestMapping("/manNoticeDelPage.do")
	public ModelAndView manNoticeDelPage(
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		int pageSize=5;
		int listSize=5;
		int totalCnt=ndao.manNoticeCnt();
		
		String pageStr=com.goodjob.page.module.PageModule.makePage("manNoticeDelPage.do", totalCnt, listSize, pageSize, cp);
		
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

	
	/**관리자 공고 비활성화하기*/
	@ResponseBody
	@RequestMapping("/manNoticeStatus_No.do")
	public ModelAndView manNoticeStatus_No(
			@RequestParam(value = "idx", defaultValue = "0")int idx
			,@RequestParam(value = "button")String button) {
		
		ModelAndView mav=new ModelAndView();
		
		int count=0;
		System.out.println(idx);
		System.out.println(button);
		
		if(button.equals("비활성화하기")) {
			count=ndao.manNoticeUpdate_No(idx);
		}else if(button.equals("활성화하기")){
			count=ndao.manNoticeUpdate_Ok(idx);
		}
		
		mav.addObject("count", count);
		
		
		mav.setViewName("goodjobJson");
		
		
		return mav;
	}

	/*vip요금제 사용여부 조회*/
	@RequestMapping(value="/usedVipCount.do",method=RequestMethod.POST)
	@ResponseBody
	public int usedVipCount(int idx) {
		int count=plandao.usedVipCount(idx);
		return count;
	}
	/*vip요금제 사용내용*/
	@RequestMapping(value="/usedVipCon.do",method=RequestMethod.POST)
	@ResponseBody
	public List<Plan_Used_VipDTO> usedVipCon(int idx) {
		List<Plan_Used_VipDTO> list = plandao.usedVipCon(idx);
		return list;
	}
	/*up요금제 공고 업*/
	@RequestMapping(value="/refUp.do",method=RequestMethod.POST)
	@ResponseBody
	public int refUp(int idx) {
		int count=ndao.refUp(idx);
		return count;
	}

	/**관리자 공고 페이지 검색하기*/
	@RequestMapping("/manNoticeSearch.do")
	public ModelAndView manNoticeSearch(
			@RequestParam(value="cp", defaultValue = "1")int cp,
			@RequestParam(value="category", defaultValue = "")String category,
			@RequestParam(value="search", defaultValue = "")String search
			) {
		
	
		
		Map map=new HashMap();

		map.put("category", category);
		map.put("keyword", search);
		
		int pazeSize=5;
		int listSize=5;
		int searchCnt=ndao.manNoticeSearchCnt(map);
		
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		
		map.put("start", start);
		map.put("end", end);
		
		String pageStr=com.goodjob.page.module.PageModule.makePage("manNoticeSearch.do", searchCnt, listSize, pazeSize, cp, category, search);
		
		ModelAndView mav=new ModelAndView();
	
	
		List<NoticeDTO> lists=ndao.manNoticeSearch(map);
	
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);
		
		mav.setViewName("manNotice/manNoticeSearch");
		
		return mav;
		
	}
}
