package com.goodjob.companymember.model;

public interface CompanyMemberDAO {
public int comJoin(CompanyMemberDTO dto);
public CompanyMemberDTO comLogin(String id,String pwd);
public int comUpdate(CompanyMemberDTO dto);
}
