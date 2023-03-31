package com.goodjob.notice.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class NoticeDAOImple implements NoticeDAO {

	private SqlSessionTemplate sqlMap;
	
public NoticeDAOImple() {
	// TODO Auto-generated constructor stub
}
public NoticeDAOImple(SqlSessionTemplate sqlMap) {
	super();
	this.sqlMap = sqlMap;
}
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}


	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	@Override
	public int noticeWrite(NoticeDTO dto) {
		int result=sqlMap.insert("noticeWrite",dto);
		return result;
	}
	public List<NoticeDTO> noticeList(int cp){
		Map<String,String>map=new HashMap<String, String>();
		map.put("cp", null);
		return sqlMap.selectList("noticeList");
	}

}
