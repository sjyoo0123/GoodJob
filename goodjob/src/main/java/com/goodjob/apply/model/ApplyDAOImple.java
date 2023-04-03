package com.goodjob.apply.model;

import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;

public class ApplyDAOImple implements ApplyDAO {
	private SqlSessionTemplate sqlMap;
	public ApplyDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	public ApplyDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public List<ApplyDTO> apComList(int idx, int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("idx", idx);
		List<ApplyDTO> lists=sqlMap.selectList("apComList", map);
		return lists;
	}

}
