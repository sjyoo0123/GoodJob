package com.goodjob.resume.model;

import com.goodjob.career.model.CareerDTO;

public class ResumeCareerDTO {
	ResumeDTO dto;
	CareerDTO[] cdto;
	
	public ResumeCareerDTO() {
		// TODO Auto-generated constructor stub
	}
	public ResumeCareerDTO(ResumeDTO rdto, CareerDTO[] cdto) {
		super();
		this.dto = dto;
		this.cdto = cdto;
	}
	public ResumeDTO getRdto() {
		return dto;
	}
	public void setRdto(ResumeDTO rdto) {
		this.dto = dto;
	}
	public CareerDTO[] getCdto() {
		return cdto;
	}
	public void setCdto(CareerDTO[] cdto) {
		this.cdto = cdto;
	}
	
	
}
