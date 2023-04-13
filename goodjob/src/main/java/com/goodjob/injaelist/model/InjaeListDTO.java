package com.goodjob.injaelist.model;

public class InjaeListDTO {

	private int idx;
	private int member_idx;
	private String name;
	private int age;
	private String gender;
	private String h_job;
	public InjaeListDTO() {
		// TODO Auto-generated constructor stub
	}
	public InjaeListDTO(int idx, int member_idx, String name, int age, String gender, String h_job) {
		super();
		this.idx = idx;
		this.member_idx = member_idx;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.h_job = h_job;
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getH_job() {
		return h_job;
	}
	public void setH_job(String h_job) {
		this.h_job = h_job;
	}
	@Override
	public String toString() {
		return "InjaeListDTO [idx=" + idx + ", member_idx=" + member_idx + ", name=" + name + ", age=" + age
				+ ", gender=" + gender + ", h_job=" + h_job + "]";
	}
	
}
