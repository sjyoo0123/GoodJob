package com.goodjob.companymember.model;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class CompanyMemberDAOImple implements CompanyMemberDAO {
	private SqlSessionTemplate sqlMap;

	public CompanyMemberDAOImple() {
		// TODO Auto-generated constructor stub
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
	public CompanyMemberDTO comLogin(String id, String pwd) {
		// TODO Auto-generated method stub
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		return sqlMap.selectOne("comLogin", map);
	}

	@Override
	public int comUpdate(CompanyMemberDTO dto) {
		// TODO Auto-generated method stub
		sqlMap.update("comUpdate", dto);
		return 0;
	}

	@Override
	public CompanyMemberDTO getComMember(int idx) {
		// TODO Auto-generated method stub
		
		return sqlMap.selectOne("getComMember", idx);
	}

}
