package com.goodjob.companymember.model;


public interface CompanyMemberDAO {
public int comJoin(CompanyMemberDTO dto);

public CompanyMemberDTO getComMember(int idx);
}
