package com.goodjob.controller;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.goodjob.member.model.MemberDAO;
import com.goodjob.member.model.MemberDTO;
import com.goodjob.payment_log.model.Payment_LogDAO;
import com.goodjob.payment_log.model.Payment_LogDTO;
import com.goodjob.payment_log.model.SuccessDTO;
import com.goodjob.plan_up.model.Plan_UpDAO;
import com.goodjob.plan_up.model.Plan_UpDTO;
import com.goodjob.plan_used_up.model.Plan_Used_UpDAO;
import com.goodjob.plan_used_up.model.Plan_Used_UpDTO;
import com.goodjob.plan_used_vip.model.Plan_Used_VipDAO;
import com.goodjob.plan_vip.model.Plan_VipDAO;
import com.goodjob.plan_vip.model.Plan_VipDTO;

@Controller
public class Payment_logController {
	
	@Autowired
	private Payment_LogDAO paymentDao;
	@Autowired
	private MemberDAO memberDao;
	@Autowired
	private Plan_UpDAO planUpDao;
	@Autowired
	private Plan_VipDAO planVipDao;
	@Autowired
	private Plan_Used_UpDAO plan_used_upDao;
	@Autowired
	private Plan_Used_VipDAO plan_used_vipDao;
	
	
	
	/**결제 페이지들어가기*/
	@RequestMapping("/manPayment_logPage.do")
	public ModelAndView manPayment_logPage(
			HttpSession Session,@RequestParam("idx")int idx) {
		
		ModelAndView mav=new ModelAndView();
		
		Integer sidx=Session.getAttribute("sidx")==null?0:(Integer)Session.getAttribute("sidx");
		
		
		if(sidx!=0) {
			MemberDTO dto=memberDao.selectIdx(sidx);
			
			mav.addObject("dto", dto);
		}
		
		Plan_UpDTO dto=planUpDao.manPlanSelect(idx);
		
		if(dto.getPlan_type().equals("VIP")) {
			Plan_VipDTO dto2=planVipDao.manPlanPayment_vip(idx);
			mav.addObject("planDto", dto2);
		}else if(dto.getPlan_type().equals("UP")){
			Plan_UpDTO dto3=planUpDao.manPlanPayment_up(idx);
			
			mav.addObject("planDto", dto3);
		}
		
		
		
		String str=paymentDao.paymentCallUid();
		
		
		mav.addObject("str", str);
		
		mav.setViewName("payment_log/manPayment_logPage");
		
		return mav;
	}
	/**결제하기를 눌럿을때
	 * @throws JsonProcessingException 
	 * @throws JsonMappingException */
	@ResponseBody
	@RequestMapping(value="/manPayment_logEnd.do", method = RequestMethod.POST)
	public ModelAndView manPayment_logEnd(@RequestBody JSONObject success,HttpSession Session
			) throws JsonMappingException, JsonProcessingException {
		
		Integer sidx=Session.getAttribute("sidx")==null?0:(Integer)Session.getAttribute("sidx");
		String suc_check="";
		System.out.println(sidx);
		System.out.println(success.size());
		
		ObjectMapper objectMapper=new ObjectMapper();
		
		Map<String, Object> map = new HashMap<>();
		for (Object key : success.keySet()) {
		    String keyStr = key.toString();
		    Object keyvalue = success.get(keyStr);
		    // Map에 key-value 쌍 추가
		}
			map=objectMapper.readValue(success.toString(), Map.class);
		
			String merchant_uid = (String)map.get("merchant_uid");
			String name=(String)map.get("name");
			int price=(Integer)map.get("paid_amount");
			System.out.println(map.get("custom_data").getClass().getName()+" "+ map.get("custom_data"));
			Integer paidAtSeconds = (Integer) map.get("paid_at");
			long paidAtMillis = paidAtSeconds * 1000L;
			Date date = new Date(paidAtMillis);
			String customDate_s=(String)map.get("custom_data");
			int customDate=Integer.parseInt(customDate_s);
			
			System.out.println(date);
		

			
			String imp_uid=(String)map.get("imp_uid");
			if(map.get("status").equals("paid")) {
				suc_check="성공";
			}else if(map.get("status").equals("failed")) {
				suc_check="실패";
			}else if(map.get("status").equals("ready")) {
				suc_check="대기";
			}
			
			
		ModelAndView mav=new ModelAndView();
		Payment_LogDTO dto=new Payment_LogDTO(merchant_uid, sidx, name, price, date, imp_uid, suc_check);
	
		int count=paymentDao.manPaymentAdd(dto);
				
		if(count>0) {
			Plan_UpDTO dto2=planUpDao.manPlanSelect(customDate);
			
			Map usedMap=new HashMap();
			usedMap.put("plan_idx", customDate);
			usedMap.put("member_idx", sidx);
			usedMap.put("plan_date", date);
			usedMap.put("plan_type", dto2.getPlan_type());
			
			int result=plan_used_upDao.manPlanUsedAdd(usedMap);
		
			if(dto2.getPlan_type().equals("UP")) {
			Plan_UpDTO dto3=planUpDao.manPlanPayment_up(customDate);
			
			Map upMap=new HashMap();
	
			upMap.put("member_idx", sidx);
			System.out.println(dto3.getCount());
			upMap.put("used_count", dto3.getCount());
			
			int result_up=plan_used_upDao.manPlanUsedAdd_up(upMap);
			
			}else if(dto2.getPlan_type().equals("VIP")){
			
			Plan_VipDTO dto4=planVipDao.manPlanPayment_vip(customDate);
			System.out.println("2");
			Map vipMap=new HashMap();
			//int count3=plan_used_vipDao.manPlanUsedIdx_Currval();
			
			//vipMap.put("plan_used_idx_se", count3);
			//System.out.println(count3);
			vipMap.put("member_idx", sidx);
			vipMap.put("plan_end", dto4.getPlan_period());
			vipMap.put("used_vip_floor", dto4.getVip_floor());
			System.out.println("3");
			int result_vip=plan_used_vipDao.manPlanUsedAdd_vip(vipMap);
			}
		}
		
		mav.setViewName("goodjobJson");
		
		return mav;
	}
	
	/**테스트 페이지*/
	@ResponseBody
	@RequestMapping(value="/testpayment.do", method = RequestMethod.GET)
	public ModelAndView test() {
		
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("payment_log/test");
		
		return mav;
	}
}
