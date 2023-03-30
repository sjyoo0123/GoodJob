package com.goodjob.companymember.model;

import org.mybatis.spring.SqlSessionTemplate;

public class CompanyMemberDAOImple implements CompanyMemberDAO {
	private SqlSessionTemplate sqlMap;

	@Override
	public int comJoin(CompanyMemberDTO dto) {
		// TODO Auto-generated method stub
		return sqlMap.insert("comJoin", dto);
	}
	@Override
	public CompanyMemberDTO comInfo(int idx) {
		CompanyMemberDTO dto=sqlMap.selectOne("comInfo", idx);
		return dto;
	}
}
