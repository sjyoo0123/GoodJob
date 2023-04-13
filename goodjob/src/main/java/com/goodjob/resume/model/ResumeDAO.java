package com.goodjob.resume.model;

import com.goodjob.career.model.CareerDTO;
import com.goodjob.member.model.MemberDTO;
import com.goodjob.review.model.ReviewDTO;

public interface ResumeDAO {
	
	public MemberDTO resumeWriteForm(int idx);
	public ReviewDTO resumeWriteForm1(int idx);
	public int resumeWrite(ResumeDTO dto);
	public int resumeWrite2(ResumeDTO dto, CareerDTO cto);
	public ResumeDTO resumeDown(int idx);
	public CareerDTO resumeCarrerDown(int idx);
	public ResumeDTO resumeContent(int idx);
	public int resumeUpdate(ResumeDTO dto);
	public int careerUpdate(ResumeDTO dto, CareerDTO cto);
	
}
