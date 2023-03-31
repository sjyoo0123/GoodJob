package com.goodjob.review.model;

import java.util.List;

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
	
	@Override
	public List<ReviewDTO> reviewList() {
		List<ReviewDTO> list = sqlMap.selectList("reviewList");
		return list;
	}
	
}
