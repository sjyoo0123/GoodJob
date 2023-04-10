package com.goodjob.notice.model;

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
@Override
public List<NoticeDTO> manNoticeStatusList(int cp, int ls) {
	
	Map map=new HashMap();
	int start=(cp-1)*ls+1;
	int end=cp*ls;
	map.put("start", start);
	map.put("end", end);
	
	List<NoticeDTO> lists=sqlMap.selectList("manNoticeStatusList", map);
	
	return lists;
}
@Override
public List<NoticeDTO> manNoticeAcceptList(int cp, int ls) {

	Map map=new HashMap();
	int start=(cp-1)*ls+1;
	int end=cp*ls;
	map.put("start", start);
	map.put("end", end);
	
	List<NoticeDTO> lists=sqlMap.selectList("manNoticeAcceptList", map);
	
	return lists;
}

@Override
public int manNoticeStatusCnt() {
	
	int count=sqlMap.selectOne("manNoticeStatusCnt");
	
	return count;
}
@Override
public NoticeDTO manNoticeAcceptContent(int idx) {
	
	NoticeDTO dto=sqlMap.selectOne("manNoticeAcceptContent",idx);
	
	return dto;
}
@Override
public int manNoticeAcceptContent_No(int idx) {
	
	int count=sqlMap.update("manNoticeAcceptContent_No", idx);
	
	return count;
}
@Override
public int manNoticeAcceptContent_Ok(int idx) {
	
	int count=sqlMap.update("manNoticeAcceptContent_Ok", idx);
	
	return count;
}
@Override
public int manNoticeDel(int idx) {
	
	int count=sqlMap.update("manNoticeDel", idx);
	
	return count;
}

@Override
public List<NoticeDTO> manNoticeDelList(int cp, int ls) {
	
	Map map=new HashMap();
	int start=(cp-1)*ls+1;
	int end=cp*ls;
	map.put("start", start);
	map.put("end", end);
	
	List<NoticeDTO> lists=sqlMap.selectList("manNoticeDelList", map);
	
	return lists;
}
@Override
public int manNoticeCnt() {
	
	int count=sqlMap.selectOne("manNoticeCnt");
	
	return count;
}
}
