package com.goodjob.normalmember.model;

import com.goodjob.review.model.ReviewDTO;

public interface NormalMemberDAO {
	public int normalJoin(NormalMemberDTO dto);

	public NormalMemberDTO getNorMember(int idx);

	public ReviewDTO resumeWriteForm1();
}
