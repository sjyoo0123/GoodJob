package com.goodjob.review.model;

import java.sql.Date;

public class ReviewDTO {

	private int idx;
	private int member_idx;
	private int review_num;
	private String com_name;
	private Date writedate;
	private String keyword;
	private String status;
	
	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public ReviewDTO(int idx, int member_idx, int review_num, String com_name, Date writedate, String keyword,
			String status) {
		super();
		this.idx = idx;
		this.member_idx = member_idx;
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

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
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

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ReveiwDTO [idx=" + idx + ", member_idx=" + member_idx + ", review_num=" + review_num + ", con_name="
				+ com_name + ", writedate=" + writedate + ", keyword=" + keyword + ", status=" + status + "]";
	}
}
