package com.goodjob.offer.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;


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

}
