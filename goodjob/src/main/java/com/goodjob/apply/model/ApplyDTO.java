package com.goodjob.apply.model;

import java.sql.Date;

public class ApplyDTO {

	private int idx;
	private int normal_idx;
	private int notice_idx;
	private Date applydate;
	private String normal_name;
	private Date normal_berth;
	private int check;
	private String status;
	public ApplyDTO() {
		super();
	}
	public ApplyDTO(int idx, int normal_idx, int notice_idx, Date applydate, String normal_name, Date normal_berth,
			int check, String status) {
		super();
		this.idx = idx;
		this.normal_idx = normal_idx;
		this.notice_idx = notice_idx;
		this.applydate = applydate;
		this.normal_name = normal_name;
		this.normal_berth = normal_berth;
		this.check = check;
		this.status = status;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getNormal_idx() {
		return normal_idx;
	}
	public void setNormal_idx(int normal_idx) {
		this.normal_idx = normal_idx;
	}
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public Date getApplydate() {
		return applydate;
	}
	public void setApplydate(Date applydate) {
		this.applydate = applydate;
	}
	public String getNormal_name() {
		return normal_name;
	}
	public void setNormal_name(String normal_name) {
		this.normal_name = normal_name;
	}
	public Date getNormal_berth() {
		return normal_berth;
	}
	public void setNormal_berth(Date normal_berth) {
		this.normal_berth = normal_berth;
	}
	public int getCheck() {
		return check;
	}
	public void setCheck(int check) {
		this.check = check;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "ApplyDTO [idx=" + idx + ", normal_idx=" + normal_idx + ", notice_idx=" + notice_idx + ", applydate="
				+ applydate + ", normal_name=" + normal_name + ", normal_berth=" + normal_berth + ", check=" + check
				+ ", status=" + status + "]";
	}
	
}
