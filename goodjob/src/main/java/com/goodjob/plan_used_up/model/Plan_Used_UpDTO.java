package com.goodjob.plan_used_up.model;

import java.sql.Date;

public class Plan_Used_UpDTO {

	private int idx;
	private int com_idx;
	private int plan_idx;
	private Date plan_start;
	private String plan_type;
	private String status;
	private int up_used_idx;
	private int plan_used_idx;
	private int used_count;
	
	public Plan_Used_UpDTO() {
		super();
	}

	public Plan_Used_UpDTO(int idx, int com_idx, int plan_idx, Date plan_start, String plan_type, String status,
			int up_used_idx, int plan_used_idx, int used_count) {
		super();
		this.idx = idx;
		this.com_idx = com_idx;
		this.plan_idx = plan_idx;
		this.plan_start = plan_start;
		this.plan_type = plan_type;
		this.status = status;
		this.up_used_idx = up_used_idx;
		this.plan_used_idx = plan_used_idx;
		this.used_count = used_count;
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

	public int getUp_used_idx() {
		return up_used_idx;
	}

	public void setUp_used_idx(int up_used_idx) {
		this.up_used_idx = up_used_idx;
	}

	public int getPlan_used_idx() {
		return plan_used_idx;
	}

	public void setPlan_used_idx(int plan_used_idx) {
		this.plan_used_idx = plan_used_idx;
	}

	public int getUsed_count() {
		return used_count;
	}

	public void setUsed_count(int used_count) {
		this.used_count = used_count;
	}

	@Override
	public String toString() {
		return "Plan_Used_UpDTO [idx=" + idx + ", com_idx=" + com_idx + ", plan_idx=" + plan_idx + ", plan_start="
				+ plan_start + ", plan_type=" + plan_type + ", status=" + status + ", up_used_idx=" + up_used_idx
				+ ", plan_used_idx=" + plan_used_idx + ", used_count=" + used_count + "]";
	}
	
}
