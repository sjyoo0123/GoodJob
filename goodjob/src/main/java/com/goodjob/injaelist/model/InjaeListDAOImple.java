package com.goodjob.injaelist.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class InjaeListDAOImple implements InjaeListDAO {

	SqlSession sqlMap;
	public InjaeListDAOImple() {
		// TODO Auto-generated constructor stub
	}
	public SqlSession getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSession sqlMap) {
		this.sqlMap = sqlMap;
	}
	@Override
	public List<InjaeListDTO> injaeListGet(Map map) {
		List<InjaeListDTO> lists=sqlMap.selectList("injaeListGet", map);
		return lists;
	}
	@Override
	public int injaeListTotalCnt(Map map) {
		int total=sqlMap.selectOne("injaeListTotalCnt", map);
		return total;
	}
}
