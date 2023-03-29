package com.goodjob.plan_vip.model;

public class Plan_VipDTO {

	private int idx;
	private String plan_name;
	private int plan_price;
	private String plan_type;
	private String status;
	private int vip_idx;
	private int plan_idx;
	private int plan_period;
	private String vip_floor;
	public Plan_VipDTO() {
		super();
	}
	public Plan_VipDTO(int idx, String plan_name, int plan_price, String plan_type, String status, int vip_idx,
			int plan_idx, int plan_period, String vip_floor) {
		super();
		this.idx = idx;
		this.plan_name = plan_name;
		this.plan_price = plan_price;
		this.plan_type = plan_type;
		this.status = status;
		this.vip_idx = vip_idx;
		this.plan_idx = plan_idx;
		this.plan_period = plan_period;
		this.vip_floor = vip_floor;
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
	public int getVip_idx() {
		return vip_idx;
	}
	public void setVip_idx(int vip_idx) {
		this.vip_idx = vip_idx;
	}
	public int getPlan_idx() {
		return plan_idx;
	}
	public void setPlan_idx(int plan_idx) {
		this.plan_idx = plan_idx;
	}
	public int getPlan_period() {
		return plan_period;
	}
	public void setPlan_period(int plan_period) {
		this.plan_period = plan_period;
	}
	public String getVip_floor() {
		return vip_floor;
	}
	public void setVip_floor(String vip_floor) {
		this.vip_floor = vip_floor;
	}
	@Override
	public String toString() {
		return "Plan_VipDTO [idx=" + idx + ", plan_name=" + plan_name + ", plan_price=" + plan_price + ", plan_type="
				+ plan_type + ", status=" + status + ", vip_idx=" + vip_idx + ", plan_idx=" + plan_idx
				+ ", plan_period=" + plan_period + ", vip_floor=" + vip_floor + "]";
	}
	
}
