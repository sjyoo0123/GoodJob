package com.goodjob.singo.model;

import org.mybatis.spring.SqlSessionTemplate;

public class SinGoDAOImple implements SinGoDAO {
	private SqlSessionTemplate sqlMap;
	public SinGoDAOImple() {
		// TODO Auto-generated constructor stub
	}
	public SinGoDAOImple(SqlSessionTemplate sqlMap) {
		// TODO Auto-generated constructor stub
		this.sqlMap = sqlMap;
	}
	@Override
public int sinGoWrite(SinGoDTO dto) {
	// TODO Auto-generated method stub
		sqlMap.insert("sinGoWrite");
	return 0;
}
}
