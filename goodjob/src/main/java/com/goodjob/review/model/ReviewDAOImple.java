package com.goodjob.review.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ReviewDAOImple implements ReviewDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public ReviewDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public ReviewDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
//	@Override
//	public List<KeywordDTO> reviewWriteShow(KeywordDTO dto) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//	@Override
//	public List<KeywordDTO> reviewWriteShow(KeywordDTO dto) {
//		List<KeywordDTO> list = sqlMap.selectList("reviewWriteShow");
//		return list;
//	}
//	
}
