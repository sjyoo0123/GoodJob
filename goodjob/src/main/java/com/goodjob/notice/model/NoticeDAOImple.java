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
	public List<NoticeDTO> noticeComList(int idx, int cp, int ls) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("idx", idx);
		List<NoticeDTO> lists = sqlMap.selectList("comNoticeList", map);
		return lists;
	}

	@Override
	public int noticeTotalCnt(int idx) {
		int count = sqlMap.selectOne("noticeTotalCnt", idx);
		return count;
	}

	@Override
	public NoticeDTO noticeContent(int idx) {
		NoticeDTO dto = sqlMap.selectOne("noticeContent", idx);
		return dto;
	}

	@Override
	public int noticeDel(int idx) {
		int count = sqlMap.update("noticeDel", idx);
		return count;
	}

	@Override
	public List<NoticeDTO> whereNoticeList(String workday, String[] local2, String[] local3, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Object> map = whereMap(workday, local2, local3);
		map.put("start", start);
		map.put("end", end);
		return sqlMap.selectList("whereNoticeList", map);
	}
	@Override
	public int whereNoticeTotalCnt(String workday, String[] local2, String[] local3) {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("whereNoticeTotalCnt", whereMap(workday, local2, local3));
	}
	public Map<String, Object> whereMap(String workday, String[] local2, String[] local3) {
		Map<String, Object> map = new HashMap<String, Object>();
		if ((local2.length != 0 || local3.length != 0)) {
			map.put("boolean1", true);
			if (local2.length != 0) {
				map.put("boolean2", true);
			} else {
				map.put("boolean2", false);
			}
			if (local2.length == 0 && local3.length != 0) {
				map.put("boolean4", false);
			} else {
				map.put("boolean4", true);
			}
			if (local3.length != 0) {
				map.put("boolean3", true);
			} else {
				map.put("boolean3", false);
			}
		} else {
			map.put("boolean1", false);
		}
		map.put("workday", workday);
		map.put("local2", local2);
		map.put("local3", local3);
		return map;
	}
}
