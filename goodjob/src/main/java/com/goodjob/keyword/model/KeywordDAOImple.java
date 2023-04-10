package com.goodjob.keyword.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class KeywordDAOImple implements KeywordDAO {

	private SqlSessionTemplate sqlMap;

	public KeywordDAOImple() {

	}

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public List<KeywordDTO> reviewWriteForm() {
		List<KeywordDTO> list = sqlMap.selectList("reviewWriteForm");
		return list;
	}

	@Override
	public int manKeywordAdd(KeywordDTO dto) {
		
		int count=sqlMap.insert("manKeywordAdd", dto);
		
		return count;
	}
	
	@Override
	public int manKeywordDel(int idx) {

		int count=sqlMap.update("manKeywordDel", idx);
		
		return count;
	}
	
	@Override
	public List<KeywordDTO> manKeywordList() {
		
		List<KeywordDTO> lists=sqlMap.selectList("manKeywordList");
		
		return lists;
	}
}
