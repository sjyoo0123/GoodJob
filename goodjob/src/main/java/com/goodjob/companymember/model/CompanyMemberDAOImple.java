package com.goodjob.companymember.model;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class CompanyMemberDAOImple implements CompanyMemberDAO {
	private SqlSessionTemplate sqlMap;

	
	public CompanyMemberDAOImple() {
		// TODO Auto-generated constructor stub
	}

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	public CompanyMemberDAOImple(SqlSessionTemplate sqlMap) {
		// TODO Auto-generated constructor stub
		this.sqlMap = sqlMap;
	}

	@Override
	public int comJoin(CompanyMemberDTO dto) {
		// TODO Auto-generated method stub
		return sqlMap.insert("comJoin", dto);
	}


	@Override
	public CompanyMemberDTO getComMember(int idx) {
		// TODO Auto-generated method stub
		
		return sqlMap.selectOne("getComMember", idx);
	}

	@Override
	public CompanyMemberDTO comInfo(int idx) {
		CompanyMemberDTO dto=sqlMap.selectOne("comInfo", idx);
		return dto;
	}
	@Override
	public int comUpdate(CompanyMemberDTO dto) {
		// TODO Auto-generated method stub
		int count =sqlMap.update("comUpdate", dto);
		return count;
	}

}
