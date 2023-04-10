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
	@RequestMapping("/manOneList.do")
	public ModelAndView manOneList(@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		ModelAndView mav=new ModelAndView();
		
		int totalCnt=oneDao.manOneAllCnt();
		int pazeSize=5;
		int listSize=5;

		List<One_OneDTO> lists=oneDao.manOneList(cp, listSize);
		
		String pageStr=com.goodjob.page.module.PageModule.makePage("manOneList.do", totalCnt, listSize, pazeSize, cp);
		
		System.out.println(totalCnt);
	
		mav.addObject("lists", lists);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("one/manOneList");
		
		return mav;
		
	}
	
	//일대일 문의 본문 들어가기
	@RequestMapping("/manOneContent.do")
	public ModelAndView manOneContent(@RequestParam (value="idx")int idx) {
		
		ModelAndView mav=new ModelAndView();
		
		One_OneDTO dto=oneDao.manOneContent(idx);

		
		String str_a=dto.getContent();
		String str_b=str_a.replace("ABCD", "");
		
		dto.setContent(str_b);
		
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
		
		String str_a=dto.getContent()+"ABCD";
		String str_b=str_a.replace("ABCD", "&#10;---------------------------------------&#10;");
		
		dto.setContent(str_b);
		
		mav.addObject("dto", dto);
		mav.setViewName("one/manOneAnswerPage");
		
		return mav;
		
	}
	
	//일대일 문의 답변하기 누르기
	@RequestMapping(value = "/manOneAnswer.do", method = RequestMethod.POST)
	public ModelAndView manOneAnswer(One_OneDTO dto) {
		
		ModelAndView mav=new ModelAndView();
		

			
			int count=oneDao.manOneAnswer(dto);	
			
			if(count>0) {
				
				String str_a=dto.getContent();
				String str_b=str_a.replace("&#10;---------------------------------------&#10;", "ABCD");
				
				dto.setContent(str_b);
		
				
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
			@RequestParam(value="file",defaultValue = "")MultipartFile file,
			HttpServletRequest req) {
		System.out.println(dto.toString());
		ModelAndView mav=new ModelAndView();
		String fcategory="one_one";
		int idx=oneDao.userOneWrite(dto);
		System.out.println(idx);
		if(!file.isEmpty()) {
			FileCopy fc=new FileCopy();
			fc.copyInto(fcategory, file, req);
			Map<String, String>map=new HashMap<String, String>();
			map.put("category",fcategory);
			map.put("file", file.getOriginalFilename());
			map.put("table_name", "one_one");
			fDao.manFileAdd(map);
		}
		return mav;
	}
	@RequestMapping("userOneContent.do")
	public ModelAndView userOneContent(int idx) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto",oneDao.manOneContent(idx));
		mav.setViewName("one/userOneContent");
		return  mav;
	}
	@RequestMapping(value="userOneReWrite.do",method = RequestMethod.POST)
	public ModelAndView userOneReWrite(One_OneDTO dto) {
		ModelAndView mav=new ModelAndView();
		//mav.addObject("msg",oneDao.manOneAnswer(dto));
		return  mav;
	}
	
	
	//일대일문의 검색하기
	@RequestMapping("/manOneSearch.do")
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
		
		
	}
	@RequestMapping("userOneWrite.do")
	public String userOneWriteForm() {
		return "one/userOneWrite";
	}
	
}
