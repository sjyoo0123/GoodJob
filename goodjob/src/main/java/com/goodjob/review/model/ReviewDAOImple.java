package com.goodjob.review.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ReviewDAOImple implements ReviewDAO {

	private SqlSessionTemplate sqlMap;

	public ReviewDAOImple() {
		// TODO Auto-generated constructor stub
	}

	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	

	@Override
	public List<ReviewDTO> reviewList() {
		List<ReviewDTO> list = sqlMap.selectList("reviewList");
		return list;
	}

	@Override
	public int reviewWrite(ReviewDTO dto) {

		int count = sqlMap.insert("reviewWrite");
		return count;

	}

}
