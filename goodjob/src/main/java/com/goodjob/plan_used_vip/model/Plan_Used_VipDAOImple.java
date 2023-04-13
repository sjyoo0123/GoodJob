package com.goodjob.plan_used_vip.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

import com.goodjob.notice.model.NoticeDTO;

public class Plan_Used_VipDAOImple implements Plan_Used_VipDAO {
	
	private SqlSessionTemplate sqlMap;
	public Plan_Used_VipDAOImple() {
		// TODO Auto-generated constructor stub
	}
public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
public Plan_Used_VipDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
@Override
public List<NoticeDTO> comUsedVIP(int idx, int cp, int ls) {
	int start = (cp - 1) * ls + 1;
	int end = cp * ls;
	Map map = new HashMap();
	map.put("start", start);
	map.put("end", end);
	map.put("idx", idx);
	List<NoticeDTO> lists=sqlMap.selectList("comUsedVIP",map);
	return lists;
}

@Override
public int manPlanUsedAdd_vip(Map map) {
	
	int result=sqlMap.insert("manPlanUsedAdd_vip", map);
	
	return result;
}
@Override
public int manPlanUsedIdx_Currval() {
	
	int result=sqlMap.selectOne("manPlanUsedIdx_Currval");
	
	return result;
}
@Override
public int manPlanUsedAdd_two(Map map) {

	int result=sqlMap.selectOne("manPlanUsedAdd_two", map);
	
	return result;
}

@Override
public int usedVipCount(int idx) {
	int count=sqlMap.selectOne("usedVipCount",idx);
	return count;
}
@Override
public Plan_Used_VipDTO usedVipCon(int idx) {
	Plan_Used_VipDTO dto=sqlMap.selectOne("usedVipCon",idx);
	return dto;
}
}
