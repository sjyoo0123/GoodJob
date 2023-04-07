package com.goodjob.jobhelper.model;

public class JobHelperDTO {

	private String category;
	private int price;
	public JobHelperDTO() {
		// TODO Auto-generated constructor stub
	}
	public JobHelperDTO(String category, int price) {
		super();
		this.category = category;
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
}
