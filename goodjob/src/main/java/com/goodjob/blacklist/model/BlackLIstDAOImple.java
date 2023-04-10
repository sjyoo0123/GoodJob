package com.goodjob.blacklist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.goodjob.member.model.MemberDTO;

public class BlackLIstDAOImple implements BlackListDAO {

	private SqlSessionTemplate sqlMap;
	
	public BlackLIstDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	@Override
	public List<MemberDTO> manBlackListGet(Map map) {
		List<MemberDTO> lists=sqlMap.selectList("manBlackListGet", map);
		return lists;
	}
	@Override
	public int manBlackListTotalCnt(String category) {
		int num=sqlMap.selectOne("manBlackListGetTotalCnt", category);
		return num;
	}
	@Override
	public List<BlackListDTO> manBlackListContent(Map map) {
		List<BlackListDTO> lists=sqlMap.selectList("manBlackListContent", map);
		return lists;
	}
	@Override
	public String manBlackListGetName(int idx) {
		String name=sqlMap.selectOne("manBlackListGetName", idx);
		return name;
	}
	@Override
	public int manBlackListContentTotalCnt(int idx) {
		int total=sqlMap.selectOne("manBlackListContentTotalCnt", idx);
		return total;
	}
	@Override
	public int manBlackListDel(int idx) {
		int result=sqlMap.update("manBlackListDel", idx);
		return result;
	}
	@Override
	public int manBlackListSingoDel(int idx) {
		int result=sqlMap.update("manBlackListSingoDel", idx);
		return result;
	}
	@Override
	public List<BlackListDTO> manBlackListSingoList(Map map) {
		List<BlackListDTO> lists=sqlMap.selectList("manBlackListSingoList", map);
		return lists;
	}
	@Override
	public int manBlackListSingoTotalCnt(String category) {
		int total=sqlMap.selectOne("manBlackListSingoListTotalCnt", category);
		return total;
	}
	@Override
	public int manBlackListUpdateSingoCount(int idx) {
		Map<String,Integer> map=new HashMap<String,Integer>();
		map.put("num1", idx);
		map.put("num2", idx);
		int result=sqlMap.update("manBlackListUpdateSingoCount", map);
		return result;
	}
	@Override
	public int manBlackListAdd(int idx) {
		int result=sqlMap.update("manBlackListAdd", idx);
		return result;
	}
	@Override
	public int manBlackListSingoCheckUpdate(int idx) {
		int result=sqlMap.update("manBlackListSingoCheckUpdate",idx);
		return result;
	}
}
