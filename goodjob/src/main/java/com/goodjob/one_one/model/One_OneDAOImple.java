package com.goodjob.one_one.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class One_OneDAOImple implements One_OneDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	
	
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public int manOneAllCnt() {
		
		int count=sqlMap.selectOne("manOneAllCnt");
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public List<One_OneDTO> manOneList(int cp, int ls) {
		
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		
		Map map=new HashMap();
		
		map.put("start", start);
		map.put("end", end);
		
		
		List<One_OneDTO> lists=sqlMap.selectList("manOneList", map);
		
		return lists;
	}
	
	@Override
	public One_OneDTO manOneContent(int idx) {
		
		One_OneDTO dto=sqlMap.selectOne("manOneContent", idx);
		
		return dto;
	}

	@Override
	public int manFAQAnswer(One_OneDTO dto) {
		
		int count=sqlMap.update("manOneAnswer", dto);
		
		return count;
	}
	@Override
	public One_OneDTO UserOneList(int idx, int cp, int ls) {
		// TODO Auto-generated method stub
		
		return null;
	}
}
