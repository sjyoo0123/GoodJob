package com.goodjob.gongji.model;

import java.util.HashMap;
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
	public List<GongJiDTO> userGongJiList(String subject,int start, int end) {
		// TODO Auto-generated method stub
		Map<String,Object> map=mapping(subject);
		map.put("start",start);
		map.put("end",end);
		return sqlMap.selectList("userGongJiList",map);
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
	public int userGongJiTotalCnt(String subject) {
		// TODO Auto-generated method stub
		
		return sqlMap.selectOne("userGongJiTotalCnt", mapping(subject));
	}
	public Map<String,Object> mapping(String subject){
		Map<String, Object>map=new HashMap<String, Object>();
		if(subject.length()!=0) {
			map.put("subject", subject);
			map.put("sboolean", true);
		}else {
			map.put("sboolean", false);
		}
		return map;
	}
}
