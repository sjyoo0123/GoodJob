package com.goodjob.notice.model;

import java.sql.Date;

public class NoticeDTO {

	private int idx;
	private int plan_idx;
	private int com_idx;
	private String subject;
	private String gender;
	private int min_age;
	private int max_age;
	private String grade;
	private String job;
	private String service_type;
	private String recruit;
	private String period;
	private String workday;
	private int starttime;
	private int finishtime;
	private String pay_category;
	private int pay_hour;
	private int pay_month;
	private int worktime;
	private String local1;
	private String local2;
	private String local3;
	private String detail_addr;
	private String x;
	private String y;
	private String com_name;
	private String manager_name;
	private String manager_tel;
	private String manaber_email;
	private String content;
	private Date writedate;
	private Date deadline;
	private int ref;
	private String status;
	
	public NoticeDTO() {
		super();
	}
	
	public NoticeDTO(int idx, int plan_idx, int com_idx, String subject, String gender, int min_age, int max_age,
			String grade, String job, String service_type, String recruit, String period, String workday, int starttime,
			int finishtime, String pay_category, int pay_hour, int pay_month, int worktime, String local1,
			String local2, String local3, String detail_addr, String x, String y, String com_name, String manager_name,
			String manager_tel, String manaber_email, String content, Date writedate, Date deadline, int ref,
			String status) {
		super();
		this.idx = idx;
		this.plan_idx = plan_idx;
		this.com_idx = com_idx;
		this.subject = subject;
		this.gender = gender;
		this.min_age = min_age;
		this.max_age = max_age;
		this.grade = grade;
		this.job = job;
		this.service_type = service_type;
		this.recruit = recruit;
		this.period = period;
		this.workday = workday;
		this.starttime = starttime;
		this.finishtime = finishtime;
		this.pay_category = pay_category;
		this.pay_hour = pay_hour;
		this.pay_month = pay_month;
		this.worktime = worktime;
		this.local1 = local1;
		this.local2 = local2;
		this.local3 = local3;
		this.detail_addr = detail_addr;
		this.x = x;
		this.y = y;
		this.com_name = com_name;
		this.manager_name = manager_name;
		this.manager_tel = manager_tel;
		this.manaber_email = manaber_email;
		this.content = content;
		this.writedate = writedate;
		this.deadline = deadline;
		this.ref = ref;
		this.status = status;
	}


	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getCom_idx() {
		return com_idx;
	}

	public void setCom_idx(int com_idx) {
		this.com_idx = com_idx;
	}

	public int getPlan_idx() {
		return plan_idx;
	}

	public void setPlan_idx(int plan_idx) {
		this.plan_idx = plan_idx;
	}

	public String getCom_name() {
		return com_name;
	}

	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getLocal1() {
		return local1;
	}

	public void setLocal1(String local1) {
		this.local1 = local1;
	}

	public String getLocal2() {
		return local2;
	}

	public void setLocal2(String local2) {
		this.local2 = local2;
	}

	public String getLocal3() {
		return local3;
	}

	public void setLocal3(String local3) {
		this.local3 = local3;
	}

	public String getDetail_addr() {
		return detail_addr;
	}

	public void setDetail_addr(String detail_addr) {
		this.detail_addr = detail_addr;
	}

	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}

	public int getPay_hour() {
		return pay_hour;
	}

	public void setPay_hour(int pay_hour) {
		this.pay_hour = pay_hour;
	}

	public int getPay_month() {
		return pay_month;
	}

	public void setPay_month(int pay_month) {
		this.pay_month = pay_month;
	}

	public String getPay_category() {
		return pay_category;
	}

	public void setPay_category(String pay_category) {
		this.pay_category = pay_category;
	}

	public int getWorktime() {
		return worktime;
	}

	public void setWorktime(int worktime) {
		this.worktime = worktime;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public String getWorkday() {
		return workday;
	}

	public void setWorkday(String workday) {
		this.workday = workday;
	}

	public int getStarttime() {
		return starttime;
	}

	public void setStarttime(int starttime) {
		this.starttime = starttime;
	}

	public int getFinishtime() {
		return finishtime;
	}

	public void setFinishtime(int finishtime) {
		this.finishtime = finishtime;
	}

	public Date getDeadline() {
		return deadline;
	}

	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getMin_age() {
		return min_age;
	}

	public void setMin_age(int min_age) {
		this.min_age = min_age;
	}

	public int getMax_age() {
		return max_age;
	}

	public void setMax_age(int max_age) {
		this.max_age = max_age;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getRecruit() {
		return recruit;
	}

	public void setRecruit(String recruit) {
		this.recruit = recruit;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getService_type() {
		return service_type;
	}

	public void setService_type(String service_type) {
		this.service_type = service_type;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getManager_name() {
		return manager_name;
	}

	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}

	public String getManager_tel() {
		return manager_tel;
	}

	public void setManager_tel(String manager_tel) {
		this.manager_tel = manager_tel;
	}

	public String getManaber_email() {
		return manaber_email;
	}

	public void setManaber_email(String manaber_email) {
		this.manaber_email = manaber_email;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "NoticeDTO [idx=" + idx + ", plan_idx=" + plan_idx + ", com_idx=" + com_idx + ", subject=" + subject
				+ ", gender=" + gender + ", min_age=" + min_age + ", max_age=" + max_age + ", grade=" + grade + ", job="
				+ job + ", service_type=" + service_type + ", recruit=" + recruit + ", period=" + period + ", workday="
				+ workday + ", starttime=" + starttime + ", finishtime=" + finishtime + ", pay_category=" + pay_category
				+ ", pay_hour=" + pay_hour + ", pay_month=" + pay_month + ", worktime=" + worktime + ", local1="
				+ local1 + ", local2=" + local2 + ", local3=" + local3 + ", detail_addr=" + detail_addr + ", x=" + x
				+ ", y=" + y + ", com_name=" + com_name + ", manager_name=" + manager_name + ", manager_tel="
				+ manager_tel + ", manaber_email=" + manaber_email + ", content=" + content + ", writedate=" + writedate
				+ ", deadline=" + deadline + ", ref=" + ref + ", status=" + status + "]";
	}


	
	
}
