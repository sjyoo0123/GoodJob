package com.goodjob.plan_up.model;

public class Plan_UpDTO {

	private int idx;
	private String plan_name;
	private int plan_price;
	private String plan_type;
	private String status;
	private int up_idx;
	private int plan_idx;
	private int count;
	public Plan_UpDTO() {
		super();
	}
	public Plan_UpDTO(int idx, String plan_name, int plan_price, String plan_type, String status, int up_idx,
			int plan_idx, int count) {
		super();
		this.idx = idx;
		this.plan_name = plan_name;
		this.plan_price = plan_price;
		this.plan_type = plan_type;
		this.status = status;
		this.up_idx = up_idx;
		this.plan_idx = plan_idx;
		this.count = count;
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
	public int getUp_idx() {
		return up_idx;
	}
	public void setUp_idx(int up_idx) {
		this.up_idx = up_idx;
	}
	public int getPlan_idx() {
		return plan_idx;
	}
	public void setPlan_idx(int plan_idx) {
		this.plan_idx = plan_idx;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "Plan_UpDTO [idx=" + idx + ", plan_name=" + plan_name + ", plan_price=" + plan_price + ", plan_type="
				+ plan_type + ", status=" + status + ", up_idx=" + up_idx + ", plan_idx=" + plan_idx + ", count="
				+ count + "]";
	}
	
}
