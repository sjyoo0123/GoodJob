package com.goodjob.sales.model;

import java.sql.Date;

public class SalesDTO {


	private String paydate;
	private int price;
	
	public SalesDTO() {
		super();
	}

	public SalesDTO(String paydate, int price) {
		super();
		this.paydate = paydate;
		this.price = price;
	}

	public String getPaydate() {
		return paydate;
	}

	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}


}
