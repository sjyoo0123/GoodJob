package com.goodjob.plan.model;

public class PlanDTO {

	private int idx;
	private String plan_name;
	private int plan_period;
	private int plan_price;
	private String plan_type;
	private String status;
	
	public PlanDTO() {
		super();
	}

	public PlanDTO(int idx, String plan_name, int plan_period, int plan_price, String plan_type, String status) {
		super();
		this.idx = idx;
		this.plan_name = plan_name;
		this.plan_period = plan_period;
		this.plan_price = plan_price;
		this.plan_type = plan_type;
		this.status = status;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getPlan_name() {
		return plan_name;
	}

	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}

	public int getPlan_period() {
		return plan_period;
	}

	public void setPlan_period(int plan_period) {
		this.plan_period = plan_period;
	}

	public int getPlan_price() {
		return plan_price;
	}

	public void setPlan_price(int plan_price) {
		this.plan_price = plan_price;
	}

	public String getPlan_type() {
		return plan_type;
	}

	public void setPlan_type(String plan_type) {
		this.plan_type = plan_type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "PlanDTO [idx=" + idx + ", plan_name=" + plan_name + ", plan_period=" + plan_period + ", plan_price="
				+ plan_price + ", plan_type=" + plan_type + ", status=" + status + "]";
	}
	
}
