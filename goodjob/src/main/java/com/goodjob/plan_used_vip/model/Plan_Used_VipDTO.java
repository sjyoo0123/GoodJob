package com.goodjob.plan_used_vip.model;

import java.sql.Date;

public class Plan_Used_VipDTO {

	private int idx;
	private int com_idx;
	private int plan_idx;
	private Date plan_start;
	private String plan_type;
	private String status;
	private int vip_used_idx;
	private int plan_used_idx;
	private Date plan_end;
	private String used_vip_floor;
	public Plan_Used_VipDTO() {
		super();
	}
	public Plan_Used_VipDTO(int idx, int com_idx, int plan_idx, Date plan_start, String plan_type, String status,
			int vip_used_idx, int plan_used_idx, Date plan_end, String used_vip_floor) {
		super();
		this.idx = idx;
		this.com_idx = com_idx;
		this.plan_idx = plan_idx;
		this.plan_start = plan_start;
		this.plan_type = plan_type;
		this.status = status;
		this.vip_used_idx = vip_used_idx;
		this.plan_used_idx = plan_used_idx;
		this.plan_end = plan_end;
		this.used_vip_floor = used_vip_floor;
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
	public int getPlan_idx() {
		return plan_idx;
	}
	public void setPlan_idx(int plan_idx) {
		this.plan_idx = plan_idx;
	}
	public Date getPlan_start() {
		return plan_start;
	}
	public void setPlan_start(Date plan_start) {
		this.plan_start = plan_start;
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
	public int getVip_used_idx() {
		return vip_used_idx;
	}
	public void setVip_used_idx(int vip_used_idx) {
		this.vip_used_idx = vip_used_idx;
	}
	public int getPlan_used_idx() {
		return plan_used_idx;
	}
	public void setPlan_used_idx(int plan_used_idx) {
		this.plan_used_idx = plan_used_idx;
	}
	public Date getPlan_end() {
		return plan_end;
	}
	public void setPlan_end(Date plan_end) {
		this.plan_end = plan_end;
	}
	public String getUsed_vip_floor() {
		return used_vip_floor;
	}
	public void setUsed_vip_floor(String used_vip_floor) {
		this.used_vip_floor = used_vip_floor;
	}
	@Override
	public String toString() {
		return "Plan_Used_VipDTO [idx=" + idx + ", com_idx=" + com_idx + ", plan_idx=" + plan_idx + ", plan_start="
				+ plan_start + ", plan_type=" + plan_type + ", status=" + status + ", vip_used_idx=" + vip_used_idx
				+ ", plan_used_idx=" + plan_used_idx + ", plan_end=" + plan_end + ", used_vip_floor=" + used_vip_floor
				+ "]";
	}
	
}
