package com.goodjob.normalmember.model;



import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.goodjob.companymember.model.CompanyMemberDTO;


public class NormalMemberDAOImple implements NormalMemberDAO {
	private SqlSessionTemplate sqlMap;
	public NormalMemberDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public NormalMemberDAOImple(SqlSessionTemplate sqlMap) {
		// TODO Auto-generated constructor stub
		this.sqlMap=sqlMap;
	}
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public int normalJoin(NormalMemberDTO dto) {
		// TODO Auto-generated method stub
		return sqlMap.insert("normalJoin", dto);
	}
	@Override
	public NormalMemberDTO norLogin(String id, String pwd) {
		// TODO Auto-generated method stub
		
		return null;
	}
	@Override
	public int norUpdate(NormalMemberDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public NormalMemberDTO getNorMember(int idx) {
		// TODO Auto-generated method stub
		
		return sqlMap.selectOne("getNorMember", idx);
	}
}
