package com.goodjob.one_one.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

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
	public int manOneAnswer(One_OneDTO dto) {
		
		int count=sqlMap.update("manOneAnswer", dto);
		
		return count;
	}
	
	@Override
	public List<One_OneDTO> manOneSearch(int cp, int ls, String search) {
		
		Map map=new HashMap();
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		search="";
		map.put("start", start);
		map.put("end", end);
		map.put("search", search);
		
		
		List<One_OneDTO> lists=sqlMap.selectList("manOneSearch", map);
		
		return lists;
	}
	@Override
	public List<One_OneDTO> userOneList(int idx, int cp, int ls) {
		// TODO Auto-generated method stub
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("idx",idx);
		map.put("start", start);
		map.put("end", end);
		return sqlMap.selectList("userOneList", map);
	}
	@Override
	public int userOneWrite(One_OneDTO dto) {
		// TODO Auto-generated method stub
		return sqlMap.insert("userOneWrite", dto);
	}
	@Override
	public One_OneDTO userOneContent(int idx) {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("userOneContent",idx);
	}
	@Override
	public int userOneReWrite(One_OneDTO dto) {
		// TODO Auto-generated method stub
		return sqlMap.update("userOneReWrite", dto);
	}
	
@Override
public int userOneTotalCnt(int idx) {
	// TODO Auto-generated method stub
	return sqlMap.selectOne("userOneCnt",idx);
}
	
}
