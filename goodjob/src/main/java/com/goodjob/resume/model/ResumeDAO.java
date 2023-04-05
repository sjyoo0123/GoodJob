package com.goodjob.resume.model;

import com.goodjob.career.model.CareerDTO;

public interface ResumeDAO {
	
	public int resumeWrite(ResumeDTO dto);
	public int resumeWrite2(ResumeDTO dto, CareerDTO cto);
}
