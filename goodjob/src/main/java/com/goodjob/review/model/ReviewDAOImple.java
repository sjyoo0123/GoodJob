package com.goodjob.review.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.goodjob.resume.model.ResumeDTO;

public class ReviewDAOImple implements ReviewDAO {
	@Autowired
	public ReviewDAO reviewDao;

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
		List<ReviewDTO> dto = sqlMap.selectList("reviewList");
		return dto;
	}

	@Override
	public ResumeDTO reviewList2(String com_name) {
		ResumeDTO dto= sqlMap.selectOne("reviewList2" , com_name);
		
		
		
		
		return dto;

	}

	@Override
	public int reviewWrite(ReviewDTO dto) {
		int count = 0;

		String getKeyword = dto.getKeyword();
		String[] getKeyDetail = getKeyword.split(",");

		int setReviewNum = dto.getReview_num();

		for (int i = 0; i < getKeyDetail.length; i++) {
			dto.setKeyword(getKeyDetail[i]);
			count = sqlMap.insert("reviewWrite", dto);
		}
		return count;

	}

	@Override
	public int reviewSetReviewNum() {
		int count = sqlMap.selectOne("reviewSetReviewNum");
		return count;
	}
	
	@Override
	public List<ReviewDTO> injaeList() {
		List<ReviewDTO> list = sqlMap.selectList("injaeList");
		return list;
	}
	/**나의 후기*/
	@Override
	public List<ReviewDTO> myReview() {
		List<ReviewDTO> list = sqlMap.selectList("myReview");
		return list;
	}
}
