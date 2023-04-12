package com.goodjob.apply.model;

import java.sql.Date;

public class ApplyDTO {

	private int idx;
	private int notice_idx;
	private int member_idx;
	private Date applydate;
	private String normal_name;
	private Date normal_birth;
	private int check;
	private String status;

	public ApplyDTO() {
		super();
	}

	public ApplyDTO(int idx, int notice_idx, int member_idx, Date applydate, String normal_name, Date normal_birth,
			int check, String status) {
		super();
		this.idx = idx;
		this.notice_idx = notice_idx;
		this.member_idx = member_idx;
		this.applydate = applydate;
		this.normal_name = normal_name;
		this.normal_birth = normal_birth;
		this.check = check;
		this.status = status;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
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

	public Date getNormal_birth() {
		return normal_birth;
	}

	public void setNormal_birth(Date normal_birth) {
		this.normal_birth = normal_birth;
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
		return "ApplyDTO [idx=" + idx + ", member_idx=" + member_idx + ", notice_idx=" + notice_idx + ", applydate="
				+ applydate + ", normal_name=" + normal_name + ", normal_berth=" + normal_birth + ", check=" + check
				+ ", status=" + status + "]";
	}

}
