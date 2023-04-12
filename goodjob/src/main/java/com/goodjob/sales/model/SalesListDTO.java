package com.goodjob.sales.model;

import java.util.Date;

public class SalesListDTO {

	private String merchant_uid;
	private	String username;
	private String name;
	private int price;
	private Date paydate;
	private String imp_uid;
	private String suc_check;
	public SalesListDTO() {
		super();
	}
	public SalesListDTO(String merchant_uid, String username, String name, int price, Date paydate, String imp_uid,
			String suc_check) {
		super();
		this.merchant_uid = merchant_uid;
		this.username = username;
		this.name = name;
		this.price = price;
		this.paydate = paydate;
		this.imp_uid = imp_uid;
		this.suc_check = suc_check;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
