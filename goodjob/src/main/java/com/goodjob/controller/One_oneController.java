package com.goodjob.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.HtmlUtils;

import com.goodjob.banner.model.BannerDTO;
import com.goodjob.module.AjaxPageModule;
import com.goodjob.module.FileCopy;
import com.goodjob.one_one.model.One_OneDAO;
import com.goodjob.one_one.model.One_OneDTO;
import com.goodjob.totalfile.model.TotalFileDAO;
import com.goodjob.totalfile.model.TotalFileDTO;
@Controller
public class One_oneController {
	
	@Autowired
	private One_OneDAO oneDao;
	@Autowired
	private TotalFileDAO fDao;
	
	//일대일문의 들어가기
	@RequestMapping(value="/manOneList.do",method = RequestMethod.GET)
	public ModelAndView manOneList(@RequestParam(value = "cp", defaultValue = "1")int cp,
			@RequestParam(value="bAjax", defaultValue = "false")boolean bAjax,
			@RequestParam(value="category", defaultValue = "")String category,
			@RequestParam(value="search", defaultValue = "")String search) {
		
		
		
		ModelAndView mav=new ModelAndView();
		
		int totalCnt=0;
		int pazeSize=5;
		int listSize=5;
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		System.out.println(1);
		List<One_OneDTO>lists=null;
		
		if(category.length()==0 || search.length()==0) {
			totalCnt=oneDao.manOneAllCnt();
			lists=oneDao.manOneList(cp, listSize);	
		}else {
			
			Map<String, Object> map= new HashMap<String, Object>();
			map.put("category", category);
			map.put("search", search);
			map.put("start", start);
			map.put("end", end);
			totalCnt=oneDao.manOneSearchCnt(map);
			lists=oneDao.manOneSearch(map);
		}
		
		String page=AjaxPageModule.makePage(totalCnt, listSize, pazeSize, cp);
		
		mav.addObject("lists", lists);
		mav.addObject("page", page);
		System.out.println(page);
		if(bAjax) {
			mav.setViewName("goodjobJson");
		}else {
			mav.setViewName("one/manOneList");
		}
	
		
		return mav;
		
	}
	
	//일대일 문의 본문 들어가기
	@RequestMapping("/manOneContent.do")
	public ModelAndView manOneContent(@RequestParam (value="idx")int idx) {
		
		ModelAndView mav=new ModelAndView();
		
		One_OneDTO dto=oneDao.manOneContent(idx);

		
	
		mav.addObject("dto", dto);
		
		
		mav.setViewName("one/manOneContent");
		
		return mav;
	}
	
	//일대일 문의 수정 페이지 들어가기
	@RequestMapping("/manOneAnswerPage.do")
	public ModelAndView manOneAnswerPage(
			@RequestParam(value="idx")int idx,
			@RequestParam(value="content")String content) {
		
		ModelAndView mav=new ModelAndView();
		
		// replacedString에는 다음과 같은 문자열이 저장됩니다.
		// "\n---------------------------------------\n"
		
	
		
		
		One_OneDTO dto=oneDao.manOneContent(idx);
		
		
		
		mav.addObject("dto", dto);
		mav.setViewName("one/manOneAnswerPage");
		
		return mav;
		
	}
	
	//일대일 문의 답변하기 누르기
	@RequestMapping(value = "/manOneAnswer.do", method = RequestMethod.POST)
	public ModelAndView manOneAnswer(One_OneDTO dto) {
		
		ModelAndView mav=new ModelAndView();
		
			String unEncoding=dto.getContent();
			dto.setContent(unEncoding.replaceAll("&#10;", "\r\n"));
			int count=oneDao.manOneAnswer(dto);	
			
			if(count>0) {
				
				
				
				mav.addObject("msg", "수정에 성공하셨습니다");
				mav.addObject("goUrl", "manOneList.do");
			}else {
				
				mav.addObject("msg", "수정에 실패하셨습니다.");
				mav.addObject("goUrl", "manOneList.do");
			}
			

			mav.setViewName("one/manOneMsg");
		
		return mav;
	}
	@RequestMapping("userOneList.do")
	public ModelAndView userOneList(HttpSession session,@RequestParam(value="cp",defaultValue = "1")int cp,
			@RequestParam(value="bAjax" ,defaultValue="false")boolean bAjax) {
		ModelAndView mav=new ModelAndView();
		Integer sIdx=session.getAttribute("sidx")!=null?(Integer)session.getAttribute("sidx"):0;
		int totalCnt=oneDao.userOneTotalCnt(sIdx);
		int pazeSize=5;
		int listSize=10;
		mav.addObject("page",AjaxPageModule.makePage(totalCnt, listSize, pazeSize, cp));
		mav.addObject("list",oneDao.userOneList(sIdx, cp, listSize));
		if(bAjax) {
			mav.setViewName("goodjobJson");
		}else {
			mav.setViewName("one/userOneList");
		}
		return mav;
	}
	@RequestMapping(value= "userOneWrite.do",method = RequestMethod.POST)
	public ModelAndView userOneWrite(One_OneDTO dto,
			MultipartFile file,
			HttpServletRequest req,HttpSession session) {
		ModelAndView mav=new ModelAndView();
		String fcategory="one_one";
		dto.setContent("질문:"+dto.getContent());
		int idx=oneDao.userOneWrite(dto);
		Integer sIdx=(Integer)session.getAttribute("sidx");
		int sidx=sIdx==null?0:sIdx;
		dto.setMember_idx(sidx);
		if(file!=null) {
			FileCopy fc=new FileCopy();
			fc.copyInto(fcategory, file, req);
			Map<String, String>map=new HashMap<String, String>();
			map.put("category",fcategory);
			map.put("file",fcategory+"/"+ file.getOriginalFilename());
			map.put("table_name", fcategory);
			fDao.manFileAdd(map);
		}
		return mav;
	}
	@RequestMapping("userOneContent.do")
	public ModelAndView userOneContent(int idx) {
		ModelAndView mav=new ModelAndView();
		One_OneDTO dto=oneDao.manOneContent(idx);
		String []content=null;
		if(dto.getContent()!=null) {
			content=dto.getContent().split("\r\n---------------------------------------\r\n");
		}
		mav.addObject("dto",dto);
		mav.addObject("content",content);
		mav.setViewName("one/userOneContent");
		return  mav;
	}
	@RequestMapping(value="userOneReWrite.do",method = RequestMethod.POST)
	public ModelAndView userOneReWrite(One_OneDTO dto,@RequestParam(value="plusContent")String plusContent) {
		String content=dto.getContent();
		dto.setContent(content+"\r\n---------------------------------------\r\n질문:"+plusContent);
		String msg=oneDao.userOneReWrite(dto)>0?"문의 재작성 성공":"재작성 실패";
		ModelAndView mav=userOneContent(dto.getIdx());
		mav.addObject("msg",msg);
		return  mav;
	}
	
	
	//일대일문의 검색하기
	/**@RequestMapping("/manOneSearch.do")
	public ModelAndView manOneSearch(@RequestParam(value = "cp", defaultValue = "1")int cp
			,@RequestParam (value = "search", required = false)String search) {
		
		ModelAndView mav=new ModelAndView();
		
		int totalCnt=oneDao.manOneAllCnt();
		int listSize=5;
		int pageSize=5;
		
		List<One_OneDTO> lists=oneDao.manOneSearch(cp, listSize, search);
		
		String pageStr=com.goodjob.page.module.PageModule.makePage("manOneSearch.do", totalCnt, listSize, pageSize, cp);
		
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);
		
		mav.setViewName("one/manOneSearch");
		
		return mav;
		
		
	}*/
	@RequestMapping("userOneWrite.do")
	public String userOneWriteForm() {
		return "one/userOneWrite";
	}
	
}
