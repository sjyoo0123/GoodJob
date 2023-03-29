package com.goodjob.career.model;

import java.sql.Date;

public class CareerDTO {

	private int idx;
	private int resume_idx;
	private Date startday;
	private Date endday;
	private String com_name;
	private String part;
	private String service_type;
	private String status;
	public CareerDTO() {
		super();
	}
	public CareerDTO(int idx, int resume_idx, Date startday, Date endday, String com_name, String part,
			String service_type, String status) {
		super();
		this.idx = idx;
		this.resume_idx = resume_idx;
		this.startday = startday;
		this.endday = endday;
		this.com_name = com_name;
		this.part = part;
		this.service_type = service_type;
		this.status = status;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getResume_idx() {
		return resume_idx;
	}
	public void setResume_idx(int resume_idx) {
		this.resume_idx = resume_idx;
	}
	public Date getStartday() {
		return startday;
	}
	public void setStartday(Date startday) {
		this.startday = startday;
	}
	public Date getEndday() {
		return endday;
	}
	public void setEndday(Date endday) {
		this.endday = endday;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getService_type() {
		return service_type;
	}
	public void setService_type(String service_type) {
		this.service_type = service_type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "CareerDTO [idx=" + idx + ", resume_idx=" + resume_idx + ", startday=" + startday + ", endday=" + endday
				+ ", com_name=" + com_name + ", part=" + part + ", service_type=" + service_type + ", status=" + status
				+ "]";
	}
	
}
