package com.goodjob.normalmember.model;

import org.mybatis.spring.SqlSessionTemplate;

public class NormalMemberDAOImple implements NormalMemberDAO {
	private SqlSessionTemplate sqlMap;

	@Override
	public int normalJoin(NormalMemberDTO dto) {
		// TODO Auto-generated method stub
		
		return sqlMap.insert("normalJoin", dto);
	}
}
