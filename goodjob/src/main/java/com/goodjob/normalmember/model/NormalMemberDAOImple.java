package com.goodjob.normalmember.model;



import org.mybatis.spring.SqlSessionTemplate;

import com.goodjob.review.model.ReviewDTO;


public class NormalMemberDAOImple implements NormalMemberDAO {
	private SqlSessionTemplate sqlMap;
	public NormalMemberDAOImple() {
		// TODO Auto-generated constructor stub
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
	public NormalMemberDTO getNorMember(int idx) {
		// TODO Auto-generated method stub
		
		return sqlMap.selectOne("getNorMember", idx);
	}
	@Override
	public  ReviewDTO resumeWriteForm1() {
		
		return sqlMap.selectOne("resumeWriteForm1");
	}
}
