package com.goodjob.resume.model;

import java.sql.Date;

public class ResumeDTO {

	private int idx;
	private int member_idx;
	private String name;
	private String gender;
	private int age;
	private String addr;
	private String detail_addr;
	private String email;
	private String tel;
	private String subject;
	private String grade;
	private String career_check;
	private String job;
	private String h_local1;
	private String h_local2;
	private String h_period;
	private String h_workday;
	private String h_worktime;
	private int h_pay;
	private String h_pay_category;
	private String content;
	private Date writedate;
	private String status;
	private int check;

	public ResumeDTO() {
		super();
	}

	

	public ResumeDTO(int idx, int member_idx, String name, String gender, int age, String addr, String detail_addr,
			String email, String tel, String subject, String grade, String career_check, String job, String h_local1,
			String h_local2, String h_period, String h_workday, String h_worktime, int h_pay, String h_pay_category,
			String content, Date writedate, String status, int check) {
		super();
		this.idx = idx;
		this.member_idx = member_idx;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.addr = addr;
		this.detail_addr = detail_addr;
		this.email = email;
		this.tel = tel;
		this.subject = subject;
		this.grade = grade;
		this.career_check = career_check;
		this.job = job;
		this.h_local1 = h_local1;
		this.h_local2 = h_local2;
		this.h_period = h_period;
		this.h_workday = h_workday;
		this.h_worktime = h_worktime;
		this.h_pay = h_pay;
		this.h_pay_category = h_pay_category;
		this.content = content;
		this.writedate = writedate;
		this.status = status;
		this.check = check;
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



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public int getAge() {
		return age;
	}



	public void setAge(int age) {
		this.age = age;
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



	public String getSubject() {
		return subject;
	}



	public void setSubject(String subject) {
		this.subject = subject;
	}



	public String getGrade() {
		return grade;
	}



	public void setGrade(String grade) {
		this.grade = grade;
	}



	public String getCareer_check() {
		return career_check;
	}



	public void setCareer_check(String career_check) {
		this.career_check = career_check;
	}



	public String getJob() {
		return job;
	}



	public void setJob(String job) {
		this.job = job;
	}



	public String getH_local1() {
		return h_local1;
	}



	public void setH_local1(String h_local1) {
		this.h_local1 = h_local1;
	}



	public String getH_local2() {
		return h_local2;
	}



	public void setH_local2(String h_local2) {
		this.h_local2 = h_local2;
	}



	public String getH_period() {
		return h_period;
	}



	public void setH_period(String h_period) {
		this.h_period = h_period;
	}



	public String getH_workday() {
		return h_workday;
	}



	public void setH_workday(String h_workday) {
		this.h_workday = h_workday;
	}



	public String getH_worktime() {
		return h_worktime;
	}



	public void setH_worktime(String h_worktime) {
		this.h_worktime = h_worktime;
	}



	public int getH_pay() {
		return h_pay;
	}



	public void setH_pay(int h_pay) {
		this.h_pay = h_pay;
	}



	public String getH_pay_category() {
		return h_pay_category;
	}



	public void setH_pay_category(String h_pay_category) {
		this.h_pay_category = h_pay_category;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Date getWritedate() {
		return writedate;
	}



	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public int getCheck() {
		return check;
	}



	public void setCheck(int check) {
		this.check = check;
	}



	@Override
	public String toString() {
		return "ResumeDTO [idx=" + idx + ", member_idx=" + member_idx + ", name=" + name + ", gender=" + gender
				+ ", age=" + age + ", addr=" + addr + ", detail_addr=" + detail_addr + ", email=" + email + ", tel="
				+ tel + ", subject=" + subject + ", grade=" + grade + " ,career_check=" + career_check + ", job=" + job
				+ " ,h_local1=" + h_local1 + ", h_local2=" + h_local2 + ", h_period=" + h_period + ", h_workday="
				+ h_workday + ", h_worktime=" + h_worktime + ", h_pay=" + h_pay + ", h_pay_category=" + h_pay_category
				+ ", content=" + content +  ", writedate=" + writedate+", status=" + status + ", check=" + check + "]";
	}

}
