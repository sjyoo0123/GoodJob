package com.goodjob.banner.model;

public class BannerDTO {

	private int idx;
	private String subject;
	private String link;
	private int ref;
	private String status;
	public BannerDTO() {
		super();
	}
	public BannerDTO(int idx, String subject, String link, int ref, String status) {
		super();
		this.idx = idx;
		this.subject = subject;
		this.link = link;
		this.ref = ref;
		this.status = status;
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
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "BannerDTO [idx=" + idx + ", subject=" + subject + ", link=" + link + ", ref=" + ref + ", status="
				+ status + "]";
	}
	
}
