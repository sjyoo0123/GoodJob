package com.goodjob.notice.model;

import java.util.List;
import java.util.*;

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
@Override
public List<NoticeDTO> noticeComList(int idx,int cp,int ls) {
	int start=(cp-1)*ls+1;
	int end=cp*ls;
	Map map=new HashMap();
	map.put("start", start);
	map.put("end", end);
	map.put("idx", idx);
	List<NoticeDTO> lists=sqlMap.selectList("comNoticeList",map);
	return lists;
}
@Override
public int noticeTotalCnt(int idx) {
	int count=sqlMap.selectOne("noticeTotalCnt",idx);
	return count;
}
@Override
public NoticeDTO noticeContent(int idx) {
	NoticeDTO dto=sqlMap.selectOne("noticeContent",idx);
	return dto;
}
@Override
public int noticeDel(int idx) {
	int count=sqlMap.update("noticeDel", idx);
	return count;
}

}
