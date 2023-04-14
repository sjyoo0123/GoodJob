package com.goodjob.singo.model;

import java.sql.Date;

public class SinGoDTO {

	private int idx;
	private int member_idx;
	private String subject;
	private String category;
	private String singo_type;
	private String singo_content;
	private Date singo_date;
	private int check;
	private String status;
	public SinGoDTO() {
		super();
	}
	public SinGoDTO(int idx, int member_idx, String subject, String category, String singo_type,
			String singo_content, Date singo_date, int check, String status) {
		super();
		this.idx = idx;
		this.member_idx = member_idx;
		this.subject = subject;
		this.category = category;
		this.singo_type = singo_type;
		this.singo_content = singo_content;
		this.singo_date = singo_date;
		this.check = check;
		this.status = status;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSingo_type() {
		return singo_type;
	}
	public void setSingo_type(String singo_type) {
		this.singo_type = singo_type;
	}
	public String getSingo_content() {
		return singo_content;
	}
	public void setSingo_content(String singo_content) {
		this.singo_content = singo_content;
	}
	public Date getSingo_date() {
		return singo_date;
	}
	public void setSingo_date(Date singo_date) {
		this.singo_date = singo_date;
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
		return "SingoDTO [idx=" + idx + ", member_idx=" + member_idx +  ", subject="
				+ subject + ", category=" + category + ", singo_type=" + singo_type + ", singo_content=" + singo_content
				+ ", singo_date=" + singo_date + ", check=" + check + ", status=" + status + "]";
	}
	
}
