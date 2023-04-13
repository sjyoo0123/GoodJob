package com.goodjob.normalmember.model;



import org.mybatis.spring.SqlSessionTemplate;


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
	public int norUpdate(NormalMemberDTO dto) {
		// TODO Auto-generated method stub
		int count= sqlMap.update("norUpdate", dto);
		return count;
	}

}
