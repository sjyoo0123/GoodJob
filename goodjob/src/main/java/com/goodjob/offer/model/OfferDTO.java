package com.goodjob.offer.model;

import java.sql.Date;

public class OfferDTO {

	private int idx;
	private int normal_idx;
	private int com_idx;
	private int notice_idx;
	private Date offerdate;
	private String com_name;
	private String normal_name;
	private String notice_subject;
	private String normal_gender;
	private Date normal_birth;
	private int check;
	private String status;
	
	public OfferDTO() {
		super();
	}
	public OfferDTO(int idx, int normal_idx, int com_idx, int notice_idx, Date offerdate, String com_name,
			String normal_name, String notice_subject, String normal_gender, Date normal_birth, int check,
			String status) {
		super();
		this.idx = idx;
		this.normal_idx = normal_idx;
		this.com_idx = com_idx;
		this.notice_idx = notice_idx;
		this.offerdate = offerdate;
		this.com_name = com_name;
		this.normal_name = normal_name;
		this.notice_subject = notice_subject;
		this.normal_gender = normal_gender;
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
	public int getNormal_idx() {
		return normal_idx;
	}
	public void setNormal_idx(int normal_idx) {
		this.normal_idx = normal_idx;
	}
	public int getCom_idx() {
		return com_idx;
	}
	public void setCom_idx(int com_idx) {
		this.com_idx = com_idx;
	}
	public int getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}
	public Date getOfferdate() {
		return offerdate;
	}
	public void setOfferdate(Date offerdate) {
		this.offerdate = offerdate;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getNormal_name() {
		return normal_name;
	}
	public void setNormal_name(String normal_name) {
		this.normal_name = normal_name;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNormal_gender() {
		return normal_gender;
	}
	public void setNormal_gender(String normal_gender) {
		this.normal_gender = normal_gender;
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
		return "OfferDTO [idx=" + idx + ", normal_idx=" + normal_idx + ", com_idx=" + com_idx + ", notice_idx="
				+ notice_idx + ", offerdate=" + offerdate + ", com_name=" + com_name + ", normal_name=" + normal_name
				+ ", notice_subject=" + notice_subject + ", normal_gender=" + normal_gender + ", normal_birth="
				+ normal_birth + ", check=" + check + ", status=" + status + "]";
	}
	
	
}
