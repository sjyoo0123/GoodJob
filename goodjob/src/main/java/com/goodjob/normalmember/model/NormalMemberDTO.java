package com.goodjob.normalmember.model;

import java.sql.Date;

public class NormalMemberDTO {

	private int idx;
	private String id;
	private String pwd;
	private String name;
	private Date birth;
	private String gender;
	private String email;
	private String tel;
	private String addr;
	private Date joindate;
	private int singo_count;
	private String status;
	
	public NormalMemberDTO() {
		super();
	}

	public NormalMemberDTO(int idx, String id, String pwd, String name, Date birth, String gender, String email,
			String tel, String addr, Date joindate, int singo_count, String status) {
		super();
		this.idx = idx;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.tel = tel;
		this.addr = addr;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "NormalMemberDTO [idx=" + idx + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", birth=" + birth
				+ ", gender=" + gender + ", email=" + email + ", tel=" + tel + ", addr=" + addr + ", joindate="
				+ joindate + ", singo_count=" + singo_count + ", status=" + status + "]";
	}
	
	
}
