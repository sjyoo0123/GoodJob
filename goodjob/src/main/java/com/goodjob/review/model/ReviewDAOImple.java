package com.goodjob.review.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public ResumeDTO reviewList2(String com_name, int member_idx, int cp,int ls) {
		Map map = new HashMap();
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		map.put("start", start);
		map.put("end", end);
		map.put("member_idx", member_idx);
		map.put("com_name", com_name);
		ResumeDTO dto = sqlMap.selectOne("reviewList2", map);

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

	@Override // 인재정보
	public List<ReviewDTO> injaeList() {
		List<ReviewDTO> list = sqlMap.selectList("injaeList");
		return list;
	}

	/** 나의 후기 */
	@Override
	public List<ReviewDTO> myReview(int member_idx) {
		List<ReviewDTO> list = sqlMap.selectList("myReview", member_idx);
		return list;
	}

	@Override // 리뷰 삭제
	public int reviewDel(int member_idx, int review_num) {
		Map map = new HashMap();
		map.put("member_idx", member_idx);
		map.put("review_num", review_num);
		int count = sqlMap.update("reviewDel", map);
		return count;
	}
	@Override
	public int reviewTotalCnt(String com_name) {
		int count = sqlMap.selectOne("reviewTotalCnt", com_name);
		return count;
	}
	@Override
	public ResumeDTO myReviewList(String com_name) {
		Map map = new HashMap();
		map.put("com_name", com_name);
		ResumeDTO dto = sqlMap.selectOne("myReviewList", map);
		return dto;
	}
	
	
}
