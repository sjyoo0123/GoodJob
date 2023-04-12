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
		int result = sqlMap.insert("noticeWrite", dto);
		return result;
	}


	@Override
	public List<NoticeDTO> noticeComList(int idx, int cp, int ls,String status) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("idx", idx);
		map.put("status", status);
		List<NoticeDTO> lists = sqlMap.selectList("comNoticeList", map);
		return lists;
	}

	@Override
	public int noticeTotalCnt(int idx,String status) {
		Map map = new HashMap();
		map.put("idx", idx);
		map.put("status", status);
		int count = sqlMap.selectOne("noticeTotalCnt", map);
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


	

	@Override
	public List<NoticeDTO> whereNoticeList(String workday, String[] local2, String[] local3,String[] job, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Object> map = whereMap(workday, local2, local3,job);
		map.put("start", start);
		map.put("end", end);
		return sqlMap.selectList("whereNoticeList", map);
	}
	@Override
	public int whereNoticeTotalCnt(String workday, String[] local2, String[] local3,String[] job) {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("whereNoticeTotalCnt", whereMap(workday, local2, local3,job));
	}
	public Map<String, Object> whereMap(String workday, String[] local2, String[] local3,String[] job) {
		Map<String, Object> map = new HashMap<String, Object>();
		if ((local2.length != 0 || local3.length != 0)) {
			map.put("boolean1", true);
			if (local2.length != 0) {
				map.put("boolean2", true);
			} else {
				map.put("boolean2", false);
			}
			if (local2.length != 0 && local3.length != 0) {
				map.put("boolean4", true);
			} else {
				map.put("boolean4", false);
			}
			if (local3.length != 0) {
				map.put("boolean3", true);
			} else {
				map.put("boolean3", false);
			}
		} else {
			map.put("boolean1", false);
		}
		if(job.length !=0) {
			map.put("boolean5", true);
		}else {
			map.put("boolean5", false);
			
		}
		map.put("workday", workday);
		map.put("local2", local2);
		map.put("local3", local3);
		map.put("job", job);
		return map;
	}
	@Override
	public int noticeUpdate(NoticeDTO dto) {
		int result=sqlMap.update("noticeUpdate", dto);
		return result;
	}

	@Override
	public List<NoticeDTO> comNoticeSubject(int idx) {
		List<NoticeDTO> list=sqlMap.selectList("comNoticeSubject",idx);
		return list;
	}
}
