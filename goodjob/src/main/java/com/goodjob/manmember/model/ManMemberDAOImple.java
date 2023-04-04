package com.goodjob.manmember.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.goodjob.companymember.model.CompanyMemberDTO;
import com.goodjob.member.model.MemberDTO;

public class ManMemberDAOImple implements ManMemberDAO {

	private SqlSessionTemplate sqlMap;
	
	public ManMemberDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}


	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}


	@Override
	public List<MemberDTO> manMemberList(Map map) {
		List<MemberDTO> lists=sqlMap.selectList("manMemberList", map);
		return lists;
	}
	@Override
	public int manMemberListTotalCnt() {
		int total=sqlMap.selectOne("manMemberListTotalCnt");
		return total;
	}
	@Override
	public CompanyMemberDTO manMemberContent(int idx) {
		CompanyMemberDTO dto=sqlMap.selectOne("manMemberContent",idx);
		return dto;
	}
}
