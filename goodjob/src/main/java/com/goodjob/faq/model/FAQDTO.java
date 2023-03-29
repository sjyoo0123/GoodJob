package com.goodjob.faq.model;

public class FAQDTO {

	private int idx;
	private String category;
	private String subject;
	private String content;
	
	public FAQDTO() {
		super();
	}
	public FAQDTO(int idx, String category, String subject, String content) {
		super();
		this.idx = idx;
		this.category = category;
		this.subject = subject;
		this.content = content;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	@Override
	public String toString() {
		return "FAQDTO [idx=" + idx + ", category=" + category + ", subject=" + subject + ", content=" + content + "]";
	}
	
}
