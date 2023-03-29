package com.goodjob.resume.model;

public class ResumeDTO {

	private int idx;
	private int normal_idx;
	private String name;
	private String gender;
	private int age;
	private String addr;
	private String deltai_addr;
	private String email;
	private String tel;
	private String subject;
	private String grade;
	private String h_local1;
	private String h_local2;
	private String h_job;
	private String h_period;
	private String h_workday;
	private String h_worktime;
	private String h_pay;
	private String h_pay_category;
	private String content;
	private String status;
	
	public ResumeDTO() {
		super();
	}

	public ResumeDTO(int idx, int normal_idx, String name, String gender, int age, String addr, String deltai_addr,
			String email, String tel, String subject, String grade, String h_local1, String h_local2, String h_job,
			String h_period, String h_workday, String h_worktime, String h_pay, String h_pay_category, String content,
			String status) {
		super();
		this.idx = idx;
		this.normal_idx = normal_idx;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.addr = addr;
		this.deltai_addr = deltai_addr;
		this.email = email;
		this.tel = tel;
		this.subject = subject;
		this.grade = grade;
		this.h_local1 = h_local1;
		this.h_local2 = h_local2;
		this.h_job = h_job;
		this.h_period = h_period;
		this.h_workday = h_workday;
		this.h_worktime = h_worktime;
		this.h_pay = h_pay;
		this.h_pay_category = h_pay_category;
		this.content = content;
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

	public String getDeltai_addr() {
		return deltai_addr;
	}

	public void setDeltai_addr(String deltai_addr) {
		this.deltai_addr = deltai_addr;
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

	public String getH_job() {
		return h_job;
	}

	public void setH_job(String h_job) {
		this.h_job = h_job;
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

	public String getH_pay() {
		return h_pay;
	}

	public void setH_pay(String h_pay) {
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ResumeDTO [idx=" + idx + ", normal_idx=" + normal_idx + ", name=" + name + ", gender=" + gender
				+ ", age=" + age + ", addr=" + addr + ", deltai_addr=" + deltai_addr + ", email=" + email + ", tel="
				+ tel + ", subject=" + subject + ", grade=" + grade + ", h_local1=" + h_local1 + ", h_local2="
				+ h_local2 + ", h_job=" + h_job + ", h_period=" + h_period + ", h_workday=" + h_workday
				+ ", h_worktime=" + h_worktime + ", h_pay=" + h_pay + ", h_pay_category=" + h_pay_category
				+ ", content=" + content + ", status=" + status + "]";
	}
	
	
}
