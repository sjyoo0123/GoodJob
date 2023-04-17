package com.goodjob.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.banner.model.BannerDAO;
import com.goodjob.banner.model.BannerDTO;
import com.goodjob.banner.model.Banner_totalFileDTO;
import com.goodjob.totalfile.model.TotalFileDAO;
import com.goodjob.totalfile.model.TotalFileDTO;

@Controller
public class BannerController {

	@Autowired
	private BannerDAO bannerDao;
	@Autowired
	private TotalFileDAO totalFileDao;
	
	//관리자 배너 메인페이지 들어가기
	@RequestMapping("/manBannerPage.do")
	public ModelAndView manBannerPage() {
		
		ModelAndView mav=new ModelAndView();
		
		
		mav.setViewName("banner/manBannerPage");
		
		return mav;
	}
	
	
	//배너 파일 업로드
	@RequestMapping(value = "/manBannerUpload.do", method = RequestMethod.POST)
	public ModelAndView manBannerUpload(BannerDTO dto,
			@RequestParam("file")MultipartFile file,
			@RequestParam("category")String category,
			HttpServletRequest req){
		
		
		
		
		ModelAndView mav=new ModelAndView();
		
			int count=bannerDao.manBannerCount();
			int ref=0;
			int bannerData=0;
			int fileData=0;

			String fileStr="/goodjob/bannerImg/"+file;
		
			System.out.println(fileStr);
			
			TotalFileDTO dto2=new TotalFileDTO();
			
			Map map=new HashMap();
			
			map.put("file", fileStr);
			map.put("category", category);
			map.put("table_name", "banner");
			
			
			
		
			if(count==0) {
				bannerData=bannerDao.manBannerAdd(dto);
				int idx=dto.getIdx();
				
			
				fileData=totalFileDao.manFileAdd(map);
				
				copyInto(category, file,req);
			}else {
				ref=bannerDao.manBannerRef();
				bannerData=bannerDao.manBannerAdd(dto);
				int idx=dto.getIdx();
				dto2.setFile(fileStr);
				dto2.setTable_idx(idx);
				dto2.setCategory(category);
				copyInto(category, file,req);
				fileData=totalFileDao.manFileAdd(map);
			}
			
		

			
			mav.addObject("msg", "추가 성공!");
			mav.addObject("goUrl", "manBannerPage.do");
		
			mav.setViewName("banner/bannerMsg");
		
			return mav;
	}

	//배너 수정할수 있는 페이지리스트 들어가기
	@RequestMapping("/manBannerUpdatePage.do")
	public ModelAndView manBannerUpdatePage() {
		
		
		List<Banner_totalFileDTO> lists=bannerDao.manBannerFileList();
		
	
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("lists", lists);
		mav.setViewName("banner/manBannerUpdatePage");
		
		return mav;
		
	}
	
	/**배너 수정하는 페이지 들어가기*/
	@RequestMapping("/manBannerUpdateContent.do")
	public ModelAndView manBannerUpdateContent(@RequestParam("idx")int idx) {
		
		ModelAndView mav=new ModelAndView();
		
	
		
		
		Banner_totalFileDTO dto=bannerDao.manBannerUpdateContent(idx);
	
		System.out.println(dto.getFile_idx());
		
		mav.addObject("dto", dto);
		mav.setViewName("banner/manBannerUpdateContent");
		
		return mav;
		
	
	}
	
	/**배너 수정할때*/
	@RequestMapping(value = "/manBannerUpdate.do", method = RequestMethod.POST)
	public ModelAndView manBannerUpdate(BannerDTO dto,
			@RequestParam("file")MultipartFile file,
			@RequestParam("category")String category,
			@RequestParam("idx")int idx,
			@RequestParam("fileidx")int file_idx,
			HttpServletRequest req) {	
		
		ModelAndView mav=new ModelAndView();
		
		copyInto(category, file,req);
		System.out.println(file.getOriginalFilename());
		String fileStr="/goodjob/bannerImg/"+file;
		System.out.println(fileStr);
		TotalFileDTO dto2=new TotalFileDTO();
		dto2.setFile(fileStr);
		dto2.setTable_idx(idx);
		dto2.setIdx(file_idx);
		dto2.setCategory(category);

		
	
		int count=bannerDao.manBannerAdd(dto);
		int count2=totalFileDao.manFileUpdate(dto2);
	
		
		mav.addObject("msg", "수정 완료!");
		mav.addObject("goUrl", "manBannerUpdatePage.do");
		mav.setViewName("banner/bannerMsg");
		
		return mav;
		
	}
	/**배너 삭제 페이지 들어가기*/
	@RequestMapping("/manBannerDelPage.do")
	public ModelAndView manBannerDelPage() {
		
		ModelAndView mav=new ModelAndView();
		
		List<Banner_totalFileDTO> lists=bannerDao.manBannerFileList();
		
		mav.addObject("lists", lists);
		mav.setViewName("banner/manBannerDelPage");
		
		return mav;
	}
	
	/**배너 삭제하기*/
	@RequestMapping("/manBannerDel.do")
	public ModelAndView manBannerDel(
			@RequestParam("idx")int idx) {
		
		
		ModelAndView mav=new ModelAndView();
		
		int bannerDel=bannerDao.manBannerDel(idx);
		int fileDel=totalFileDao.manFileDel(idx);
		
		mav.addObject("msg", "삭제 성공");
		mav.addObject("goUrl", "manBannerDelPage.do");
		
		mav.setViewName("banner/bannerMsg");
		
		return mav;
	}
	/**파일복사관련메서드*/
	public void copyInto(String category, MultipartFile file,HttpServletRequest req) {
		
		
		String path = req.getSession().getServletContext().getRealPath("/bannerImg");
		try {
			byte bytes[]=file.getBytes(); //원본가져오기
			//용지
			File outfile=new File(path+"/"+file.getOriginalFilename());
			
			FileOutputStream fos=new FileOutputStream(outfile);
			fos.write(bytes);//복사
			fos.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
