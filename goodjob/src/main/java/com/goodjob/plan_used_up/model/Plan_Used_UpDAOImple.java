package com.goodjob.plan_used_up.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.goodjob.notice.model.NoticeDTO;

public class Plan_Used_UpDAOImple implements Plan_Used_UpDAO {
	
	private SqlSessionTemplate sqlMap;

	public Plan_Used_UpDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public Plan_Used_UpDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int comUpCount(int idx) {
		int count=sqlMap.selectOne("comUpCount",idx);
		return count;
	}
	@Override
	public int comUpCountUse(int idx) {
		int count=sqlMap.update("comUpCountUse", idx);	
		return count;
	}
	@Override
	public List<NoticeDTO> comUsedUP(int idx, int cp, int ls) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("idx", idx);
		List<NoticeDTO> lists=sqlMap.selectList("comUsedUP",map);
		return lists;
	}
}
