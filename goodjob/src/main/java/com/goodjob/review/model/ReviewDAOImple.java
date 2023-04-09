package com.goodjob.review.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

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
		List<ReviewDTO> list = sqlMap.selectList("reviewList");
		return list;
	}

	@Override
	public List<ReviewDTO> reviewList2() {
		Map map = new HashMap();
		List<ReviewDTO> list = reviewDao.reviewList();
		map.put("com_name", list);

		List<ReviewDTO> list2 = sqlMap.selectList("reviewList2", map);
		return list2;

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

}
