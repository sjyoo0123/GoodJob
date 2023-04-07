package com.goodjob.controller;

import java.util.HashMap;
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
	private Plan_VipDAO plan_VipDao;
	
	
	/**요금제관리 페이지 들어가기*/
	@RequestMapping("/manPlanPage.do")
	public ModelAndView manPlanPage() {
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("plan/manPlanPage");
		
		return mav;
		
	}
	
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
}
