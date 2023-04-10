package com.goodjob.member.model;

public interface MemberDAO {
	public int memberJoin(MemberDTO dto);
	public MemberDTO login(String id,String pwd,String user_category);
	public int memberUpdate(Object dto);
	public int idCheck(String id);
	public int emailCheck(String email);
	public MemberDTO resumeWriteForm();
	public int updateStatus(MemberDTO dto);
}
