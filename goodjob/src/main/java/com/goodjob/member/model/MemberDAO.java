package com.goodjob.member.model;

public interface MemberDAO {
	public int memberJoin(MemberDTO dto);
	public MemberDTO login(String id,String pwd,String user_category);
	public int memberUpdate(Object dto);
	public int idCheck(String id);
	public MemberDTO emailCheck(String email);
	public MemberDTO resumeWriteForm();
	public int updateStatus(MemberDTO dto);
	public MemberDTO selectIdx(int idx);
	public String findId(String email);
	public int findPwd(String id,String email);
	public int updatePwd(String pwd,String idx);
}