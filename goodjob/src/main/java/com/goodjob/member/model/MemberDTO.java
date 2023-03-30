package com.goodjob.member.model;

import java.sql.Date;

public class MemberDTO {

	private int idx;
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String tel;
	private String addr;
	private Date joindate;
	private int singo_count;
	private String user_category;
	private String status;
	public MemberDTO() {
		super();
	}
	public MemberDTO(int idx, String id, String pwd, String name, String email, String tel, String addr, Date joindate,
			int singo_count, String user_category, String status) {
		super();
		this.idx = idx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.tel = tel;
		this.addr = addr;
		this.joindate = joindate;
		this.singo_count = singo_count;
		this.user_category = user_category;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
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
	public String getUser_category() {
		return user_category;
	}
	public void setUser_category(String user_category) {
		this.user_category = user_category;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "MemberDTO [idx=" + idx + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email
				+ ", tel=" + tel + ", addr=" + addr + ", joindate=" + joindate + ", singo_count=" + singo_count
				+ ", user_category=" + user_category + ", status=" + status + "]";
	}
	
	
}
