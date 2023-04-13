package com.goodjob.offer.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.goodjob.notice.model.NoticeDTO;


public class OfferDAOImple implements OfferDAO {
	private SqlSessionTemplate sqlMap;

	public OfferDAOImple() {
		// TODO Auto-generated constructor stub
	}

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	public OfferDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public List<OfferDTO> ofComList(int idx, int cp, int ls) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("idx", idx);
		List<OfferDTO> lists = sqlMap.selectList("ofComList", map);
		return lists;

	}
	@Override
	public int offerTotalCnt(int idx) {
		int count=sqlMap.selectOne("offerTotalCnt",idx);
		return count;
	}
	@Override // 제안받은 개인
	public List<NoticeDTO> ofNorList(int member_idx, int cp, int ls) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		Map map = new HashMap();
		map.put("member_idx", member_idx);
		map.put("start", start);
		map.put("end", end);
		List<NoticeDTO> list = sqlMap.selectList("ofNorList",map);
		return list;
	}
	
	@Override //개인용 total조회
	public int offerNorTotalCnt(int member_idx) {
		int count=sqlMap.selectOne("offerNorTotalCnt",member_idx);		
		return count;
	}
	@Override
	public int ofNorGetCheck(int member_idx, int offer_idx) {
		Map map = new HashMap();
		map.put("member_idx", member_idx);
		map.put("offer_idx", offer_idx);
		int count = sqlMap.update("ofNorGetCheck", map);
		return count;
	}
	@Override
	public int offerSubmit(OfferDTO dto) {
		int result=sqlMap.insert("offerSubmit", dto);
		return result;
	}
}
