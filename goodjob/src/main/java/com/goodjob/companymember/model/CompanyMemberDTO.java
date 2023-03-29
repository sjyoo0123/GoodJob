package com.goodjob.companymember.model;

import java.sql.Date;

public class CompanyMemberDTO {

	private int idx;
	private String id;
	private String pwd;
	private String com_name;
	private String name;
	private int com_num;
	private String email;
	private String addr;
	private String detail_addr;
	private String tel;
	private Date com_birth;
	private Date joindate;
	private int singo_count;
	private String status;
	public CompanyMemberDTO() {
		super();
	}
	public CompanyMemberDTO(int idx, String id, String pwd, String com_name, String name, int com_num, String email,
			String addr, String detail_addr, String tel, Date com_birth, Date joindate, int singo_count,
			String status) {
		super();
		this.idx = idx;
		this.id = id;
		this.pwd = pwd;
		this.com_name = com_name;
		this.name = name;
		this.com_num = com_num;
		this.email = email;
		this.addr = addr;
		this.detail_addr = detail_addr;
		this.tel = tel;
		this.com_birth = com_birth;
		this.joindate = joindate;
		this.singo_count = singo_count;
		this.status = status;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCom_num() {
		return com_num;
	}
	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDetail_addr() {
		return detail_addr;
	}
	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getCom_birth() {
		return com_birth;
	}
	public void setCom_birth(Date com_birth) {
		this.com_birth = com_birth;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public int getSingo_count() {
		return singo_count;
	}
	public void setSingo_count(int singo_count) {
		this.singo_count = singo_count;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "CompanyMemberDTO [idx=" + idx + ", id=" + id + ", pwd=" + pwd + ", com_name=" + com_name + ", name="
				+ name + ", com_num=" + com_num + ", email=" + email + ", addr=" + addr + ", detail_addr=" + detail_addr
				+ ", tel=" + tel + ", com_birth=" + com_birth + ", joindate=" + joindate + ", singo_count="
				+ singo_count + ", status=" + status + "]";
	}
	
}
