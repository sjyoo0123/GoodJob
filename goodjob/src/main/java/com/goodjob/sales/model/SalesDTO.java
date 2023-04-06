package com.goodjob.sales.model;

import java.sql.Date;

public class SalesDTO {


	private Date paydate;
	private int price;
	
	public SalesDTO() {
		super();
	}

	public SalesDTO(Date paydate, int price, String name) {
		super();
		this.paydate = paydate;
		this.price = price;
	}

	public Date getPaydate() {
		return paydate;
	}

	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}


}
