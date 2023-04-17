package com.goodjob.apply.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;

import com.goodjob.normalmember.model.NormalMemberDTO;
import com.goodjob.notice.model.NoticeDTO;

public class ApplyDAOImple implements ApplyDAO {
	private SqlSessionTemplate sqlMap;

	public ApplyDAOImple() {
		// TODO Auto-generated constructor stub
	}

	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}

	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	public ApplyDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public List<NoticeDTO> apComList(int idx, int cp, int ls) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		map.put("idx", idx);
		List<NoticeDTO> lists = sqlMap.selectList("apComList", map);
		return lists;
	}

	@Override
	public int applyTotalCnt(int idx) {
		int count = sqlMap.selectOne("applyTotalCnt", idx);
		return count;
	}

	@Override
	public int apNorInsert(ApplyDTO dto) {
		int count = sqlMap.insert("apNorInsert", dto);
		return count;
	}

	@Override
	public NormalMemberDTO apNorGet(int member_idx) {
		NormalMemberDTO dto = sqlMap.selectOne("apNorGet", member_idx);
		return dto;
	}

	@Override
	public int apNorButtonHide(int notice_idx, int member_idx) {
		Map map = new HashedMap();
		map.put("notice_idx", notice_idx);
		map.put("member_idx", member_idx);
		int count = sqlMap.selectOne("apNorButtonHide", map);
		return count;
	}
	@Override
	public List<NoticeDTO> apNorlist(int member_idx, int cp,int ls) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		map.put("start", start);
		map.put("end", end);
		map.put("member_idx", member_idx);
		List<NoticeDTO> list = sqlMap.selectList("apNorList", map);
		return list;
	}
	@Override
	public int applyNorTotalCnt(int member_idx) {
		int count = sqlMap.selectOne("applyNorTotalCnt", member_idx);
		return count;
	}
	@Override
	public int applyCheck(int idx) {
		int count = sqlMap.update("applyCheck",idx);
		return count;
	}
	
}
