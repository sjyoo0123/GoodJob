package com.goodjob.normalmember.model;

public interface NormalMemberDAO {
	public int normalJoin(NormalMemberDTO dto);

	public NormalMemberDTO getNorMember(int idx);
}
