package com.goodjob.keyword.model;

public class KeywordDTO {

	private int idx;
	private String content;
	private String status;
	
	public KeywordDTO() {
		super();
	}
	public KeywordDTO(int idx, String content, String status) {
		super();
		this.idx = idx;
		this.content = content;
		this.status = status;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "KeywordDTO [idx=" + idx + ", content=" + content + ", status=" + status + "]";
	}
	
}
