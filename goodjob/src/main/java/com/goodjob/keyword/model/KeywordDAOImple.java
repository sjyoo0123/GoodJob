package com.goodjob.keyword.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class KeywordDAOImple implements KeywordDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public KeywordDAOImple() {
		
	}
	
	public KeywordDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
@Override
	public List<KeywordDTO> reviewWriteForm() {
	List<KeywordDTO> list = sqlMap.selectList("reviewWriteForm");
	return list;
	}
}
