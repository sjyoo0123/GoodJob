package com.goodjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goodjob.payment_log.model.Payment_LogDAO;
import com.goodjob.payment_log.model.SuccessDTO;
import com.goodjob.plan_up.model.Plan_UpDTO;

@Controller
public class Payment_logController {
	
	@Autowired
	private Payment_LogDAO paymentDao;

	/**결제 페이지들어가기*/
	@RequestMapping("/manPayment_logPage.do")
	public ModelAndView manPayment_logPage() {
		
		ModelAndView mav=new ModelAndView();
		
		String str=paymentDao.paymentCallUid();
		
		
		mav.addObject("str", str);
		
		mav.setViewName("payment_log/manPayment_logPage");
		
		return mav;
	}
	/**결제하기를 눌럿을때*/
	@ResponseBody
	@RequestMapping(value="/manPayment_logEnd.do", method = RequestMethod.POST)
	public ModelAndView manPayment_logEnd(
			) {
		
		ModelAndView mav=new ModelAndView();
		
		System.out.println(success);
		
	
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
