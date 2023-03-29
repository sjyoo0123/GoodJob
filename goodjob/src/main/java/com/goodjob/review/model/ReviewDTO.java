package com.goodjob.review.model;

import java.sql.Date;

public class ReviewDTO {

	private int idx;
	private int com_idx;
	private int normal_idx;
	private int review_num;
	private String com_name;
	private Date writedate;
	private int keyword;
	private String status;
	
	public ReviewDTO() {
		super();
	}

	public ReviewDTO(int idx, int com_idx, int normal_idx, int review_num, String com_name, Date writedate, int keyword,
			String status) {
		super();
		this.idx = idx;
		this.com_idx = com_idx;
		this.normal_idx = normal_idx;
		this.review_num = review_num;
		this.com_name = com_name;
		this.writedate = writedate;
		this.keyword = keyword;
		this.status = status;
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

	public int getNormal_idx() {
		return normal_idx;
	}

	public void setNormal_idx(int normal_idx) {
		this.normal_idx = normal_idx;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getCom_name() {
		return com_name;
	}

	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public int getKeyword() {
		return keyword;
	}

	public void setKeyword(int keyword) {
		this.keyword = keyword;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
	
	
}
