package com.goodjob.payment_log.model;

import java.sql.Date;

public class Payment_LogDTO {

	private int idx;
	private int com_idx;
	private String name;
	private int price;
	private Date paydate;
	private String imp_uid;
	private String merchant_uid;
	public Payment_LogDTO() {
		super();
	}
	public Payment_LogDTO(int idx, int com_idx, String name, int price, Date paydate, String imp_uid,
			String merchant_uid) {
		super();
		this.idx = idx;
		this.com_idx = com_idx;
		this.name = name;
		this.price = price;
		this.paydate = paydate;
		this.imp_uid = imp_uid;
		this.merchant_uid = merchant_uid;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getCom_idx() {
		return com_idx;
	}
	public void setCom_idx(int com_idx) {
		this.com_idx = com_idx;
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
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	@Override
	public String toString() {
		return "Payment_LogDTO [idx=" + idx + ", com_idx=" + com_idx + ", name=" + name + ", price=" + price
				+ ", paydate=" + paydate + ", imp_uid=" + imp_uid + ", merchant_uid=" + merchant_uid + "]";
	}
	
	
}
