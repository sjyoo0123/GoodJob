package com.goodjob.singo.model;

import org.mybatis.spring.SqlSessionTemplate;

public class SinGoDAOImple implements SinGoDAO {
	private SqlSessionTemplate sqlMap;
	public SinGoDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
public int sinGoWrite(SinGoDTO dto) {
	// TODO Auto-generated method stub
		
	return sqlMap.insert("sinGoWrite");
}
}
