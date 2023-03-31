package com.goodjob.notice.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class NoticeDAOImple implements NoticeDAO {

	private SqlSessionTemplate sqlMap;
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	public NoticeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public int noticeWrite(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}
	public List<NoticeDTO> noticeList(int cp){
		Map<String,String>map=new HashMap<String, String>();
		map.put("cp", null);
		return sqlMap.selectList("noticeList");
	}

}
