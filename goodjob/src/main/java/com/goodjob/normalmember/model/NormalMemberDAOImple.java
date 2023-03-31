package com.goodjob.normalmember.model;

import java.util.HashMap;
import java.util.Map;

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
	public NormalMemberDTO norLogin(String id, String pwd) {
		// TODO Auto-generated method stub
		Map<String, String>map=new HashMap<String, String>();
		map.put("id",id);
		map.put("pwd", pwd);
		return sqlMap.selectOne("norLogin", map);
	}
	@Override
	public int norUpdate(NormalMemberDTO dto) {
		// TODO Auto-generated method stub
		sqlMap.update("norUpdate", dto);
		return 0;
	}
}
