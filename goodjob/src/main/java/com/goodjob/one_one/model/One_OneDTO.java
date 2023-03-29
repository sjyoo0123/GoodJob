package com.goodjob.one_one.model;

import java.sql.Date;

public class One_OneDTO {

	private int idx;
	private int normal_idx;
	private Date writedate;
	private String subject;
	private String category;
	private String content;
	private String email;
	private int check;
	private String status;
	
	public One_OneDTO() {
		super();
	}

	public One_OneDTO(int idx, int normal_idx, Date writedate, String subject, String category, String content,
			String email, int check, String status) {
		super();
		this.idx = idx;
		this.normal_idx = normal_idx;
		this.writedate = writedate;
		this.subject = subject;
		this.category = category;
		this.content = content;
		this.email = email;
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

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
		return "One_OneDTO [idx=" + idx + ", normal_idx=" + normal_idx + ", writedate=" + writedate + ", subject="
				+ subject + ", category=" + category + ", content=" + content + ", email=" + email + ", check=" + check
				+ ", status=" + status + "]";
	}
	
}
