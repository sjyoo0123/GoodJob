package com.goodjob.totalfile.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class TotalFileDAOImple implements TotalFileDAO {

	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}



	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}



	@Override
	public int manFileAdd(Map map) {
		
		
		
		int count=sqlMap.insert("manFileAdd", map);
		
		return count;
	}
	
	@Override
	public int manFileUpdate(TotalFileDTO dto) {
		
		int count=sqlMap.update("manFileUpdate", dto);
		
		return count;
	
	}
	
	@Override
	public int manFileDel(int idx) {
		
		int count=sqlMap.delete("manFileDel", idx);
		
		return count;
	}
	
	@Override
	public String noticeFile(int idx) {
		String path=sqlMap.selectOne("noticeFile",idx);
		return path;
	}
	@Override
	public int noticeFileUpdate(Map map) {
		int result=sqlMap.update("noticeFileUpdate", map);
		return result;
	}
}
