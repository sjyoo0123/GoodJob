package com.goodjob.companymember.model;

import java.sql.Date;

public class CompanyMemberDTO {

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
	private int com_idx;
	private int member_idx;
	private String com_name;
	private int com_num;
	private String detail_addr;
	private Date com_birth;
	
	public CompanyMemberDTO() {
		super();
	}

	public CompanyMemberDTO(int idx, String id, String pwd, String name, String email, String tel, String addr,
			Date joindate, int singo_count, String user_category, String status, int com_idx, int member_idx,
			String com_name, int com_num, String detail_addr, Date com_birth) {
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
		this.com_idx = com_idx;
		this.member_idx = member_idx;
		this.com_name = com_name;
		this.com_num = com_num;
		this.detail_addr = detail_addr;
		this.com_birth = com_birth;
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

	public int getCom_idx() {
		return com_idx;
	}

	public void setCom_idx(int com_idx) {
		this.com_idx = com_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getCom_name() {
		return com_name;
	}

	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}

	public int getCom_num() {
		return com_num;
	}

	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}

	public String getDetail_addr() {
		return detail_addr;
	}

	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}

	public Date getCom_birth() {
		return com_birth;
	}

	public void setCom_birth(Date com_birth) {
		this.com_birth = com_birth;
	}

	@Override
	public String toString() {
		return "CompanyMemberDTO [idx=" + idx + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email
				+ ", tel=" + tel + ", addr=" + addr + ", joindate=" + joindate + ", singo_count=" + singo_count
				+ ", user_category=" + user_category + ", status=" + status + ", com_idx=" + com_idx + ", member_idx="
				+ member_idx + ", com_name=" + com_name + ", com_num=" + com_num + ", detail_addr=" + detail_addr
				+ ", com_birth=" + com_birth + "]";
	}
	
	
}
