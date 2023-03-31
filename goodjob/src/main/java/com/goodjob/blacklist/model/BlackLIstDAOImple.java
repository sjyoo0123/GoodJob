package com.goodjob.blacklist.model;

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
}
