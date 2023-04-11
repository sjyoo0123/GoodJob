package com.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.plan_up.model.Plan_UpDTO;

@Controller
public class Payment_logController {

	
	@RequestMapping("/manPayment_logPage.do")
	public ModelAndView manPayment_logPage() {
		
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("payment_log/manPayment_logPage");
		
		return mav;
	}
}
