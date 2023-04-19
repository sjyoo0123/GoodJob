package com.goodjob.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
			@RequestParam("plan_price")int plan_price,
			@RequestParam("plan_type")String plan_type,
			@RequestParam(value="vip_floor")String vip_floor,
			@RequestParam(value="up_count", defaultValue = "0")int up_count,
			@RequestParam("plan_period")int plan_period
		
			) {
		
		
		
		ModelAndView mav=new ModelAndView();
		
		if(plan_type.equals("UP")) {
			Plan_UpDTO dto=new Plan_UpDTO();
			dto.setPlan_name(plan_name);
			dto.setPlan_price(plan_price);
			dto.setPlan_type(plan_type);
			Map<String, Object> map=new HashMap<String, Object>();	
			
			map.put("count", up_count);
			int count=plan_UpDao.manPlanAdd(dto);
		
			if(count>0) {
				int count2=plan_UpDao.manPlanUpAdd(map);	
				mav.addObject("msg", "up요금제 추가 성공");	
			}else {
				mav.addObject("msg", "up요금제 추가 실패");
			}
		}else if(plan_type.equals("VIP")){
			Map<String, Object> map=new HashMap<String, Object>();	
			Plan_VipDTO dto=new Plan_VipDTO();
			dto.setPlan_name(plan_name);
			dto.setPlan_price(plan_price);
			dto.setPlan_type(plan_type);
			
			map.put("plan_period", plan_period);
			map.put("vip_floor", vip_floor);
			
			int count=plan_VipDao.manPlanAdd(dto);
			if(count>0) {
				int count2=plan_VipDao.manPlanVipAdd(map);
				mav.addObject("msg", "vip요금제 추가 성공");
				
			}else {
				mav.addObject("msg", "vip요금제 추가 실패");
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
		
		
		mav.addObject("goUrl", "manPlanDelPage.do");
		
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
		
		mav.addObject("goUrl", "manPlanDelPage.do");
	
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
	
	@RequestMapping("/planInfo.do")
	public ModelAndView planInfo() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("plan/planInfo");
		return mav;
	}
	
	@RequestMapping(value="/planInfoUp.do",method=RequestMethod.POST)
	@ResponseBody
	public List<Plan_UpDTO> planInfoUp(@RequestParam(value="idx",defaultValue ="0")int idx){
		List<Plan_UpDTO> data=null;
		if(idx!=0) {
			data=plan_UpDao.planInfoUpIdx(idx);
		}else {
			data=plan_UpDao.planInfoUp();
		}
		return data;
	}
	
	@RequestMapping(value="/planInfoVip.do",method=RequestMethod.POST)
	@ResponseBody
	public List<Plan_VipDTO> planInfoVip(@RequestParam(value="idx",defaultValue ="0")int idx,@RequestParam(value="floor")String floor){
		List<Plan_VipDTO> vipdata=null;
		if(idx!=0) {
			vipdata=plan_VipDao.planInfoVipPeriod(idx,floor);
		}else {
			vipdata=plan_VipDao.planInfoVip(floor);
		}
		return vipdata;
	}
}
