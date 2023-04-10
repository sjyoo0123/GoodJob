package com.goodjob.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.plan_up.model.Plan_UpDAO;
import com.goodjob.plan_up.model.Plan_UpDTO;
import com.goodjob.plan_vip.model.Plan_VipDAO;
import com.goodjob.plan_vip.model.Plan_VipDTO;

@Controller
public class PlanController {

	@Autowired
	private Plan_UpDAO plan_UpDao;
	
	@Autowired
	private Plan_VipDAO plan_VipDao;
	
	
	/**요금제관리 페이지 들어가기*/
	@RequestMapping("/manPlanPage.do")
	public ModelAndView manPlanPage() {
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("plan/manPlanPage");
		
		return mav;
		
	}
	/**요금제 추가하기*/
	@RequestMapping(value="/manPlanAdd.do", method = RequestMethod.POST )
	public ModelAndView manPlanAdd(
			@RequestParam("plan_name")String plan_name,
			@RequestParam("plan_price")String plan_price,
			@RequestParam("plan_type")String plan_type,
			@RequestParam("vip_floor")String vip_floor,
			@RequestParam("up_count")int up_count,
			@RequestParam("plan_period")int plan_period,
			Plan_UpDTO dto,Plan_VipDTO dto2
			) {
		
		Map map=new HashMap();	
		
		ModelAndView mav=new ModelAndView();
		
		if(plan_type.equals("up요금제")) {
			
			map.put("count", up_count);
			
			int count=plan_UpDao.manPlanAdd(dto);
			if(count<0) {
				mav.addObject("msg", "up요금제 추가 실패");	
			}else {
				int count2=plan_UpDao.manPlanUpAdd(map);	
				mav.addObject("msg", "up요금제 추가 성공");
			}
		}else {
			
			map.put("plan_period", plan_period);
			map.put("vip_floor", vip_floor);
			
			int count=plan_VipDao.manPlanAdd(dto2);
			if(count<0) {
				mav.addObject("msg", "vip요금제 추가 실패");
			}else {
				int count2=plan_VipDao.manPlanVipAdd(map);
				mav.addObject("msg", "vip요금제 추가 성공");	
			}
		}
		mav.addObject("goUrl", "manPlanPage.do");
			mav.setViewName("plan/manPlanMsg");
		
			return mav;
	}
	
	/**요금제 삭제페이지 들어가기*/
	@RequestMapping("/manPlanDelPage.do")
	public ModelAndView manPlanDelPage(
				) {
		
	List<Plan_UpDTO> lists_up=plan_UpDao.manPlanUpList();
		
	List<Plan_VipDTO> lists_vip=plan_VipDao.manPlanVipList();
		
	
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("lists_up", lists_up);
		mav.addObject("lists_vip", lists_vip);
	
		
		mav.setViewName("plan/manPlanDelPage");
		
		return mav;
	}

	/**up 요금제 삭제하기(비활성화 처리)*/
	@RequestMapping("/manPlanUpDel.do")
	public ModelAndView manPlanUpDel(
			@RequestParam("idx")int idx) {
		
		ModelAndView mav=new ModelAndView();
		
		int count=plan_UpDao.manPlanUpDel(idx);
		
		if(count>0) {
			mav.addObject("msg","삭제에 성공하셨습니다.");
			
		}else {
			mav.addObject("msg", "삭제에 실패하셨습니다.");
		}
		
		
		mav.addObject("goUrl", "manPlanDelPage");
		
		mav.setViewName("plan/manPlanMsg");
		
		return mav;
	}
	
	/**vip 요금제 삭제하기(비활성화 처리)*/
	@RequestMapping("/manPlanVipDel.do")
	public ModelAndView manPlanVipDel(
			@RequestParam("idx")int idx) {
		
		ModelAndView mav= new ModelAndView();
		
		int count=plan_VipDao.manPlanDel_vip(idx);
		
		if(count>0) {
			mav.addObject("msg", "삭제에 성공하셨습니다.");
		}else {
			mav.addObject("msg", "삭제에 실패하셨습니다");
		}
		
		mav.addObject("goUrl", "manPlanDelPage");
	
		mav.setViewName("plan/manPlanMsg");
		
		return mav;
		
	}
	
	/**요금제 수정 페이지 들어가기*/
	@RequestMapping("/manPlanUpdatePage.do")
	public ModelAndView manPlanUpdatePage() {
		
		ModelAndView mav=new ModelAndView();
		
		
		List<Plan_UpDTO> lists_up_update = plan_UpDao.manPlanUpList_update();
		
		List<Plan_VipDTO> lists_vip_update = plan_VipDao.manPlanVipList_update();
		
		
		mav.addObject("lists_up_update", lists_up_update);
		mav.addObject("lists_vip_update", lists_vip_update);
		
		mav.setViewName("plan/manPlanUpdatePage");
		
		return mav;
	}
	
	/**vip 요금제 수정하기 페이지 들어가기*/
	@RequestMapping(value="/manPlanVipUpdateContent.do", method = RequestMethod.GET)
	public ModelAndView manPlanVipUpdateContent(
			@RequestParam("idx")int idx) {
	
		ModelAndView mav= new ModelAndView();
		
		Plan_VipDTO dto=plan_VipDao.manPlanVipContent(idx);
		
		mav.addObject("dto", dto);
		
		mav.setViewName("plan/manPlanVipUpdateContent");
		
		return mav;
	}
	
	/**up 요금제 수정하기 페이지 들어가기*/
	@RequestMapping(value="/manPlanUpUpdateContent.do", method = RequestMethod.GET)
	public ModelAndView manPlanUpUpdateContent(
			@RequestParam("idx")int idx) {
		
		ModelAndView mav=new ModelAndView();
		
		Plan_UpDTO dto=plan_UpDao.manPlanUpContent(idx);
		
		mav.addObject("dto", dto);
		mav.setViewName("plan/manPlanUpUpdateContent");
		
		return mav;
	}
		
	/**vip 요금제 수정하기 버튼을 눌렀을때*/
	@RequestMapping(value = "/manPlanVipUpdate.do", method = RequestMethod.POST)
	public ModelAndView manPlanVipUpdate(Plan_VipDTO dto){
	
		ModelAndView mav=new ModelAndView();
		
		
		
			int count=plan_VipDao.manPlanVipUpdate_a(dto);
			int count2=plan_VipDao.manPlanVipUpdate_b(dto);
			if(count>0 && count2>0) {
				mav.addObject("msg", "vip요금제 수정 완료");
				mav.addObject("goUrl", "manPlanUpdatePage.do");
			}else {
				mav.addObject("msg", "vip요금제 수정 실패");
				mav.addObject("goUrl", "manPlanUpdatePage.do");
			}	
		
			mav.setViewName("plan/manPlanMsg");
			
			return mav;
	}
	
	/**up 요금제 수정하기 버튼을 눌렀을때*/
	@RequestMapping(value =  "/manPlanUpUpdate.do", method = RequestMethod.POST)
	public ModelAndView manPlanUpUpdate(Plan_UpDTO dto) {
		
		ModelAndView mav=new ModelAndView();
		
		int count=plan_UpDao.manPlanUpUpdate_a(dto);
		
		int count2=plan_UpDao.manPlanUpUpdate_b(dto);
		
		System.out.println(count);
		System.out.println(count2);
		if(count>0 && count2>0) {
			mav.addObject("msg", "up요금제 수정 완료");
			mav.addObject("goUrl", "manPlanUpdatePage.do");
		}else {
			mav.addObject("msg", "up요금제 수정 실패");
			mav.addObject("goUrl", "manPlanUpdatePage.do");
		}	
	
		mav.setViewName("plan/manPlanMsg");
		
		return mav;
		
	}	
}
