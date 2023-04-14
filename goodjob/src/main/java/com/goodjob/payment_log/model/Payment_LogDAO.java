package com.goodjob.payment_log.model;

public interface Payment_LogDAO {


	public String paymentCallUid();
	
	public int manPaymentAdd(Payment_LogDTO dto);

}
