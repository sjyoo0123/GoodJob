package com.goodjob.gongji.model;

import java.sql.Date;

public class GongJiDTO {

	private int idx;
	private String subject;
	private String content;
	private Date writedate;
	
	public GongJiDTO() {
		super();
	}
	public GongJiDTO(int idx, String subject, String content, Date writedate) {
		super();
		this.idx = idx;
		this.subject = subject;
		this.content = content;
		this.writedate = writedate;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	@Override
	public String toString() {
		return "GongJiDTO [idx=" + idx + ", subject=" + subject + ", content=" + content + ", writedate=" + writedate
				+ "]";
	}
	
}
