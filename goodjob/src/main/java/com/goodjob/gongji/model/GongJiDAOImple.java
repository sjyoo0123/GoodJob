package com.goodjob.gongji.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class GongJiDAOImple implements GongJiDAO {
	private SqlSessionTemplate sqlMap;
	public GongJiDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public List<GongJiDTO> userGongJiList() {
		// TODO Auto-generated method stub
		
		return sqlMap.selectList("userGongJiList");
	}
	@Override
	public GongJiDTO gongJiContent(int idx) {
		// TODO Auto-generated method stub
		
		return sqlMap.selectOne("gongJiContent", idx);
	}
	@Override
	public int gongJiInsert(GongJiDTO dto) {
		int result=sqlMap.insert("manGongjiInsert", dto);
		return result;
	}
	@Override
	public int gongJiUpdate(GongJiDTO dto) {
		int result=sqlMap.update("manGongjiUpdate", dto);
		return result;
	}
	@Override
	public int gongJiDel(int idx) {
		int result=sqlMap.delete("manGongjiDel", idx);
		return result;
	}
	@Override
	public List<GongJiDTO> manGongjiList(Map map) {
		List<GongJiDTO> lists=sqlMap.selectList("manGongjiList",map);
		return lists;
	}
	@Override
	public int manGongjiListTotalCnt() {
		int total=sqlMap.selectOne("manGongjiListTotalCnt");
		return total;
	}
}
