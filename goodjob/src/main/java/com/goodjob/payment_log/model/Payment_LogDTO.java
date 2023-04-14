package com.goodjob.payment_log.model;

import java.sql.Date;

public class Payment_LogDTO {

	private String merchant_uid;
	private int member_idx;
	private String name;
	private int price;
	
	private Date paydate;
	private String imp_uid;
	private String suc_check;
	public Payment_LogDTO() {
		super();
	}
	public Payment_LogDTO(String merchant_uid, int member_idx, String name, int price, Date patdate, String imp_uid,
			String suc_check) {
		super();
		this.merchant_uid = merchant_uid;
		this.member_idx = member_idx;
		this.name = name;
		this.price = price;
		this.paydate = patdate;
		this.imp_uid = imp_uid;
		this.suc_check = suc_check;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	public Date getPaydate() {
		return paydate;
	}
	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getSuc_check() {
		return suc_check;
	}
	public void setSuc_check(String suc_check) {
		this.suc_check = suc_check;
	}
	
	
	
	
}
